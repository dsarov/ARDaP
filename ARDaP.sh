#!/bin/bash

#####################################################
# 
# Thanks for using ARDaP!!
#
# USAGE: ARDaP.sh <parameters, required> -r <reference, without .fasta extension> -v <Variant genome file. Name must match the SnpEff database>
# 
#
# ARDaP by default expects reads to be paired end, in the following format: STRAIN_1_sequence.fastq.gz for the first pair and STRAIN_2_sequence.fastq.gz for the second pair. 
# Reads not in this format will be ignored.
# If your data are not paired, you must set the -p parameter to SE to denote unpaired reads. By default -p is set to PE.
#
# ARDaP expects at least a reference file in FASTA format. 
# For compatibility with all programs in ARDaP, FASTA files should conform to the specifications listed here: http://www.ncbi.nlm.nih.gov/BLAST/blastcgihelp.shtml
# Note that the use of nucleotides other than A, C, G, or T is not supported by certain programs in ARDaP and these should not be used in reference FASTA files. 
# In addition, Picard, GATK and SAMtools handle spaces within contig names differently. Therefore, please avoid using spaces or special characters (e.g. $/*) in contig names.
# 
# By default all read files present in the current working directory will be processed. 
# Sequence files within current directory will be aligned against the reference using BWA, SNPs and indels will be called with GATK and a SNP 
# matrix will be generated with GATK and a phylogenetic tree generate with paup
# 
#
# Written by Derek Sarovich and Erin Price - University of the Sunshine Coast, Queensland, Australia
# Please send bug reports to dereksarovich@gmail.com
# Version 1.2
#
#################################################################
usage()
{
echo -e  "\n\n\n\nThanks for using ARDaP v1.0
\nUsage:
   ARDaP.sh -r|--reference <reference, without .fasta extension> -d|--database <Species specific database for resistance determination>
   
Optional Parameter:

  -g|--gwas       Perform genome wide association analysis (yes/no)
  -m|--mixtures   Optionally perform within species mixtures analysis. Set this parameter to yes if you are dealing with multiple strains (yes/no)
  -s|--size       ARDaP can optionally down-sample your read data to run through the pipeline quicker. 
  -m|--mixtures   This feature is currently experimental. ARDaP will assume that your data is a mixture of multiple strains and attempt to call resistance in that mixture (yes/no)
  -p|--phylogeny  Please switch to 'yes' if you would like a whole genome phylogeny. Not that this may take a long time if you have a large number of isolates (yes/no)\n

  ARDaP requires at least a reference genome and the name of the associated database
  
  For example:
  ARDaP.sh --reference Pa_PA01 --database Pseudomonas_aeruginosa_pao1 --gwas no
  
  Optionally, if you do not wish to run the associated GWAS component please specify -g to no\n\n\n\n"
  
}

help()
{
usage
cat << _EOF_ 

ARDaP requires a reference in FASTA format and for this to be specified with the -r flag. Please do not include the .fasta extension in the reference name.

FASTA files should conform to the specifications listed here: http://www.ncbi.nlm.nih.gov/BLAST/blastcgihelp.shtml. Some programs used within ARDaP do not allow the use of IUPAC codes and these should not be used in reference FASTA files.

By default, ARDaP will process all sequence data in the present working directory.

By default, ARDaP expects reads to be paired-end (PE) Illumina data, named in the following format: STRAIN_1_sequence.fastq.gz for the first pair and STRAIN_2_sequence.fastq.gz for the second pair. Reads not in this format will be ignored by ARDaP.

Sequences will be aligned against the reference using BWA. SNPs and indels will be called with GATK and a SNP matrix will be generated with GATK and VCFTools.

If you do not wish to run the genome wide association component, please set the --gwas flag to "no"

For a more detailed description of how to use ARDaP and its capability, refer to the ARDaP manual

_EOF_

}

#Define path to ARDaP install
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

if  [ $# -lt 1 ]
    then
	    usage
		exit 1
fi

# source dependencies
source "$SCRIPTPATH"/ARDaP.config 
source "$SCRIPTPATH"/scheduler.config

#declare variables
declare -rx SCRIPT=${0##*/}
declare ref
org=haploid
seq_directory="$PWD"
gwas=yes
matrix=yes
annotate=yes
strain=all
tech=Illumina
pairing=PE
#variant_genome=Pseudomonas_aeruginosa_pao1
window=10000
indel_merge=yes
tri_tetra_alelic=no
antibiotic_res=yes
CARD_db=CARD_db #CARD reference fasta
mixtures=no
phylogeny=no
size=6000000 #Equivalent of a 6Mbp genome
# Examine individual options
while [ "$1" != "" ]; do
    case $1 in
        -r | --reference )      shift
                                ref=$1
                                ;;
        -d | --database )       shift
                                variant_genome=$1
                                ;;
		-s | --size )     		shift 
								size=$1
								;;
		-g | --gwas )			shift
								gwas=$1
								;;
		-m | --mixtures	)		shift
								mixtures=$1
								;;
		-p | --phylogeny )      shift
                                phylogeny=$1		
								;;
        -h | --help )           help
                                exit
                                ;;
        * )                     help
                                exit 1
    esac
    shift
done
  
echo -e "\nThe following parameters will be used\n"
echo -e "-------------------------------------\n"
echo "Reference genome = $ref"
echo "Output directory and directory containing sequence files = $seq_directory"
echo "Variant genome specified for SnpEff = $variant_genome"
echo "Interrogate mixtures? = $mixtures"
echo -e "-------------------------------------\n\n"


if [ ! "$PBS_O_WORKDIR" ]; then
        PBS_O_WORKDIR="$seq_directory"
fi

cd "$PBS_O_WORKDIR"


size=$(echo "$size/4" | bc)

## file checks and program checks
##Variant genome and database checks


RESISTANCE_DB="$SCRIPTPATH"/Databases/"$variant_genome"/"$variant_genome".db 
CARD_DB="$SCRIPTPATH"/Databases/"$variant_genome"/"$variant_genome"_CARD.db

if [ ! -s "$RESISTANCE_DB" ]; then
  echo "Couldn't find the main database for $variant_genome"
  echo "Please make sure both the main database file and the CARD database file are located here --> $SCRIPTPATH/Databases/$variant_genome/"
  echo "Please fix this error and re-run. ARDaP is now exiting"
  exit 1
fi

if [ ! -s "$CARD_DB" ]; then
  echo "Couldn't find the CARD database for $variant_genome"
  echo "Please make sure both the main database file and the CARD database file are located here --> $SCRIPTPATH/Databases/$variant_genome/"
  echo "Please fix this error and re-run. ARDaP is now exiting"
  exit 1
fi


if [ ! -s "$ref".fasta ]; then
        echo -e "Couldn't locate reference file."
		echo "Checking for file specified with .fasta"
		if [ -s "$ref" ]; then
		  echo "Found with .fasta extension. Great"
		  ref=$(echo "$ref" | sed 's/\.fasta//g')
		else
		  echo "Still couldn't find reference. Please make sure that reference file is in the analysis directory,\n you have specified the reference name correctly\n"
          exit 1
		fi
    else
	    echo -e "Found FASTA file\n"
fi

ref_index=${seq_directory}/${ref}.bwt #index file created with BWA
REF_INDEX_FILE=${seq_directory}/${ref}.fasta.fai #index created with SAMtools
REF_BED=${seq_directory}/${ref}.bed
REF_DICT=${seq_directory}/${ref}.dict #Dictionary file created with Picard tools

ref_blank_lines=`grep -c '^$' $ref.fasta`

if [ "$ref_blank_lines" != 0 ]; then
	    echo -e "ERROR: Reference FASTA file is formatted incorrectly and must contain 0 blank lines. Blank lines will cause BWA and GATK to fail."
        exit 1
    else
	    echo -e "FASTA file looks to contain no blank lines. Good.\n"
fi

## Test for dependencies required by ARDaP
bwa_test=`command -v "$BWA"`
samtools_test=`command -v "$SAMTOOLS"`
bedtools_test=`command -v "$BEDTOOLS"`
vcftools_test=`command -v "$VCFTOOLS"`
vcfmerge_test=`command -v "$VCFMERGE"`
bgzip_test=`command -v "$BGZIP"`
tabix_test=`command -v "$TABIX"`
#java_test=`command -v "$JAVA"` # Need to add Java version checker for GATK #TODO

if [ -z "$bwa_test" ]; then
	    echo "ERROR: ARDaP requires BWA to function. Please make sure the correct path is specified in ARDaP.config"
		exit 1
fi

##bwa version test
#get BWA version
"$BWA" &> bwa_temp.txt
BWA_VERSION=`cat bwa_temp.txt | grep 'Version' | awk '{ print $2 }' |cut -d'.' -f 2`
if [ "$BWA_VERSION" -lt 7 ]; then
	echo "ARDaP only works with versions of bwa > v0.7 as we have switched to the bwa mem algorithm. Exiting"
	exit 1
fi

rm bwa_temp.txt

if [ -z "$samtools_test" ]; then
	    echo "ERROR: ARDaP requires SAMtools to function. Please make sure the correct path is specified in ARDaP.config"
		exit 1
fi
if [ ! -f "$GATK" ]; then
	    echo "ERROR: ARDaP requires the Genome Analysis toolkit and java to function. Please make sure the correct path is specified in ARDaP.config"
		exit 1
fi
if [ -z "$bedtools_test" ]; then
	    echo "ERROR: ARDaP requires  BEDtools to function. Please make sure the correct path is specified in ARDaP.config"
		exit 1
fi
if [ "$annotate" == yes ]; then
    if [ ! -f "$SNPEFF" ]; then
	        echo "ERROR: ARDaP requires SnpEff to function. Please make sure the correct path is specified in ARDaP.config"
		    exit 1
    fi
fi
if [ -z "$vcftools_test" ]; then
	    echo "ERROR: ARDaP requires VCFtools to function. Please make sure the correct path is specified in ARDaP.config"
		exit 1
fi
if [ -z "$vcfmerge_test" ]; then
	    echo "ERROR: ARDaP requires vcf-merge to function. Please make sure the correct path is specified in ARDaP.config"
		exit 1
fi
if [ -z "$bgzip_test" ]; then
	    echo "ERROR: ARDaP requires bgzip to function. Please make sure the correct path is specified in ARDaP.config"
		exit 1
