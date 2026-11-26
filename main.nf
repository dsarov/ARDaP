#!/usr/bin/env nextflow

/*
 *
 *  Pipeline            ARDaP
 *  Version             v3
 *  Description         Antimicrobial resistance detection and prediction from WGS
 *  Authors             Derek Sarovich, Erin Price, Danielle Madden, Eike Steinig
 *
 *  Nextflow DSL2, strict syntax (needs Nextflow >= 25.10; tested on 24.10.5 and 26.10.7)
 *  Defaults for --hc_chunks, --SE and --fastq_se are in nextflow.config
 *
 */

include { IndexReference; MakeIntervals } from './modules/reference'
include { Read_synthesis; Trimmomatic; ReferenceAlignment } from './modules/reads'
include { VariantCalling; VariantCallingMixture; MixtureSummariesSQL; SqlSnpsIndelsMix; R_report; GWASInterrogate } from './modules/variants'
include { VariantCallingGVCF; Master_vcf; snp_matrix } from './modules/phylogeny'

workflow {

  main:

  // ---------------------------------------------------------------- help
  log.info """
  ===============================================================================
                             NF-ARDaP
                             v3.1 beta
  ================================================================================

  Optional Parameters:

      --fastq      Input PE read file wildcard (default: *_{1,2}.fastq.gz)

                   Currently this is set to $params.fastq

      --species    Species specific database for resistance determination
                   (default: Burkholderia_pseudomallei)

                   Currently you are using $params.species

      --assemblies Optionally include a directory of assembled genomes in the
                   analysis. Set this parameter to 'true' if you wish to included
                   assembled genomes and place all assembled genomes in a
                   subdirectory called 'assemblies'. (default: false)

                   Currently mixtures is set to $params.assemblies

      --SE         Also run single-end reads. ARDaP looks in a directory called SE
                   for files named sequence_name.fastq.gz and aligns the single
                   read only. Paired-end reads in the run directory are still
                   processed (default: false). Not available with --mixtures.

                   Currently SE is set to $params.SE

      --notrim     Although not generally recommended to switch off, set to true
                   if you want to skip the timmomatic step (default: false).
                   Currently notrim is set to $params.notrim

      --mixtures   Optionally perform within species mixtures analysis.
                   Set this parameter to 'true' if you are dealing with
                   multiple strains. (default: false)

                   Currently mixtures is set to $params.mixtures

      --size       ARDaP can optionally down-sample your read data to
                   run through the pipeline quicker. Please set to 0 to skip this step
                   (default: 1000000)

                   Currently you are using $params.size

      --phylogeny  Please include if you would like a whole genome
                   phylogeny (FastTree2) and merged annotation files.
                   Note that this may take some time if you have a large
                   number of isolates (default: false)

                   Currently phylogeny is set to $params.phylogeny

      --executor   Change this flag for running in a HPC scheduler environment.
                   Default behavior is to run without a scheduler but a
                   wide range of schedulers are supported with nextflow.
                   Some of the supported schedulers include sge, pbs, pbspro,
                   slurm, lsf, moab, nqsii. For a full list please visit the
                   nextflow documentation

                   Currently executor is set to $params.executor

      --fast       **Experimental**. Future implementation to only look at regions that
  	               may cause AMR rather than the whole genome. I expect this may impact on the
  		             performance of predicting structural variants.

                   Currently fast is set to $params.fast

      --hc_chunks  Number of pieces the genome is split into so that GATK HaplotypeCaller can
                   run on them at the same time inside one job (default: 4). The number
                   actually used is limited by the job's CPUs and memory (about 1.5 GB per
                   piece, so the default 4 GB job uses 2 pieces). Set to 1 for a single run.

                   Currently hc_chunks is set to $params.hc_chunks

      --gwas       **Experimental**. If you have a database of GWAS co-ordinates
                   ARDaP can interrogate SNPs and indels across the entire genome
                   to identify novel mutations likely contributing to an antibiotic
                   resistance phenotype. For more information about this feature,
                   please contact the developers.

                   Currently gwas is set to $params.gwas

  If you want to make changes to the default `nextflow.config` file
  clone the workflow into a local directory and change parameters
  in `nextflow.config`:

      nextflow clone dsarov/ardap outdir/

  Update to the local cache of this workflow:

      nextflow pull dsarov/ardap

  ==================================================================
  ==================================================================
  """

  // ------------------------------------- species-specific reference and database
  // Database.config columns: species, SnpEff database name, reference genome file
  def db_config = file("${projectDir}/Databases/Database.config")
  def db_row = db_config.readLines()
    .collect { line -> line.split('\t') as List }
    .find { cols -> cols.size() >= 3 && cols[0].trim() == params.species }
  if (db_row == null) {
    error "Species ${params.species} was not found in ${db_config}"
  }
  def snpeff_db = db_row[1].trim()
  def ref = db_row[2].trim()
  def reference_path = "${projectDir}/Databases/${snpeff_db}/${ref}"
  def resistance_db_path = "${projectDir}/Databases/${snpeff_db}/${snpeff_db}.db"

  // Look for paired-end reads. They are only mandatory when no assemblies are supplied.
  def has_reads = !files(params.fastq).isEmpty()

  // ---------------------------------------------------------------- inputs
  // Paired-end reads in the run directory are always processed. With --SE true, the single-end
  // reads in SE/sequence_name.fastq.gz are processed as well (sample id = sequence_name).
  def fastq = channel.empty()
  def n_inputs = 0

  if (has_reads) {
    fastq = fastq.mix(
      channel.fromFilePairs("${params.fastq}", flat: true)
        .map { id, f, r -> tuple(id, [f, r]) }
    )
    n_inputs += 1
  }

  if (params.SE) {
    if (params.mixtures) {
      error "--SE cannot be used together with --mixtures (the mixtures analysis needs paired-end insert sizes)"
    }
    if (!files(params.fastq_se).isEmpty()) {
      fastq = fastq.mix(
        channel.fromPath("${params.fastq_se}")
          .map { f -> tuple(f.name.replaceFirst(/\.fastq\.gz$/, ''), f) }
      )
      n_inputs += 1
    } else {
      log.warn "--SE true but no single-end reads found matching ${params.fastq_se}"
    }
  }

  if (n_inputs == 0 && !params.assemblies) {
    error """ Input read files could not be found.
Have you included the read files in the current directory and do they have the correct naming?
With the parameters specified, ARDaP is looking for paired reads named ${params.fastq}.
To fix this error either rename your reads to match this formatting or specify the desired format
when initializing ARDaP e.g. --fastq "*_{1,2}_sequence.fastq.gz"
For single-end reads use --SE true and place sequence_name.fastq.gz files in a directory called SE
If you only want to analyse assembled genomes, use --assemblies true --assembly_loc "assemblies/*.fasta"
"""
  }
  if (n_inputs == 0) {
    log.info "No reads found. Running with assemblies only."
  }

  def resistance_database_file = file(resistance_db_path)
  if( !resistance_database_file.exists() ) {
    error "The resistance database file does no exist: ${resistance_db_path}"
  }

  def reference_file = file(reference_path)
  if( !reference_file.exists() ) {
    error """
ARDaP can't find the reference file.
It is currently looking for this file --> ${reference_path}
Please check that this reference exists in ${projectDir}/Databases/
If this file doesn't exist either ARDaP is not configured to run with this reference/species
or there was an error during the installation process and ARDaP needs to be re-installed
"""
  }

  def patient_meta_file = file(params.patientMetaData)
  if( !patient_meta_file.exists() ) {
    error "The specified patient metadata file does not exist: ${params.patientMetaData}"
  }

  // ------------------------------------------------------------- reference
  IndexReference(reference_file)

  // The interval list is only used by --fast runs without --mixtures. Everything else passes the
  // reference as a placeholder so the process input is still satisfied (staged as intervals.list).
  def intervals_ch = channel.value(reference_file)
  if (params.fast && !params.mixtures) {
    MakeIntervals(resistance_database_file, snpeff_db)
    intervals_ch = MakeIntervals.out.intervals
  }

  // ------------------------------------------------------------------ reads
  // With --notrim true (the default) there is nothing to trim, so reads go straight to alignment
  def reads_ch = fastq
  if (!params.notrim) {
    Trimmomatic(fastq)
    reads_ch = Trimmomatic.out.reads
  }

  // sample_n: reads to keep per file (0 = use all reads, e.g. reads synthesised from assemblies)
  def align_in = reads_ch.map { id, r -> tuple(id, r, params.size) }

  if (params.assemblies) {
    def assembly_ch = channel
      .fromPath("${params.assembly_loc}", checkIfExists: true)
      .map { f -> tuple(f.baseName, f) }
    Read_synthesis(assembly_ch)
    align_in = align_in.mix( Read_synthesis.out.reads.map { id, f, r -> tuple(id, [f, r], 0) } )
  }

  // ------------------------------------------- alignment, dedup, coverage, ResFinder
  ReferenceAlignment(IndexReference.out.index, IndexReference.out.bed, align_in)

  // ---------------------------------------------------------------- variants
  if (params.mixtures) {

    if (params.gwas) {
      log.warn "--gwas is not available together with --mixtures and will be skipped"
    }

    VariantCallingMixture(
      reference_file,
      IndexReference.out.fai,
      IndexReference.out.dict,
      ReferenceAlignment.out.bam.join(ReferenceAlignment.out.resfinder),
      snpeff_db
    )

    MixtureSummariesSQL(
      VariantCallingMixture.out.annotated
        .join(VariantCallingMixture.out.pindel_d)
        .join(VariantCallingMixture.out.pindel_td)
        .join(VariantCallingMixture.out.resfinder)
    )

    SqlSnpsIndelsMix(
      MixtureSummariesSQL.out.effects
        .join(MixtureSummariesSQL.out.function_lost)
        .join(MixtureSummariesSQL.out.deletions)
        .join(MixtureSummariesSQL.out.duplications)
        .join(MixtureSummariesSQL.out.resfinder),
      resistance_database_file,
      patient_meta_file
    )

    R_report(SqlSnpsIndelsMix.out.report_inputs)

  } else {

    // Samples are joined by id, so one sample can never be paired with another sample's files
    VariantCalling(
      reference_file,
      IndexReference.out.fai,
      IndexReference.out.dict,
      intervals_ch,
      ReferenceAlignment.out.bam
        .join(ReferenceAlignment.out.coverage)
        .join(ReferenceAlignment.out.resfinder),
      resistance_database_file,
      patient_meta_file,
      snpeff_db
    )

    if (params.gwas) {
      GWASInterrogate(
        VariantCalling.out.annotated_snps.join(VariantCalling.out.annotated_indels),
        resistance_database_file
      )
    }
  }

  // --------------------------------------------------------------- phylogeny
  if (params.phylogeny) {
    VariantCallingGVCF(
      reference_file,
      IndexReference.out.fai,
      IndexReference.out.dict,
      ReferenceAlignment.out.bam
    )
    Master_vcf(
      VariantCallingGVCF.out.gvcf.map { _id, gvcf -> gvcf }.collect(),
      reference_file,
      IndexReference.out.fai,
      IndexReference.out.dict
    )
    snp_matrix(Master_vcf.out.vcfs, snpeff_db)
  }

  onComplete:
  println ( workflow.success ? "\nDone! Result files are in --> ./Outputs\n \
  Antibiotic resistance reports are in --> ./Outputs/AbR_reports\n \
  If further analysis is required, bam alignments are in --> ./Outputs/bams\n \
  Phylogenetic tree and annotated merged variants are in --> ./Outputs/Phylogeny_and_annotation\n \
  Individual variant files are in --> ./Outputs/Variants/VCFs\n" \
  : "Oops .. something went wrong" )
}
