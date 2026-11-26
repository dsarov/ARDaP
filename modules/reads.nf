/*
======================================================================
      Part 1B: create synthetic reads from assembled genomes
======================================================================
*/

process Read_synthesis {

    label "art"
    tag "$assembly.baseName"

    input:
    tuple val(id), path(assembly)

    output:
    tuple val(id), path("${assembly.baseName}_1_cov.fq.gz"), path("${assembly.baseName}_2_cov.fq.gz"), emit: reads

    script:
    """
    art_illumina -i ${assembly} -p -l 150 -f 30 -m 500 -s 10 -ss HS25 -na -o ${assembly.baseName}_out
    mv ${assembly.baseName}_out1.fq ${assembly.baseName}_1_cov.fq
    mv ${assembly.baseName}_out2.fq ${assembly.baseName}_2_cov.fq
    gzip ${assembly.baseName}_1_cov.fq
    gzip ${assembly.baseName}_2_cov.fq

    """
}

/*
=======================================================================
   Part 2A: Trim reads with light quality filter and remove adapters
   (only called when --notrim false; otherwise reads go straight to alignment)
=======================================================================
*/

process Trimmomatic {

    label "trimmomatic"
    tag "$id"

    input:
    tuple val(id), path(reads)

    output:
    tuple val(id), path("${id}_?.fq.temp.gz"), emit: reads

    script:
    // reads is one file (single-end) or two files (paired-end)
    def rl = reads instanceof List ? reads : [reads]
    if (rl.size() == 1) {
    """
    trimmomatic SE -threads $task.cpus ${rl[0]} ${id}_1.fq.temp.gz \
    ILLUMINACLIP:${projectDir}/resources/trimmomatic/all_adapters.fa:2:30:10: \
    LEADING:10 TRAILING:10 SLIDINGWINDOW:4:15 MINLEN:36
    """
    } else {
    """
    trimmomatic PE -threads $task.cpus ${rl[0]} ${rl[1]} \
    ${id}_1.fq.temp.gz ${id}_1_u.fq.gz ${id}_2.fq.temp.gz ${id}_2_u.fq.gz \
    ILLUMINACLIP:${projectDir}/resources/trimmomatic/all_adapters.fa:2:30:10: \
    LEADING:10 TRAILING:10 SLIDINGWINDOW:4:15 MINLEN:36
    rm ${id}_1_u.fq.gz ${id}_2_u.fq.gz
    """
    }
}

/*
=======================================================================
   Part 2B-2D: Downsample reads, align, ResFinder, remove duplicates
=======================================================================
Down-sampling, de-duplication and the mosdepth coverage step all run inside this one job,
so the aligned BAM never has to be copied to shared storage and read back.
seqtk sample keeps a random reservoir and can only write once it has read the whole
input, so sampling cannot be streamed into bwa; the sampled reads are written as plain FASTQ
instead (no gzip), and bwa and ResFinder both read that file.
Reads synthesised from assemblies are already the right size, so they skip sampling (size 0).
*/

process ReferenceAlignment {

    label "alignment"
    tag "$id"
    publishDir "./Outputs/Resfinder", mode: 'copy', pattern: "*_resfinder.txt", overwrite: true
    publishDir "./Outputs/bams", mode: 'copy', pattern: "*.bam*", overwrite: false

    input:
    path ref_index
    path refcov
    tuple val(id), path(reads), val(sample_n)

    output:
    tuple val(id), path("${id}.dedup.bam"), path("${id}.dedup.bam.bai"), emit: bam
    tuple val(id), path("output.per-base.bed.gz"), path("${id}.depth.txt"), emit: coverage
    tuple val(id), path("${id}_resfinder.txt"), emit: resfinder

    // bwa -> view -> sort are piped (no SAM / temp BAM on disk). pipefail makes sure a bwa
    // failure fails the task instead of leaving a truncated BAM. ResFinder only needs the reads,
    // so it runs at the same time as bwa instead of after it. [timer] lines show where time goes.
    script:
    // Java heap leaves 1 GB of the job's memory for ResFinder, which runs alongside MarkDuplicates
    def heap = Math.max(1, task.memory.toGiga() - 1)
    // reads is one file (single-end, --SE) or two files (paired-end). REV stays empty for single-end
    // reads, so every step below simply leaves the second file out.
    def rl = reads instanceof List ? reads : [reads]
    def fwd = rl[0]
    def rev = rl.size() > 1 ? rl[1] : ''
    """
    set -o pipefail
    step () { echo "[timer] \$1 at \${SECONDS}s"; }

    FWD=${fwd}
    REV=${rev}

    if [ ${sample_n} -gt 0 ]; then
      ( seqtk sample -s 11 \$FWD ${sample_n} > ${id}_1_cov.fq ) &
      pid1=\$!
      if [ -n "\$REV" ]; then
        ( seqtk sample -s 11 \$REV ${sample_n} > ${id}_2_cov.fq ) &
        pid2=\$!
      fi
      wait \$pid1
      if [ -n "\$REV" ]; then wait \$pid2; fi
      R1=${id}_1_cov.fq
      R2=""
      if [ -n "\$REV" ]; then R2=${id}_2_cov.fq; fi
    else
      R1=\$FWD
      R2=\$REV
    fi
    step "reads ready (down-sampling finished)"

    run_resfinder () {
      t0=\$SECONDS
      bash Run_resfinder.sh ${projectDir} \$R1 \${R2:-NONE} ${id}
      echo "[timer] ResFinder alone took \$((SECONDS - t0))s"
    }
    run_resfinder > resfinder.log 2>&1 &
    rf_pid=\$!

    bwa mem -R '@RG\\tID:${params.org}\\tSM:${id}\\tPL:ILLUMINA' -a \
    -t $task.cpus ref \$R1 \$R2 \
    | samtools view -u -q 1 -@ 1 - \
    | samtools sort -@ 2 -o ${id}.bam -
    step "bwa, view and sort finished"
    samtools index ${id}.bam
    step "BAM indexed"

    gatk --java-options -Xmx${heap}g MarkDuplicates -I "${id}.bam" -O ${id}.dedup.bam --REMOVE_DUPLICATES true \
    --METRICS_FILE ${id}.dedup.txt --VALIDATION_STRINGENCY LENIENT --ASSUME_SORT_ORDER coordinate
    samtools index ${id}.dedup.bam
    step "MarkDuplicates finished"

    mosdepth -t $task.cpus --by ${refcov} output ${id}.dedup.bam
    sum_depth=\$(zcat output.regions.bed.gz | awk '{print \$4}' | awk '{s+=\$1}END{print s}')
    total_chromosomes=\$(zcat output.regions.bed.gz | awk '{print \$4}' | wc -l)
    echo "\$sum_depth/\$total_chromosomes" | bc > ${id}.depth.txt
    step "coverage finished"

    wait \$rf_pid || { cat resfinder.log; echo "ERROR: ResFinder failed" >&2; exit 1; }
    cat resfinder.log
    step "ResFinder collected"
    rm -f ${id}_1_cov.fq ${id}_2_cov.fq ${id}.bam ${id}.bam.bai
    """
}