fi
if [ -z "$tabix_test" ]; then
	    echo "ERROR: ARDaP requires tabix to function. Please make sure the correct path is specified in ARDaP.config"
		exit 1
fi
#if [ -z "$java_test" ]; then
	   # echo "ERROR: ARDaP requires java. Please make sure java is available on your system"
		#exit 1
#fi

### Handling and checks for read files
if [ "$strain" == all ]; then
    sequences_tmp=(`find $PBS_O_WORKDIR/*_1_sequence.fastq.gz -printf "%f "`)
    sequences_rename=("${sequences_tmp[@]/_1_sequence.fastq.gz/}")
	IFS=$'\n' sequences=($(sort <<<"${sequences_rename[*]}"))
	unset IFS
    n=${#sequences[@]}
	
    if [ $n == 0 ]; then
        echo -e "Program couldn't find any sequence files to process"
        echo -e "Sequences must be in the format STRAIN_1_sequence.fastq.gz STRAIN_2_sequence.fastq.gz for paired end reads"
    	echo -e "and STRAIN_1_sequence.fastq.gz for single end data\n"
	    exit 1
    else
        echo -e "Sequences have been loaded into ARDaP\n"
    fi
fi

## check for read pairing and correct notation #need to test
if [ "$pairing" == PE -a "$strain" == all ]; then
	sequences_tmp2=(`find $PBS_O_WORKDIR/*_2_sequence.fastq.gz -printf "%f "`)
    sequences2_rename=("${sequences_tmp2[@]/_2_sequence.fastq.gz/}")
	IFS=$'\n' sequences2=($(sort <<<"${sequences2_rename[*]}"))
	unset IFS
    n2=${#sequences2[@]}
	
    if [ $n != $n2 ]; then
	    echo "Number of forward reads don't match number of reverse reads. Please check that for running in PE mode all read files have correctly named pairs"
		exit 1
	fi
	for (( i=0; i<n; i++ )); do
	    if [ ${sequences[$i]} != ${sequences2[$i]} ]; then
            echo "Names of forward reads don't match names of reverse reads. Please check that for running in PE mode all read files have correctly named pairs"
			echo -e "The offending read pair is ${sequences[$i]} and ${sequences2[$i]}\n"
			#echo "Forward read names are ${sequences[@]}"
			#echo "Reverse read names are ${sequences2[@]}"
            exit 1
        fi
    done;
fi

## error checking for strain variable. Makes sure that if a single strain is specified that the read data is present

#to do 
#include if n == 1 and matrix == yes then exit
if [ "$strain" != all -a "$strain" != none ]; then
    sequences="$strain"
	echo -e "ARDaP will process the single strain $strain.\n"
	if [ "$matrix" == yes ]; then
	    matrix=no
		echo -e "ARDaP will not run SNP matrix with only one strain specified. If a SNP matrix is desired please run ARDaP with more strains or if strains have already been run link the SNP VCF and BAM files to the appropriate directories and set -s to none.\n"
	fi
	if [ "$pairing" == PE ]; then
	    if [ ! -s ${strain}_1_sequence.fastq.gz ]; then
		    echo -e "ERROR: ARDaP cannot find sequence file ${strain}_1_sequence.fastq.gz\n"
			echo -e "Please make sure the correct sequence reads are in the sequence directory\n"
			exit 1
        fi
		if [ ! -s ${strain}_2_sequence.fastq.gz ]; then
		    echo -e "ERROR: ARDaP cannot find sequence file ${strain}_2_sequence.fastq.gz\n"
			echo -e "Please make sure the correct sequence reads are in the sequence directory\n"
			exit 1
        fi
	fi
	if [ "$pairing" == SE ]; then
		if [ ! -s ${strain}_1_sequence.fastq.gz ]; then
		    echo -e "ERROR: ARDaP cannot find sequence file ${strain}_1_sequence.fastq.gz\n"
			echo -e "Please make sure the correct sequence reads are in the sequence directory\n"
			exit 1
        fi
	fi
fi	
	
#to do. Needs to have an n > 1 check before the test	
	
if [ "$matrix" == no -a "$indel_merge" == yes ]; then
    echo -e "Indel merge has been requested. As this cannot be determine without creation of a SNP matrix the matrix variable has been set to yes\n"
	matrix=yes
fi
	
	## create directory structure
	

if [ ! -d "$seq_directory"/BEDcov ]; then
    mkdir "$seq_directory"/BEDcov
fi
#if [ ! -d "$seq_directory"/tmp ]; then
#	mkdir "$seq_directory"/tmp
#fi
if [ ! -d "$seq_directory"/Outputs ]; then
	mkdir "$seq_directory"/Outputs
fi
if [ ! -d "$seq_directory"/Outputs/SNPs_indels_PASS ]; then
	mkdir "$seq_directory"/Outputs/SNPs_indels_PASS
fi
if [ ! -d "$seq_directory"/Outputs/SNPs_indels_FAIL ]; then
	mkdir "$seq_directory"/Outputs/SNPs_indels_FAIL
fi
if [ ! -d "$seq_directory"/Outputs/Comparative ]; then
	mkdir "$seq_directory"/Outputs/Comparative
fi
if [ ! -d "$seq_directory"/logs ]; then
	mkdir "$seq_directory"/logs
fi
if [ ! -d "$seq_directory"/Outputs/CARD ]; then
    mkdir "$seq_directory"/Outputs/CARD
fi
if [ ! -d "$seq_directory"/Outputs/AbR_reports ]; then
    mkdir "$seq_directory"/Outputs/AbR_reports
fi
if [ ! -d "$seq_directory"/Clean_reads ]; then
    mkdir "$seq_directory"/Clean_reads
fi
if [ ! -d "$seq_directory"/Outputs/Annotated_variants ]; then
    mkdir "$seq_directory"/Outputs/Annotated_variants
fi

#Copy CARD database to current directory
if [ ! -s CARD_db.fasta ]; then
  cp "$SCRIPTPATH"/Databases/CARD/nucleotide_fasta_protein_homolog_model.fasta CARD_db.fasta
fi

# checking variables for the annotation module

if [ "$annotate" == yes ]; then
    grep "$variant_genome" "$SNPEFF_CONFIG" &> /dev/null
    status=$?
    if [ ! "$status" == 0 ]; then
        echo "ARDaP couldn't find the reference genome in the SnpEff config file" 
		echo "The name of the annotated reference genome specified with the -v switch must match a reference genome in the SnpEff database"
        echo "Does the SnpEff.config file contain the reference specified with the -v switch?"
		echo "Is the SnpEff.config file in the location specified by ARDaP.config?"
	    echo "If both of these parameters are correct please refer to the SnpEff manual for further details on the setup of SnpEff"
		exit 1
    else
        echo -e "ARDaP found the reference file in the SnpEff.config file\n" 
    fi
	
	#test to see if the chromosome names in the SnpEff database match those of the reference file
	
	CHR_NAME=`$JAVA -jar $SNPEFF dump "$variant_genome" | grep -A1 'Chromosomes' | tail -n1 | awk '{print $2}'|sed "s/'//g"`
	REF_CHR=`head -n1 "$ref".fasta | sed 's/>//'`  
	if [ "$CHR_NAME" == "$REF_CHR" ]; then
	    echo -e "Chromosome names in the SnpEff database match the reference chromosome names, good\n"
	else
	    echo -e "Chromosome names in the SnpEff database DON'T match the reference chromosome names.\n"
		echo -e "Please change the names of the reference file to match those in the SnpEff database.\n"
		echo -e "If you are unsure what these are, run: $JAVA -jar $SNPEFF dump $variant_genome\n"
		echo -e "The first chromosome name is $CHR_NAME.\n\n"
                echo -e "If you choose to continue the annotation component of ARDaP may fail.\n"
                echo -e "Do you want to continue?\n"
                echo -e "Type Y to continue or anything else to exit\n"
                read ref_test
                if [ "$ref_test" == "Y" -o "$ref_test" == "y" -o "$ref_test" == "yes" ]; then
                   echo -e "Continuing\n\n"
                else
                   exit 1
                fi
	fi	
	
	
	if [ ! -d "$SNPEFF_DATA/$variant_genome" ]; then
	    echo -e "Downloading reference genome to SnpEff database\n"
		echo -e "If the program hangs here please check that the proxy settings are correct and the cluster has internet access\n"
		echo -e "If required SNPEff databases can be manually downloaded and added to the ARDaP pipeline\n"
		echo -e "Running the following command:"
		echo "java $JAVA_PROXY -jar $SNPEFF download -v $variant_genome"
        echo -e "In the following directory $PBS_O_WORKDIR\n"		
		java ${JAVA_PROXY} -jar $SNPEFF download -v $variant_genome
	else 
        echo -e "Annotated reference database has already been downloaded for SnpEff\n"
    fi	
fi

if [ "$SCHEDULER" == PBS -o "$SCHEDULER" == SGE -o "$SCHEDULER" == SLURM -o "$SCHEDULER" == NONE ]; then
	echo -e "ARDaP will use $SCHEDULER for resource management\n"
	else
	echo -e "ARDaP requires you to set the SCHEDULER variable to one of the following: PBS, SGE, SLURM or NONE. \nIt looks like you might have specified the variable incorrectly.\n"
fi



# The following sections will use the specified resource manager to queue all the ARDaP jobs

#########################################################################################
###                                                                                   ###
###                              Portable Batch System                                ###
###                                                                                   ###
#########################################################################################

if [ "$SCHEDULER" == PBS ]; then

#depend function
depend_id () {
  if [ ! -s "$1" ]; then
   unset depend
   echo "$depend"
  else
   qsub_ids=$(cat $1 | cut -f2 | sed -e 's/^/:/' | tr -d '\n')
   depend="-W depend=afterok${qsub_ids}"
   echo "$depend"
  fi
}

#clean queue
if [ -s ref_index_ids.txt ]; then
   rm ref_index_ids.txt
fi
if [ -s qsub_array_ids.txt ]; then
  rm qsub_array_ids.txt
fi
if [ -s mastervcf_id.txt ]; then
    rm mastervcf_id.txt
fi
if [ -s clean_vcf_id.txt ]; then
	rm clean_vcf_id.txt
fi
if [ -s matrix_id.txt ]; then
    rm matrix_id.txt
fi
if [ -s qsub_CARD_id.txt ]; then
  rm qsub_CARD_id.txt
fi

## Indexing of the reference with SAMTools and BWA
## creation of the BED file for the bedcoverage module
## creation of the GATK and picard reference dictionaries


  if [ ! -s "$REF_INDEX_FILE" -o ! -s ${CARD_db}.fasta.bwt ]; then
    echo -e "Submitting qsub job for SAMtools reference indexing\n"
    cmd="${SAMTOOLS} faidx ${seq_directory}/${ref}.fasta && ${BWA} index -a is -p ${seq_directory}/${ref} ${seq_directory}/${ref}.fasta\
	&& ${BWA} index ${seq_directory}/${CARD_db}.fasta && ${SAMTOOLS} faidx ${seq_directory}/${CARD_db}.fasta "
    qsub_id=$(qsub -N SAM_index -j $ERROR_OUTPUT -m $MAIL -M $ADDRESS -l ncpus=1,walltime=$WALL_T -v command="$cmd" "$SCRIPTPATH"/Header.pbs)
    echo -e "SAM_index\t$qsub_id" >> ref_index_ids.txt
  fi
  if [ ! -s "$REF_DICT" ]; then
    echo -e "Submitting qsub job for ${ref}.dict creation\n"
    cmd="source ${SCRIPTPATH}/ARDaP.config && $GATK CreateSequenceDictionary -R ${seq_directory}/${ref}.fasta -O $REF_DICT && $GATK CreateSequenceDictionary -R ${seq_directory}/${CARD_db}.fasta -O ${CARD_db}.dict"
	qsub_id=$(qsub -N PICARD_dict -j $ERROR_OUTPUT -m $MAIL -M $ADDRESS -l ncpus=1,walltime=$WALL_T -v command="$cmd" "$SCRIPTPATH"/Header.pbs)
	echo -e "PICARD_dict\t$qsub_id" >> ref_index_ids.txt
  fi
  
  if [ ! -s "$REF_BED" ]; then
    echo -e "Submitting qsub job for BED file construction with BEDTools\n"
	depend=$(depend_id ref_index_ids.txt)
    cmd="${BEDTOOLS} makewindows -g ${REF_INDEX_FILE} -w $window > ${REF_BED} && ${BEDTOOLS} makewindows -g ${REF_INDEX_FILE} -w 90000000 > ${ref}.coverage.bed && ${BEDTOOLS} makewindows -g ${CARD_db}.fasta.fai -w 90000 > ${CARD_db}.coverage.bed"
    qsub_id=$(qsub -N BED_window -j $ERROR_OUTPUT -m $MAIL -M $ADDRESS -l ncpus=1,walltime=$WALL_T $depend -v command="$cmd" "$SCRIPTPATH"/Header.pbs)
    echo -e "BED_window\t$qsub_id" >> ref_index_ids.txt
  fi

variants () {
  for (( i=0; i<n; i++ )); do
    if [ ! -s "${PBS_O_WORKDIR}"/Outputs/SNPs_indels_PASS/"${sequences[$i]}".snps.PASS.vcf -a ! -s "${PBS_O_WORKDIR}"/Outputs/SNPs_indels_PASS/"${seq}".snps.indels.PASS.mixed.vcf -o ! -s "${PBS_O_WORKDIR}"/Outputs/AbR_reports/"${sequences[$i]}"_strain.pdf ]; then
	  echo -e "Submitting qsub job for sequence alignment and variant calling for ${sequences[$i]}\n"
      var="seq=${sequences[$i]},mixtures=$mixtures,size=$size,ref=$ref,org=$org,strain=$strain,variant_genome=$variant_genome,annotate=$annotate,tech=$tech,pairing=$pairing,seq_path=$seq_directory,SCRIPTPATH=$SCRIPTPATH"
	  #echo $var
	  depend=$(depend_id ref_index_ids.txt)
	  #echo $depend
	  #echo "qsub -N aln_${sequences[$i]} -j $ERROR_OUTPUT -m $MAIL -M $ADDRESS -l ncpus=2,walltime=$WALL_T,pmem=$PBS_MEM $depend -v "$var" "$SCRIPTPATH"/Align_SNP_indel.sh"
	  qsub_array_id=$(qsub -N Variant_calling_${sequences[$i]} -j $ERROR_OUTPUT -m $MAIL -M $ADDRESS -l ncpus=2,walltime=$WALL_T,pmem=$PBS_MEM $depend -v "$var" "$SCRIPTPATH"/Align_SNP_indel.sh)
      echo -e "aln_${sequences[$i]}\t$qsub_array_id" >> qsub_array_ids.txt
	  echo -e "aln_${sequences[$i]}\t$qsub_array_id" > Single_job_depend.txt
	  
	  depend=$(depend_id Single_job_depend.txt)
	  echo -e "Submitting antibiotic detection queries for ${sequences[$i]}\n"
      var="seq=${sequences[$i]},mixtures=$mixtures,ref=$ref,org=$org,strain=$strain,variant_genome=$variant_genome,annotate=$annotate,tech=$tech,pairing=$pairing,seq_path=$seq_directory,SCRIPTPATH=$SCRIPTPATH"
	  qsub_AbR_id=$(qsub -N Resistance_ID_${sequences[$i]} -j $ERROR_OUTPUT -m $MAIL -M $ADDRESS -l ncpus=1,walltime=$WALL_T,pmem=$PBS_MEM $depend -v "$var" "$SCRIPTPATH"/Ab_report.sh)
	  
	fi
  done
}

## Matrix is the main comparative genomics section of ARDaP that relies on the outputs from the variant function above
matrix () {
if [ ! -s "${PBS_O_WORKDIR}"/Phylo/out/out.filtered.vcf ]; then
    echo -e "Submitting qsub job for joint genotyping and annotation\n"
    var="ref=$ref,seq_path=$seq_directory,SCRIPTPATH=$SCRIPTPATH,indel_merge=$indel_merge"
    depend=$(depend_id qsub_array_ids.txt)
	#echo "$depend"
    qsub_matrix_id=$(qsub -N Joint_genotyping -j $ERROR_OUTPUT -m $MAIL -M $ADDRESS -l ncpus=2,walltime=$WALL_T,pmem=$PBS_MEM $depend -v "$var" "$SCRIPTPATH"/Master_vcf.sh)
    echo -e "Matrix_vcf\t$qsub_matrix_id" >> mastervcf_id.txt
fi

if [ ! -s "${PBS_O_WORKDIR}"/Outputs/Comparative/Ortho_SNP_matrix.nex ]; then
    echo -e "Submitting qsub job for creation of phylogenetic tree and final annotated variant outputs\n"
	depend=$(depend_id mastervcf_id.txt)
    var="ref=$ref,seq_path=$seq_directory,variant_genome=$variant_genome,annotate=$annotate,SCRIPTPATH=$SCRIPTPATH,indel_merge=$indel_merge,tri_tetra_allelic=$tri_tetra_allelic"
	qsub_matrix_id=$(qsub -N Phylogeny_and_reports -j $ERROR_OUTPUT -m $MAIL -M $ADDRESS -l ncpus=2,walltime=$WALL_T,pmem=$PBS_MEM $depend -v "$var" "$SCRIPTPATH"/SNP_matrix.sh)
	echo -e "Matrix_vcf\t$qsub_matrix_id" >> matrix_id.txt
fi

}

### These variable tests determine which of the above functions need to be run for the ARDaP pipeline
# Tests are redundant as of v1.0

  if [ "$strain" == all ]; then
    variants
  fi
  if [ "$matrix" == yes -a "$phylogeny" == yes ]; then
    matrix
  fi
fi

#########################################################################################
###                                                                                   ###
###                              Sun Grid Engine                                      ###
###                                                                                   ###
#########################################################################################

SGE () {

if [ "$SCHEDULER" == SGE ]; then

#clean batch system log files

if [ -s qsub_ids.txt ]; then
    rm qsub_ids.txt
fi
if [ -s qsub_ids2.txt ]; then
    rm qsub_ids2.txt
fi
if [ -s qsub_array_ids.txt ]; then
    rm qsub_array_ids.txt
fi
if [ -s mastervcf_id.txt ]; then
    rm mastervcf_id.txt
fi
if [ -s clean_vcf_id.txt ]; then
	rm clean_vcf_id.txt
fi
if [ -s matrix_id.txt ]; then
    rm matrix_id.txt
fi

## Indexing of the reference with SAMTools and BWA
## creation of the BED file for the bedcoverage module
## creation of the GATK and picard reference dictionaries

  if [ ! -s "$ref_index" ]; then
	echo -e "Submitting qsub job for BWA reference indexing\n"
    cmd="$BWA index -a is -p ${seq_directory}/${ref} ${seq_directory}/${ref}.fasta"
    qsub_id=`qsub -N index -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT -v command="$cmd" "$SCRIPTPATH"/Header.pbs`
    echo -e "$qsub_id" >> qsub_ids.txt
  fi
  if [ ! -s "$REF_INDEX_FILE" ]; then
    echo -e "Submitting qsub job for SAMtools reference indexing\n"
    cmd="$SAMTOOLS faidx ${seq_directory}/${ref}.fasta"
    qsub_id=`qsub -N SAM_index -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT -v command="$cmd" "$SCRIPTPATH"/Header.pbs`
    echo -e "$qsub_id" >> qsub_ids.txt
  fi
  if [ ! -s "$REF_DICT" ]; then
    echo -e "Submitting qsub job for ${ref}.dict creation\n"
    cmd="$JAVA $SET_VAR $CREATEDICT R=${seq_directory}/${ref}.fasta O=$REF_DICT"
	qsub_id=`qsub -N PICARD_dict -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT -v command="$cmd" "$SCRIPTPATH"/Header.pbs`
	echo -e "$qsub_id" >> qsub_ids.txt
  fi
  if [ ! -s "$REF_BED" -a qsub_ids.txt ]; then
    echo -e "Submitting qsub job for BED file construction with BEDTools\n"
	qsub_cat_ids=`cat qsub_ids.txt | cut -f3 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
	depend="-hold_jid ${qsub_cat_ids}"
    cmd="$BEDTOOLS makewindows -g $REF_INDEX_FILE -w $window > $REF_BED"
    qsub_id=`qsub -N BED_window -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT $depend -v command="$cmd" "$SCRIPTPATH"/Header.pbs`
   echo -e "$qsub_id" >> qsub_ids.txt	
  fi
  if [ ! -s "$REF_BED" -a ! qsub_ids.txt ]; then
    echo -e "Submitting qsub job for BED file construction with BEDTools\n"
    cmd="$BEDTOOLS makewindows -g $REF_INDEX_FILE -w $window > $REF_BED"
    qsub_id=`qsub -N BED_window -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT -v command="$cmd" "$SCRIPTPATH"/Header.pbs`
    echo -e "$qsub_id" >> qsub_ids.txt	
  fi

variants_single_sge ()
{
if [ -s qsub_ids.txt ]; then
    qsub_cat_ids=`cat qsub_ids.txt | cut -f3 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
    depend="-hold_jid ${qsub_cat_ids}"
    if [ ! -s ${PBS_O_WORKDIR}/Outputs/SNPs_indels_PASS/$sequences.snps.PASS.vcf ]; then
		echo -e "Submitting qsub job for sequence alignment and variant calling for $sequences\n"
        var="seq=$sequences,ref=$ref,org=$org,strain=$strain,variant_genome=$variant_genome,annotate=$annotate,tech=$tech,pairing=$pairing,seq_path=$seq_directory,SCRIPTPATH=$SCRIPTPATH"
		qsub_array_id=`qsub -N aln_sequences -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT $depend -v "$var" "$SCRIPTPATH"/Align_SNP_indel.sh`
        echo -e "$qsub_array_id" >> qsub_array_ids.txt
	fi
        
fi
if [ ! -s qsub_ids.txt ]; then
    if [ ! -s ${PBS_O_WORKDIR}/Outputs/SNPs_indels_PASS/$sequences.snps.PASS.vcf ]; then
		echo -e "Submitting qsub job for sequence alignment and variant calling for ${sequences[$i]}\n"
	    var="seq=$sequences,ref=$ref,org=$org,strain=$strain,variant_genome=$variant_genome,annotate=$annotate,tech=$tech,pairing=$pairing,seq_path=$seq_directory,SCRIPTPATH=$SCRIPTPATH"
		qsub_array_id=`qsub -N aln_$sequences -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT -v "$var" "$SCRIPTPATH"/Align_SNP_indel.sh`
		echo -e "$qsub_array_id" >> qsub_array_ids.txt
	fi
fi

}

## Variants is the main alignment and variant calling script contained with ARDaP

variants_sge ()
{
if [ -s qsub_ids.txt ]; then
    qsub_cat_ids=`cat qsub_ids.txt | cut -f3 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
    depend="-hold_jid ${qsub_cat_ids}"
        for (( i=0; i<n; i++ )); do
            if [ ! -s ${PBS_O_WORKDIR}/Outputs/SNPs_indels_PASS/${sequences[$i]}.snps.PASS.vcf ]; then
		        echo -e "Submitting qsub job for sequence alignment and variant calling for ${sequences[$i]}\n"
                var="seq=${sequences[$i]},ref=$ref,org=$org,strain=$strain,variant_genome=$variant_genome,annotate=$annotate,tech=$tech,pairing=$pairing,seq_path=$seq_directory,SCRIPTPATH=$SCRIPTPATH"
		        qsub_array_id=`qsub -N aln_${sequences[$i]} -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT $depend -v "$var" "$SCRIPTPATH"/Align_SNP_indel.sh`
                echo -e "$qsub_array_id" >> qsub_array_ids.txt
	        fi
        done
fi
if [ ! -s qsub_ids.txt ]; then
        for (( i=0; i<n; i++ )); do
            if [ ! -s ${PBS_O_WORKDIR}/Outputs/SNPs_indels_PASS/${sequences[$i]}.snps.PASS.vcf ]; then
		        echo -e "Submitting qsub job for sequence alignment and variant calling for ${sequences[$i]}\n"
	    	    var="seq=${sequences[$i]},ref=$ref,org=$org,strain=$strain,variant_genome=$variant_genome,annotate=$annotate,tech=$tech,pairing=$pairing,seq_path=$seq_directory,SCRIPTPATH=$SCRIPTPATH"
		        qsub_array_id=`qsub -N aln_${sequences[$i]} -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT -v "$var" "$SCRIPTPATH"/Align_SNP_indel.sh`
				echo -e "$qsub_array_id" >> qsub_array_ids.txt
	        fi
        done
fi

}


## Matrix is the main comparative genomics section of ARDaP that relies on the outputs from the variant function above
matrix_sge ()			
{	
if [ -s qsub_array_ids.txt -a ! -s Phylo/out/master.vcf ]; then
    qsub_cat_ids=`cat qsub_array_ids.txt | cut -f3 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
    depend="-hold_jid ${qsub_cat_ids}"
    echo -e "Submitting qsub job for creation of master VCF file\n"
    var="ref=$ref,seq_path=$seq_directory,SCRIPTPATH=$SCRIPTPATH,indel_merge=$indel_merge"
	qsub_matrix_id=`qsub -N Master_vcf -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT $depend -v "$var" "$SCRIPTPATH"/Master_vcf.sh`
	echo -e "$qsub_matrix_id" >> mastervcf_id.txt	
fi
if [ ! -s qsub_array_ids.txt -a ! -s Phylo/out/master.vcf ]; then
    echo -e "Submitting qsub job for creation of master VCF file\n"
    var="ref=$ref,seq_path=$seq_directory,SCRIPTPATH=$SCRIPTPATH,indel_merge=$indel_merge"
	qsub_matrix_id=`qsub -N Master_vcf -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT -v "$var" "$SCRIPTPATH"/Master_vcf.sh`
	echo -e "$qsub_matrix_id" >> mastervcf_id.txt
fi

### creates clean.vcf files for SNP calls across all genomes

if [ -s mastervcf_id.txt ]; then
    qsub_cat_ids=`cat mastervcf_id.txt | cut -f3 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
	depend="-hold_jid ${qsub_cat_ids}"
	echo -e "Submitting qsub job for error checking SNP calls across all genomes\n"
	out=("${sequences_tmp[@]/_1_sequence.fastq.gz/.clean.vcf}")
	bam=("${sequences_tmp[@]/_1_sequence.fastq.gz/.bam}")
	bam_array=("${bam[@]/#/$PBS_O_WORKDIR/Phylo/bams/}")
    n=${#bam_array[@]}
    for (( i=0; i<n; i++ )); do
	    if [ ! -s $PBS_O_WORKDIR/Phylo/out/${sequences[$i]}.clean.vcf ]; then
		    cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/out/master.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
			qsub_clean_id=`qsub -N clean_vcf -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT $depend -v command="$cmd" "$SCRIPTPATH"/Header.pbs`
			echo -e "$qsub_clean_id" >> clean_vcf_id.txt
		fi
		if [ ! -s $PBS_O_WORKDIR/Phylo/indels/out/${sequences[$i]}.clean.vcf -a "$indel_merge" == yes ]; then
		    cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/indels/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/indels/out/master_indels.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
			qsub_clean_id=`qsub -N clean_vcf -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT $depend -v command="$cmd" "$SCRIPTPATH"/Header.pbs`
			echo -e "$qsub_clean_id" >> clean_vcf_id.txt
		fi
    done  
fi
if [ ! -s mastervcf_id.txt ]; then
    echo -e "Submitting qsub job for error checking SNP calls across all genomes\n"
	out=("${sequences_tmp[@]/_1_sequence.fastq.gz/.clean.vcf}")
	bam=("${sequences_tmp[@]/_1_sequence.fastq.gz/.bam}")
	bam_array=("${bam[@]/#/$PBS_O_WORKDIR/Phylo/bams/}")
    n=${#bam_array[@]}
    for (( i=0; i<n; i++ )); do
	    if [ ! -s $PBS_O_WORKDIR/Phylo/out/${sequences[$i]}.clean.vcf ]; then
		    cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/out/master.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
			qsub_clean_id=`qsub -N clean_vcf -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT -v command="$cmd" "$SCRIPTPATH"/Header.pbs`
			echo -e "$qsub_clean_id" >> clean_vcf_id.txt
		fi
		if [ ! -s $PBS_O_WORKDIR/Phylo/indels/out/${sequences[$i]}.clean.vcf -a "$indel_merge" == yes ]; then
		cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/indels/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/indels/out/master_indels.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
		qsub_clean_id=`qsub -N clean_vcf -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT -v command="$cmd" "$SCRIPTPATH"/Header.pbs`
		echo -e "$qsub_clean_id" >> clean_vcf_id.txt
		fi
    done 
fi
## if indels merge is set to yes creates clean.vcf files for all indels identified across all genomes

if [ -s clean_vcf_id.txt -a ! -s $PBS_O_WORKDIR/Outputs/Comparative/Ortho_SNP_matrix.nex ]; then
    qsub_cat_ids=`cat clean_vcf_id.txt | cut -f3 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
    depend="-hold_jid ${qsub_cat_ids}"
    echo -e "Submitting qsub job for creation of SNP array\n"
    var="ref=$ref,seq_path=$seq_directory,variant_genome=$variant_genome,annotate=$annotate,SCRIPTPATH=$SCRIPTPATH,indel_merge=$indel_merge,tri_tetra_allelic=$tri_tetra_allelic"
	qsub_matrix_id=`qsub -N Matrix_vcf -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT $depend -v "$var" "$SCRIPTPATH"/SNP_matrix.sh`
	echo -e "$qsub_matrix_id" >> matrix_id.txt
fi
if [ ! -s clean_vcf_id.txt -a ! -s $PBS_O_WORKDIR/Outputs/Comparative/Ortho_SNP_matrix.nex ]; then
    echo -e "Submitting qsub job for creation of SNP array\n"
    var="ref=$ref,seq_path=$seq_directory,variant_genome=$variant_genome,annotate=$annotate,SCRIPTPATH=$SCRIPTPATH,indel_merge=$indel_merge,tri_tetra_allelic=$tri_tetra_allelic"
	qsub_matrix_id=`qsub -N Matrix_vcf -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT -v "$var" "$SCRIPTPATH"/SNP_matrix.sh`
	echo -e "$qsub_matrix_id" >> matrix_id.txt
fi
}

## This function will generate a SNP matrix from the Phylo directory assuming all SNP and BAM files have already been linked into these directories
## qsub for indel_merge is currently untested

matrix_final_sge ()			
{
if [ -s qsub_ids.txt -a ! -s Phylo/out/master.vcf ]; then
    qsub_cat_ids=`cat qsub_ids.txt | cut -f3 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
    depend="-hold_jid ${qsub_cat_ids}"
	echo -e "Submitting qsub job for creation of master VCF file\n"
    var="ref=$ref,seq_path=$seq_directory,SCRIPTPATH=$SCRIPTPATH,indel_merge=$indel_merge"
	qsub_matrix_id=`qsub -N Master_vcf -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT $depend -v "$var" "$SCRIPTPATH"/Master_vcf_final.sh`
	echo -e "$qsub_matrix_id" >> mastervcf_id.txt
fi
if [ ! -s qsub_ids.txt -a ! -s Phylo/out/master.vcf ]; then
    echo -e "Submitting qsub job for creation of master VCF file\n"
    var="ref=$ref,seq_path=$seq_directory,SCRIPTPATH=$SCRIPTPATH,indel_merge=$indel_merge"
	qsub_matrix_id=`qsub -N Master_vcf -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT -v "$var" "$SCRIPTPATH"/Master_vcf_final.sh`
	echo -e "$qsub_matrix_id" >> mastervcf_id.txt
fi

### creates clean.vcf files for SNP calls across all genomes

if [ -s mastervcf_id.txt ]; then
    qsub_cat_ids=`cat mastervcf_id.txt | cut -f3 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
	depend="-hold_jid ${qsub_cat_ids}"
	echo -e "Submitting qsub job for error checking SNP calls across all genomes\n"
	clean_array=(`find $PBS_O_WORKDIR/Phylo/snps/*.vcf -printf "%f "`)
    out=("${clean_array[@]/.vcf/.clean.vcf}")
    bam_array=(`find $PBS_O_WORKDIR/Phylo/bams/*.bam`)
    n=${#bam_array[@]}
    for (( i=0; i<n; i++ )); do
	    if [ ! -s $PBS_O_WORKDIR/Phylo/out/${out[$i]} ]; then
		    cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/out/master.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
			qsub_clean_id=`qsub -N clean_vcf -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT $depend -v command="$cmd" "$SCRIPTPATH"/Header.pbs`
			echo -e "$qsub_clean_id" >> clean_vcf_id.txt
		fi
    done  
fi
if [ ! -s mastervcf_id.txt ]; then
    echo -e "Submitting qsub job for error checking SNP calls across all genomes\n"
    clean_array=(`find $PBS_O_WORKDIR/Phylo/snps/*.vcf -printf "%f "`)
    out=("${clean_array[@]/.vcf/.clean.vcf}")
    bam_array=(`find $PBS_O_WORKDIR/Phylo/bams/*.bam`)
    n=${#bam_array[@]}
    for (( i=0; i<n; i++ )); do
	    if [ ! -s $PBS_O_WORKDIR/Phylo/out/${out[$i]} ]; then
		    cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/out/master.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
			qsub_clean_id=`qsub -N clean_vcf -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT -v command="$cmd" "$SCRIPTPATH"/Header.pbs`
			echo -e "$qsub_clean_id" >> clean_vcf_id.txt
		fi
    done  
fi

## if indels merge is set to yes creates clean.vcf files for all indels identified across all genomes


if [ -s mastervcf_id.txt -a "$indel_merge" == yes ]; then
    qsub_cat_ids=`cat mastervcf_id.txt | cut -f3 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
	depend="-hold_jid ${qsub_cat_ids}"
	echo -e "Submitting qsub job for error checking SNP calls across all genomes\n"
	clean_array=(`find $PBS_O_WORKDIR/Phylo/indels/*.vcf -printf "%f "`)
    out=("${clean_array[@]/.vcf/.clean.vcf}")
    bam_array=(`find $PBS_O_WORKDIR/Phylo/bams/*.bam`)
    n=${#bam_array[@]}
    for (( i=0; i<n; i++ )); do
	    if [ ! -s $PBS_O_WORKDIR/Phylo/indels/out/${out[$i]} ]; then
		    cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/indels/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/indels/out/master_indels.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
			qsub_clean_id=`qsub -N clean_vcf -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT $depend -v command="$cmd" "$SCRIPTPATH"/Header.pbs`
			echo -e "$qsub_clean_id" >> clean_vcf_id.txt
		fi
    done  
fi
if [ ! -s mastervcf_id.txt -a "$indel_merge" == yes ]; then
    echo -e "Submitting qsub job for error checking SNP calls across all genomes\n"
    clean_array=(`find $PBS_O_WORKDIR/Phylo/indels/*.vcf -printf "%f "`)
    out=("${clean_array[@]/.vcf/.clean.vcf}")
    bam_array=(`find $PBS_O_WORKDIR/Phylo/bams/*.bam`)
    n=${#bam_array[@]}
    for (( i=0; i<n; i++ )); do
	    if [ ! -s $PBS_O_WORKDIR/Phylo/out/${out[$i]} ]; then
		    cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/indels/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/indels/out/master_indels.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
			qsub_clean_id=`qsub -N clean_vcf -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT -v command="$cmd" "$SCRIPTPATH"/Header.pbs`
			echo -e "$qsub_clean_id" >> clean_vcf_id.txt
		fi
    done  
fi

#####################


if [ -s clean_vcf_id.txt -a ! -s $PBS_O_WORKDIR/Outputs/Comparative/Ortho_SNP_matrix.nex ]; then
    qsub_cat_ids=`cat clean_vcf_id.txt | cut -f3 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
    depend="-hold_jid ${qsub_cat_ids}"
    echo -e "Submitting qsub job for creation of SNP array\n"
    var="ref=$ref,seq_path=$seq_directory,variant_genome=$variant_genome,annotate=$annotate,SCRIPTPATH=$SCRIPTPATH,indel_merge=$indel_merge,tri_tetra_allelic=$tri_tetra_allelic"
	qsub_matrix_id=`qsub -N Matrix_vcf -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT $depend -v "$var" "$SCRIPTPATH"/SNP_matrix.sh`
	echo -e "$qsub_matrix_id" >> matrix_id.txt
fi
if [ ! -s clean_vcf_id.txt -a ! -s $PBS_O_WORKDIR/Outputs/Comparative/Ortho_SNP_matrix.nex ]; then
    echo -e "Submitting qsub job for creation of SNP array\n"
    var="ref=$ref,seq_path=$seq_directory,variant_genome=$variant_genome,annotate=$annotate,SCRIPTPATH=$SCRIPTPATH,indel_merge=$indel_merge,tri_tetra_allelic=$tri_tetra_allelic"
	qsub_matrix_id=`qsub -N Matrix_vcf -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT -v "$var" "$SCRIPTPATH"/SNP_matrix.sh`
	echo -e "$qsub_matrix_id" >> matrix_id.txt
fi
}

## This function takes the output of each bedcoverage assessment of the sequence alignment and merges them in a comparative matrix
## This function is run when $strain=all but not when a single strain is analysed i.e. $strain doesn't equal all
merge_BED_sge ()
{
if [ -s qsub_array_ids.txt -a ! -s $PBS_O_WORKDIR/Outputs/Comparative/Bedcov_merge.txt ]; then
    qsub_cat_ids=`cat qsub_array_ids.txt | cut -f3 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
    depend="-hold_jid ${qsub_cat_ids}"
    echo -e "Submitting qsub job for BEDcov merge\n"
    var="seq_path=$seq_directory"
	qsub_BED_id=`qsub -N BEDcov_merge -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT $depend -v "$var" "$SCRIPTPATH"/BedCov_merge.sh`
	#echo -e "$qsub_BED_id" >> qsub_BED_id.txt
fi
if [ ! -s qsub_array_ids.txt -a ! -s $PBS_O_WORKDIR/Outputs/Comparative/Bedcov_merge.txt ]; then
    echo -e "Submitting qsub job for BEDcov merge\n"
    var="ref=$ref,seq_path=$seq_directory"
	qsub_BED_id=`qsub -N BEDcov_merge -j $ERROR_OUT_SGE -m $MAIL -M $ADDRESS -l h_rt=$H_RT -v "$var" "$SCRIPTPATH"/BedCov_merge.sh`
	#echo -e "$qsub_BED_id" >> qsub_BED_id.txt
fi
}

### These variable tests determine which of the above functions need to be run for the ARDaP pipeline

  if [ "$strain" == all ]; then
    variants_sge
	merge_BED_sge
  fi
  if [ "$strain" != all -a "$strain" != none ]; then
    variants_single_sge
  fi
  if [ "$matrix" == yes -a "$strain" != none ]; then
    matrix_sge
  fi
  if [ "$matrix" == yes -a "$strain" == none ]; then
    matrix_final_sge
  fi
fi

 }
 
 
#########################################################################################
###                                                                                   ###
###                                    SLURM                                          ###
###                                                                                   ###
#########################################################################################

SLURM () {

if [ "$SCHEDULER" == SLURM ]; then

#clean batch system log files

if [ -s sbatch_ids.txt ]; then
    rm sbatch_ids.txt
fi
if [ -s sbatch_ids2.txt ]; then
    rm sbatch_ids2.txt
fi
if [ -s sbatch_array_ids.txt ]; then
    rm sbatch_array_ids.txt
fi
if [ -s mastervcf_id.txt ]; then
    rm mastervcf_id.txt
fi
if [ -s clean_vcf_id.txt ]; then
	rm clean_vcf_id.txt
fi
if [ -s matrix_id.txt ]; then
    rm matrix_id.txt
fi

## Indexing of the reference with SAMTools and BWA
## creation of the BED file for the bedcoverage module
## creation of the GATK and picard reference dictionaries

  if [ ! -s "$ref_index" ]; then
	echo -e "Submitting sbatch job for BWA reference indexing\n"
    cmd="$BWA index -a is -p ${seq_directory}/${ref} ${seq_directory}/${ref}.fasta"
    sbatch_id=`sbatch --job-name=index --mail-type=$MAIL_SLURM --time=$TIME --export=command="$cmd" "$SCRIPTPATH"/Header.pbs`
    echo -e "$sbatch_id" >> sbatch_ids.txt
  fi
  if [ ! -s "$REF_INDEX_FILE" ]; then
    echo -e "Submitting sbatch job for SAMtools reference indexing\n"
    cmd="$SAMTOOLS faidx ${seq_directory}/${ref}.fasta"
    sbatch_id=`sbatch --job-name=SAM_index --mail-type=$MAIL_SLURM --time=$TIME --export=command="$cmd" "$SCRIPTPATH"/Header.pbs`
    echo -e "$sbatch_id" >> sbatch_ids.txt
  fi
  if [ ! -s "$REF_DICT" ]; then
    echo -e "Submitting sbatch job for ${ref}.dict creation\n"
    cmd="$JAVA $SET_VAR $CREATEDICT R=${seq_directory}/${ref}.fasta O=$REF_DICT"
	sbatch_id=`sbatch --job-name=PICARD_dict --mail-type=$MAIL_SLURM --time=$TIME --export=command="$cmd" "$SCRIPTPATH"/Header.pbs`
	echo -e "$sbatch_id" >> sbatch_ids.txt
  fi
  if [ ! -s "$REF_BED" -a sbatch_ids.txt ]; then
    echo -e "Submitting sbatch job for BED file construction with BEDTools\n"
	sbatch_cat_ids=`cat sbatch_ids.txt | cut -f4 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
	depend="--depend=afterok:${sbatch_cat_ids}"
    cmd="$BEDTOOLS makewindows -g $REF_INDEX_FILE -w $window > $REF_BED"
    sbatch_id=`sbatch --job-name=BED_window --mail-type=$MAIL_SLURM --time=$TIME $depend --export=command="$cmd" "$SCRIPTPATH"/Header.pbs`
   echo -e "$sbatch_id" >> sbatch_ids.txt	
  fi
  if [ ! -s "$REF_BED" -a ! sbatch_ids.txt ]; then
    echo -e "Submitting sbatch job for BED file construction with BEDTools\n"
    cmd="$BEDTOOLS makewindows -g $REF_INDEX_FILE -w $window > $REF_BED"
    sbatch_id=`sbatch --job-name=BED_window --mail-type=$MAIL_SLURM --time=$TIME --export=command="$cmd" "$SCRIPTPATH"/Header.pbs`
    echo -e "$sbatch_id" >> sbatch_ids.txt	
  fi

variants_single_slurm ()
{
if [ -s sbatch_ids.txt ]; then
    sbatch_cat_ids=`cat sbatch_ids.txt | cut -f4 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
    depend="--depend=afterok:${sbatch_cat_ids}"
    if [ ! -s ${PBS_O_WORKDIR}/Outputs/SNPs_indels_PASS/$sequences.snps.PASS.vcf ]; then
		echo -e "Submitting sbatch job for sequence alignment and variant calling for $sequences\n"
        var="seq=$sequences,ref=$ref,org=$org,strain=$strain,variant_genome=$variant_genome,annotate=$annotate,tech=$tech,pairing=$pairing,seq_path=$seq_directory,SCRIPTPATH=$SCRIPTPATH"
		sbatch_array_id=`sbatch --job-name=aln_sequences --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME $depend --export="$var" "$SCRIPTPATH"/Align_SNP_indel.sh`
        echo -e "$sbatch_array_id" >> sbatch_array_ids.txt
	fi
        
fi
if [ ! -s sbatch_ids.txt ]; then
    if [ ! -s ${PBS_O_WORKDIR}/Outputs/SNPs_indels_PASS/$sequences.snps.PASS.vcf ]; then
		echo -e "Submitting sbatch job for sequence alignment and variant calling for ${sequences[$i]}\n"
	    var="seq=$sequences,ref=$ref,org=$org,strain=$strain,variant_genome=$variant_genome,annotate=$annotate,tech=$tech,pairing=$pairing,seq_path=$seq_directory,SCRIPTPATH=$SCRIPTPATH"
		sbatch_array_id=`sbatch --job-name=aln_$sequences --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME --export="$var" "$SCRIPTPATH"/Align_SNP_indel.sh`
		echo -e "$sbatch_array_id" >> sbatch_array_ids.txt
	fi
fi

}

## Variants is the main alignment and variant calling script contained with ARDaP

variants_slurm ()
{
if [ -s sbatch_ids.txt ]; then
    sbatch_cat_ids=`cat sbatch_ids.txt | cut -f4 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
    depend="--depend=afterok:${sbatch_cat_ids}"
        for (( i=0; i<n; i++ )); do
            if [ ! -s ${PBS_O_WORKDIR}/Outputs/SNPs_indels_PASS/${sequences[$i]}.snps.PASS.vcf ]; then
		        echo -e "Submitting sbatch job for sequence alignment and variant calling for ${sequences[$i]}\n"
                var="seq=${sequences[$i]},ref=$ref,org=$org,strain=$strain,variant_genome=$variant_genome,annotate=$annotate,tech=$tech,pairing=$pairing,seq_path=$seq_directory,SCRIPTPATH=$SCRIPTPATH"
		        sbatch_array_id=`sbatch --job-name=aln_${sequences[$i]} --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME $depend --export="$var" "$SCRIPTPATH"/Align_SNP_indel.sh`
                echo -e "$sbatch_array_id" >> sbatch_array_ids.txt
	        fi
        done
fi
if [ ! -s sbatch_ids.txt ]; then
        for (( i=0; i<n; i++ )); do
            if [ ! -s ${PBS_O_WORKDIR}/Outputs/SNPs_indels_PASS/${sequences[$i]}.snps.PASS.vcf ]; then
		        echo -e "Submitting sbatch job for sequence alignment and variant calling for ${sequences[$i]}\n"
	    	    var="seq=${sequences[$i]},ref=$ref,org=$org,strain=$strain,variant_genome=$variant_genome,annotate=$annotate,tech=$tech,pairing=$pairing,seq_path=$seq_directory,SCRIPTPATH=$SCRIPTPATH"
		        sbatch_array_id=`sbatch --job-name=aln_${sequences[$i]} --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME --export="$var" "$SCRIPTPATH"/Align_SNP_indel.sh`
				echo -e "$sbatch_array_id" >> sbatch_array_ids.txt
	        fi
        done
fi

}


## Matrix is the main comparative genomics section of ARDaP that relies on the outputs from the variant function above
matrix_slurm ()			
{	
if [ -s sbatch_array_ids.txt -a ! -s Phylo/out/master.vcf ]; then
    sbatch_cat_ids=`cat sbatch_array_ids.txt | cut -f4 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
    depend="--depend=afterok:${sbatch_cat_ids}"
    echo -e "Submitting sbatch job for creation of master VCF file\n"
    var="ref=$ref,seq_path=$seq_directory,SCRIPTPATH=$SCRIPTPATH,indel_merge=$indel_merge"
	sbatch_matrix_id=`sbatch --job-name=Master_vcf --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME $depend --export="$var" "$SCRIPTPATH"/Master_vcf.sh`
	echo -e "$sbatch_matrix_id" >> mastervcf_id.txt	
fi
if [ ! -s sbatch_array_ids.txt -a ! -s Phylo/out/master.vcf ]; then
    echo -e "Submitting sbatch job for creation of master VCF file\n"
    var="ref=$ref,seq_path=$seq_directory,SCRIPTPATH=$SCRIPTPATH,indel_merge=$indel_merge"
	sbatch_matrix_id=`sbatch --job-name=Master_vcf --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME --export="$var" "$SCRIPTPATH"/Master_vcf.sh`
	echo -e "$sbatch_matrix_id" >> mastervcf_id.txt
fi

### creates clean.vcf files for SNP calls across all genomes

if [ -s mastervcf_id.txt ]; then
    sbatch_cat_ids=`cat mastervcf_id.txt | cut -f4 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
	depend="--depend=afterok:${sbatch_cat_ids}"
	echo -e "Submitting sbatch job for error checking SNP calls across all genomes\n"
	out=("${sequences_tmp[@]/_1_sequence.fastq.gz/.clean.vcf}")
	bam=("${sequences_tmp[@]/_1_sequence.fastq.gz/.bam}")
	bam_array=("${bam[@]/#/$PBS_O_WORKDIR/Phylo/bams/}")
    n=${#bam_array[@]}
    for (( i=0; i<n; i++ )); do
	    if [ ! -s $PBS_O_WORKDIR/Phylo/out/${sequences[$i]}.clean.vcf ]; then
		    cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/out/master.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
			sbatch_clean_id=`sbatch --job-name=clean_vcf --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME $depend --export=command="$cmd" "$SCRIPTPATH"/Header.pbs`
			echo -e "$sbatch_clean_id" >> clean_vcf_id.txt
		fi
		if [ ! -s $PBS_O_WORKDIR/Phylo/indels/out/${sequences[$i]}.clean.vcf -a "$indel_merge" == yes ]; then
		    cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/indels/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/indels/out/master_indels.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
			sbatch_clean_id=`sbatch --job-name=clean_vcf --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME $depend --export=command="$cmd" "$SCRIPTPATH"/Header.pbs`
			echo -e "$sbatch_clean_id" >> clean_vcf_id.txt
		fi
    done  
fi
if [ ! -s mastervcf_id.txt ]; then
    echo -e "Submitting sbatch job for error checking SNP calls across all genomes\n"
	out=("${sequences_tmp[@]/_1_sequence.fastq.gz/.clean.vcf}")
	bam=("${sequences_tmp[@]/_1_sequence.fastq.gz/.bam}")
	bam_array=("${bam[@]/#/$PBS_O_WORKDIR/Phylo/bams/}")
    n=${#bam_array[@]}
    for (( i=0; i<n; i++ )); do
	    if [ ! -s $PBS_O_WORKDIR/Phylo/out/${sequences[$i]}.clean.vcf ]; then
		    cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/out/master.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
			sbatch_clean_id=`sbatch --job-name=clean_vcf --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME --export=command="$cmd" "$SCRIPTPATH"/Header.pbs`
			echo -e "$sbatch_clean_id" >> clean_vcf_id.txt
		fi
		if [ ! -s $PBS_O_WORKDIR/Phylo/indels/out/${sequences[$i]}.clean.vcf -a "$indel_merge" == yes ]; then
		cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/indels/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/indels/out/master_indels.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
		sbatch_clean_id=`sbatch --job-name=clean_vcf --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME --export=command="$cmd" "$SCRIPTPATH"/Header.pbs`
		echo -e "$sbatch_clean_id" >> clean_vcf_id.txt
		fi
    done 
fi
## if indels merge is set to yes creates clean.vcf files for all indels identified across all genomes

if [ -s clean_vcf_id.txt -a ! -s $PBS_O_WORKDIR/Outputs/Comparative/Ortho_SNP_matrix.nex ]; then
    sbatch_cat_ids=`cat clean_vcf_id.txt | cut -f4 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
    depend="--depend=afterok:${sbatch_cat_ids}"
    echo -e "Submitting sbatch job for creation of SNP array\n"
    var="ref=$ref,seq_path=$seq_directory,variant_genome=$variant_genome,annotate=$annotate,SCRIPTPATH=$SCRIPTPATH,indel_merge=$indel_merge,tri_tetra_allelic=$tri_tetra_allelic"
	sbatch_matrix_id=`sbatch --job-name=Matrix_vcf --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME $depend --export="$var" "$SCRIPTPATH"/SNP_matrix.sh`
	echo -e "$sbatch_matrix_id" >> matrix_id.txt
fi
if [ ! -s clean_vcf_id.txt -a ! -s $PBS_O_WORKDIR/Outputs/Comparative/Ortho_SNP_matrix.nex ]; then
    echo -e "Submitting sbatch job for creation of SNP array\n"
    var="ref=$ref,seq_path=$seq_directory,variant_genome=$variant_genome,annotate=$annotate,SCRIPTPATH=$SCRIPTPATH,indel_merge=$indel_merge,tri_tetra_allelic=$tri_tetra_allelic"
	sbatch_matrix_id=`sbatch --job-name=Matrix_vcf --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME --export="$var" "$SCRIPTPATH"/SNP_matrix.sh`
	echo -e "$sbatch_matrix_id" >> matrix_id.txt
fi
}

## This function will generate a SNP matrix from the Phylo directory assuming all SNP and BAM files have already been linked into these directories
## sbatch for indel_merge is currently untested

matrix_final_slurm ()			
{
if [ -s sbatch_ids.txt -a ! -s Phylo/out/master.vcf ]; then
    sbatch_cat_ids=`cat sbatch_ids.txt | cut -f4 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
    depend="--depend=afterok:${sbatch_cat_ids}"
	echo -e "Submitting sbatch job for creation of master VCF file\n"
    var="ref=$ref,seq_path=$seq_directory,SCRIPTPATH=$SCRIPTPATH,indel_merge=$indel_merge"
	sbatch_matrix_id=`sbatch --job-name=Master_vcf --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME $depend --export="$var" "$SCRIPTPATH"/Master_vcf_final.sh`
	echo -e "$sbatch_matrix_id" >> mastervcf_id.txt
fi
if [ ! -s sbatch_ids.txt -a ! -s Phylo/out/master.vcf ]; then
    echo -e "Submitting sbatch job for creation of master VCF file\n"
    var="ref=$ref,seq_path=$seq_directory,SCRIPTPATH=$SCRIPTPATH,indel_merge=$indel_merge"
	sbatch_matrix_id=`sbatch --job-name=Master_vcf --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME --export="$var" "$SCRIPTPATH"/Master_vcf_final.sh`
	echo -e "$sbatch_matrix_id" >> mastervcf_id.txt
fi

### creates clean.vcf files for SNP calls across all genomes

if [ -s mastervcf_id.txt ]; then
    sbatch_cat_ids=`cat mastervcf_id.txt | cut -f4 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
	depend="--depend=afterok:${sbatch_cat_ids}"
	echo -e "Submitting sbatch job for error checking SNP calls across all genomes\n"
	clean_array=(`find $PBS_O_WORKDIR/Phylo/snps/*.vcf -printf "%f "`)
    out=("${clean_array[@]/.vcf/.clean.vcf}")
    bam_array=(`find $PBS_O_WORKDIR/Phylo/bams/*.bam`)
    n=${#bam_array[@]}
    for (( i=0; i<n; i++ )); do
	    if [ ! -s $PBS_O_WORKDIR/Phylo/out/${out[$i]} ]; then
		    cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/out/master.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
			sbatch_clean_id=`sbatch --job-name=clean_vcf --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME $depend --export=command="$cmd" "$SCRIPTPATH"/Header.pbs`
			echo -e "$sbatch_clean_id" >> clean_vcf_id.txt
		fi
    done  
fi
if [ ! -s mastervcf_id.txt ]; then
    echo -e "Submitting sbatch job for error checking SNP calls across all genomes\n"
    clean_array=(`find $PBS_O_WORKDIR/Phylo/snps/*.vcf -printf "%f "`)
    out=("${clean_array[@]/.vcf/.clean.vcf}")
    bam_array=(`find $PBS_O_WORKDIR/Phylo/bams/*.bam`)
    n=${#bam_array[@]}
    for (( i=0; i<n; i++ )); do
	    if [ ! -s $PBS_O_WORKDIR/Phylo/out/${out[$i]} ]; then
		    cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/out/master.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
			sbatch_clean_id=`sbatch --job-name=clean_vcf --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME --export=command="$cmd" "$SCRIPTPATH"/Header.pbs`
			echo -e "$sbatch_clean_id" >> clean_vcf_id.txt
		fi
    done  
fi

## if indels merge is set to yes creates clean.vcf files for all indels identified across all genomes


if [ -s mastervcf_id.txt -a "$indel_merge" == yes ]; then
    sbatch_cat_ids=`cat mastervcf_id.txt | cut -f4 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
	depend="--depend=afterok:${sbatch_cat_ids}"
	echo -e "Submitting sbatch job for error checking SNP calls across all genomes\n"
	clean_array=(`find $PBS_O_WORKDIR/Phylo/indels/*.vcf -printf "%f "`)
    out=("${clean_array[@]/.vcf/.clean.vcf}")
    bam_array=(`find $PBS_O_WORKDIR/Phylo/bams/*.bam`)
    n=${#bam_array[@]}
    for (( i=0; i<n; i++ )); do
	    if [ ! -s $PBS_O_WORKDIR/Phylo/indels/out/${out[$i]} ]; then
		    cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/indels/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/indels/out/master_indels.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
			sbatch_clean_id=`sbatch --job-name=clean_vcf --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME $depend --export=command="$cmd" "$SCRIPTPATH"/Header.pbs`
			echo -e "$sbatch_clean_id" >> clean_vcf_id.txt
		fi
    done  
fi
if [ ! -s mastervcf_id.txt -a "$indel_merge" == yes ]; then
    echo -e "Submitting sbatch job for error checking SNP calls across all genomes\n"
    clean_array=(`find $PBS_O_WORKDIR/Phylo/indels/*.vcf -printf "%f "`)
    out=("${clean_array[@]/.vcf/.clean.vcf}")
    bam_array=(`find $PBS_O_WORKDIR/Phylo/bams/*.bam`)
    n=${#bam_array[@]}
    for (( i=0; i<n; i++ )); do
	    if [ ! -s $PBS_O_WORKDIR/Phylo/out/${out[$i]} ]; then
		    cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/indels/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/indels/out/master_indels.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
			sbatch_clean_id=`sbatch --job-name=clean_vcf --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME --export=command="$cmd" "$SCRIPTPATH"/Header.pbs`
			echo -e "$sbatch_clean_id" >> clean_vcf_id.txt
		fi
    done  
fi


if [ -s clean_vcf_id.txt -a ! -s $PBS_O_WORKDIR/Outputs/Comparative/Ortho_SNP_matrix.nex ]; then
    sbatch_cat_ids=`cat clean_vcf_id.txt | cut -f4 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
    depend="--depend=afterok:${sbatch_cat_ids}"
    echo -e "Submitting sbatch job for creation of SNP array\n"
    var="ref=$ref,seq_path=$seq_directory,variant_genome=$variant_genome,annotate=$annotate,SCRIPTPATH=$SCRIPTPATH,indel_merge=$indel_merge,tri_tetra_allelic=$tri_tetra_allelic"
	sbatch_matrix_id=`sbatch --job-name=Matrix_vcf --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME $depend --export="$var" "$SCRIPTPATH"/SNP_matrix.sh`
	echo -e "$sbatch_matrix_id" >> matrix_id.txt
fi
if [ ! -s clean_vcf_id.txt -a ! -s $PBS_O_WORKDIR/Outputs/Comparative/Ortho_SNP_matrix.nex ]; then
    echo -e "Submitting sbatch job for creation of SNP array\n"
    var="ref=$ref,seq_path=$seq_directory,variant_genome=$variant_genome,annotate=$annotate,SCRIPTPATH=$SCRIPTPATH,indel_merge=$indel_merge,tri_tetra_allelic=$tri_tetra_allelic"
	sbatch_matrix_id=`sbatch --job-name=Matrix_vcf --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME --export="$var" "$SCRIPTPATH"/SNP_matrix.sh`
	echo -e "$sbatch_matrix_id" >> matrix_id.txt
fi
}

## This function takes the output of each bedcoverage assessment of the sequence alignment and merges them in a comparative matrix
## This function is run when $strain=all but not when a single strain is analysed i.e. $strain doesn't equal all
merge_BED_slurm ()
{
if [ -s sbatch_array_ids.txt -a ! -s $PBS_O_WORKDIR/Outputs/Comparative/Bedcov_merge.txt ]; then
    sbatch_cat_ids=`cat sbatch_array_ids.txt | cut -f4 -d ' ' | sed -e 's/$/,/' | tr -d '\n' | sed -e 's/,$//'`
    depend="--depend=afterok:${sbatch_cat_ids}"
    echo -e "Submitting sbatch job for BEDcov merge\n"
    var="seq_path=$seq_directory"
	sbatch_BED_id=`sbatch --job-name=BEDcov_merge --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME $depend --export="$var" "$SCRIPTPATH"/BedCov_merge.sh`
	#echo -e "$sbatch_BED_id" >> sbatch_BED_id.txt
fi
if [ ! -s sbatch_array_ids.txt -a ! -s $PBS_O_WORKDIR/Outputs/Comparative/Bedcov_merge.txt ]; then
    echo -e "Submitting sbatch job for BEDcov merge\n"
    var="ref=$ref,seq_path=$seq_directory"
	sbatch_BED_id=`sbatch --job-name=BEDcov_merge --mem=$SLURM_MEM --mail-type=$MAIL_SLURM --time=$TIME --export="$var" "$SCRIPTPATH"/BedCov_merge.sh`
	#echo -e "$sbatch_BED_id" >> sbatch_BED_id.txt
fi
}

### These variable tests determine which of the above functions need to be run for the ARDaP pipeline

  if [ "$strain" == all ]; then
    variants_slurm
	merge_BED_slurm
  fi
  if [ "$strain" != all -a "$strain" != none ]; then
    variants_single_slurm
  fi
  if [ "$matrix" == yes -a "$strain" != none ]; then
    matrix_slurm
  fi
  if [ "$matrix" == yes -a "$strain" == none ]; then
    matrix_final_slurm
  fi
fi

}

#########################################################################################
###                                                                                   ###
###                              No Resource Manager                                  ###
###                                                                                   ###
#########################################################################################

DIRECT () {

if [ "$SCHEDULER" == NONE ]; then

if [ ! $PBS_O_WORKDIR ]; then
        PBS_O_WORKDIR="$PWD"
fi

cd $PBS_O_WORKDIR

## Indexing of the reference with SAMTools and BWA
## creation of the BED file for the bedcoverage module
## creation of the GATK and picard reference dictionaries

  if [ ! -s "$ref_index" ]; then
	echo -e "\n\nIndexing reference file for BWA\n"
    cmd="$BWA index -a is -p ${seq_directory}/${ref} ${seq_directory}/${ref}.fasta"
	echo $cmd
	$cmd 2>&1
	sleep 1
  fi
  if [ ! -s "$REF_INDEX_FILE" ]; then
    echo -e "\n\nRunning job for SAMtools reference indexing\n"
    cmd="$SAMTOOLS faidx ${seq_directory}/${ref}.fasta"
    echo $cmd
	$cmd 2>&1
	sleep 1
  fi
  if [ ! -s "$REF_DICT" ]; then
    echo -e "\n\nRunning job for ${ref}.dict creation\n"
    cmd="$JAVA $SET_VAR $CREATEDICT R=${seq_directory}/${ref}.fasta O=$REF_DICT"
	echo $cmd
	$cmd 2>&1
	sleep 1
  fi
  if [ ! -s "$REF_BED" ]; then
    echo -e "\n\nRunning job for BED file construction with BEDTools\n"
	cmd="$BEDTOOLS makewindows -g $REF_INDEX_FILE -w $window "
    echo $cmd
	$cmd > $REF_BED
	sleep 1
  fi
 
  
  
variants_single ()
{
    if [ ! -s ${PBS_O_WORKDIR}/Outputs/SNPs_indels_PASS/$sequences.snps.PASS.vcf ]; then
		echo -e "\nRunning job for sequence alignment and variant calling for ${sequences[$i]}\n"
	    SCRIPTPATH=$SCRIPTPATH
		echo $SCRIPTPATH
		export seq=$sequences ref=$ref org=$org strain=$strain variant_genome=$variant_genome annotate=$annotate tech=$tech pairing=$pairing seq_path=$seq_directory SCRIPTPATH=$SCRIPTPATH
		"$SCRIPTPATH"/Align_SNP_indel.sh 
		
	fi


}

## Variants is the main alignment and variant calling script contained with ARDaP

variants ()
{
        for (( i=0; i<n; i++ )); do
            if [ ! -s ${PBS_O_WORKDIR}/Outputs/SNPs_indels_PASS/${sequences[$i]}.snps.PASS.vcf ]; then
		        echo -e "Running job for sequence alignment and variant calling for ${sequences[$i]}\n"
				
	    	    export seq=${sequences[$i]} ref=$ref org=$org strain=$strain variant_genome=$variant_genome annotate=$annotate tech=$tech pairing=$pairing seq_path=$seq_directory SCRIPTPATH=$SCRIPTPATH
		        
				"$SCRIPTPATH"/Align_SNP_indel.sh
				
	        fi
        done


}


## Matrix is the main comparative genomics section of ARDaP that relies on the outputs from the variant function above
matrix ()			
{	

if [ ! -s Phylo/out/master.vcf ]; then
    echo -e "Running job for creation of master VCF file\n"
    export ref=$ref seq_path=$seq_directory SCRIPTPATH=$SCRIPTPATH indel_merge=$indel_merge
	"$SCRIPTPATH"/Master_vcf.sh
	
fi

### creates clean.vcf files for SNP calls across all genomes


    echo -e "Running job for error checking SNP calls across all genomes\n"
	out=("${sequences_tmp[@]/_1_sequence.fastq.gz/.clean.vcf}")
	bam=("${sequences_tmp[@]/_1_sequence.fastq.gz/.bam}")
	bam_array=("${bam[@]/#/$PBS_O_WORKDIR/Phylo/bams/}")
    n=${#bam_array[@]}
    for (( i=0; i<n; i++ )); do
	    if [ ! -s $PBS_O_WORKDIR/Phylo/out/${sequences[$i]}.clean.vcf ]; then
		    cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/out/master.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
			echo $cmd
			$cmd 2>&1
			
		fi
		if [ ! -s $PBS_O_WORKDIR/Phylo/indels/out/${sequences[$i]}.clean.vcf -a "$indel_merge" == yes ]; then
		cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/indels/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/indels/out/master_indels.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
		echo $cmd
		$cmd
		fi
    done 

## if indels merge is set to yes creates clean.vcf files for all indels identified across all genomes

if [ ! -s $PBS_O_WORKDIR/Outputs/Comparative/Ortho_SNP_matrix.nex ]; then
    echo -e "Running job for creation of SNP array\n"
    export ref=$ref seq_path=$seq_directory variant_genome=$variant_genome annotate=$annotate SCRIPTPATH=$SCRIPTPATH indel_merge=$indel_merge tri_tetra_allelic=$tri_tetra_allelic
	"$SCRIPTPATH"/SNP_matrix.sh	
fi
}

## This function will generate a SNP matrix from the Phylo directory assuming all SNP and BAM files have already been linked into these directories
## qsub for indel_merge is currently untested

matrix_final ()			
{
if [ ! -s qsub_ids.txt -a ! -s Phylo/out/master.vcf ]; then
    echo -e "Submitting qsub job for creation of master VCF file\n"
    export ref=$ref seq_path=$seq_directory SCRIPTPATH=$SCRIPTPATH indel_merge=$indel_merge
	"$SCRIPTPATH"/Master_vcf_final.sh	
fi

### creates clean.vcf files for SNP calls across all genomes

if [ ! -s mastervcf_id.txt ]; then
    echo -e "Running job for error checking SNP calls across all genomes\n"
    clean_array=(`find $PBS_O_WORKDIR/Phylo/snps/*.vcf -printf "%f "`)
    out=("${clean_array[@]/.vcf/.clean.vcf}")
    bam_array=(`find $PBS_O_WORKDIR/Phylo/bams/*.bam`)
    n=${#bam_array[@]}
    for (( i=0; i<n; i++ )); do
	    if [ ! -s $PBS_O_WORKDIR/Phylo/out/${out[$i]} ]; then
		    cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/out/master.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
			echo $cmd
			$cmd 2>&1
		fi
    done  
fi

## if indels merge is set to yes creates clean.vcf files for all indels identified across all genomes
if [ ! -s mastervcf_id.txt -a "$indel_merge" == yes ]; then
    echo -e "Submitting qsub job for error checking SNP calls across all genomes\n"
    clean_array=(`find $PBS_O_WORKDIR/Phylo/indels/*.vcf -printf "%f "`)
    out=("${clean_array[@]/.vcf/.clean.vcf}")
    bam_array=(`find $PBS_O_WORKDIR/Phylo/bams/*.bam`)
    n=${#bam_array[@]}
    for (( i=0; i<n; i++ )); do
	    if [ ! -s $PBS_O_WORKDIR/Phylo/out/${out[$i]} ]; then
		    cmd="$JAVA $SET_VAR $GATK -T UnifiedGenotyper -rf BadCigar -R $PBS_O_WORKDIR/${ref}.fasta -I ${bam_array[$i]} -o $PBS_O_WORKDIR/Phylo/indels/out/${out[$i]} -alleles:masterAlleles $PBS_O_WORKDIR/Phylo/indels/out/master_indels.vcf -gt_mode GENOTYPE_GIVEN_ALLELES -out_mode EMIT_ALL_SITES -stand_call_conf 0.0 -glm BOTH -G none"
			echo $cmd
			$cmd
		fi
    done  
fi

#####################
if [ ! -s clean_vcf_id.txt -a ! -s $PBS_O_WORKDIR/Outputs/Comparative/Ortho_SNP_matrix.nex ]; then
    echo -e "Running job for creation of SNP array\n"
    export ref=$ref seq_path=$seq_directory variant_genome=$variant_genome annotate=$annotate SCRIPTPATH=$SCRIPTPATH indel_merge=$indel_merge tri_tetra_allelic=$tri_tetra_allelic
	"$SCRIPTPATH"/SNP_matrix.sh
fi
}

## This function takes the output of each bedcoverage assessment of the sequence alignment and merges them in a comparative matrix
## This function is run when $strain=all but not when a single strain is analysed i.e. $strain doesn't equal all
merge_BED ()
{
if [ ! -s qsub_array_ids.txt -a ! -s $PBS_O_WORKDIR/Outputs/Comparative/Bedcov_merge.txt ]; then
    echo -e "Running job for BEDcov merge\n"
    export ref=$ref seq_path=$seq_directory
	"$SCRIPTPATH"/BedCov_merge.sh
fi
}

### These variable tests determine which of the above functions need to be run for the ARDaP pipeline

  if [ "$strain" == all ]; then
    variants
	merge_BED
  fi
  if [ "$strain" != all -a "$strain" != none ]; then
    variants_single
  fi
  if [ "$matrix" == yes -a "$strain" != none ]; then
    matrix
  fi
  if [ "$matrix" == yes -a "$strain" == none ]; then
    matrix_final
  fi
fi

}

exit 0