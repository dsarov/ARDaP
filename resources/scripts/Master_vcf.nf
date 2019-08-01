#!/usr/bin/env nextflow
/*

====================================================================================================
 The following script will combine all vcf files in your GATK directory into a master VCF file
 Combined snp calls from the master.vcf are interrogated across all bam files at these locations to verify snp identity
 Finally the clean vcf files are concatenated and converted into a matrix for phylogeny programs
 Version 1.5
=====================================================================================================

*/

// Set script parameters
source "$SCRIPTPATH"/ARDaP.config
source "$SCRIPTPATH"/GATK.config

if [ ! $PBS_O_WORKDIR ]; then
        PBS_O_WORKDIR="$seq_path"
fi
 
cd $PBS_O_WORKDIR

process createDirStructure {

/*
#########################################################################
## checks and creates directory structure
#########################################################################
*/
"""
    if [ ! -d "$baseDir/Phylo" ]; then
        mkdir $baseDir/Phylo
    else
        echo -e "Phylo directory already exists \n"
    fi
    if [ ! -d "$baseDir/Phylo/snps" ]; then
        mkdir $baseDir/Phylo/snps
    else
        echo -e "Phylo/snps directory already exists\n"
    fi  
    if [ ! -d "$baseDir/Phylo/bams" ]; then
        mkdir $baseDir/Phylo/bams
    else
        echo -e "Phylo/bams directory already exists\n"
    fi  
    if [ ! -d "$baseDir/Phylo/out" ]; then
        mkdir $baseDir/Phylo/out
    else
        echo -e "Phylo/out directory already exists\n"
    fi  

    if [ ! -d "$baseDir/Phylo/indels" ]; then
        mkdir $baseDir/Phylo/indels
    else
        echo -e "Phylo/indels/out directory already exists\n"
    fi
"""
}


//=========================================================================
//links and rename snps PASS files into snps directory
//=========================================================================


   $PBS_O_WORKDIR/Phylo/snps "ls $baseDir/*/unique/*variants.raw.gvcf|while read f; do ln -s \$f; done;"


// link all ../../*/unique/*variants.raw.gvcf into $PBS_O_WORKDIR/Phylo/snps




if [ "$(ls -A $PBS_O_WORKDIR/Phylo/bams)" ]; then
   echo "bams directory not empty"
   echo "skipping linking and renaming of bam and bai files"
   echo -e "if the bam and bai files are not in bams directory, make sure the directory is empty and restart\n"
  else
   log_eval $PBS_O_WORKDIR/Phylo/bams "ls $PBS_O_WORKDIR/*/unique/*.realigned* |while read f; do ln -s \$f; done;"
   log_eval $PBS_O_WORKDIR/Phylo/bams "for f in *.bam; do mv \$f \${f//.realigned.bam/.bam}; done;"
   log_eval $PBS_O_WORKDIR/Phylo/bams "for f in *.bai; do mv \$f \${f//.realigned.bam.bai/.bai}; done;"
fi
if [ ! -d "$seq_path/Phylo/indels/out" ]; then
    mkdir $seq_path/Phylo/indels/out
  else
    echo -e "Phylo/indels directory already exists\n"
fi 
#########################################################################
#Checks for the master vcf file and creates it
#If merge indels is switched on a master.vcf will be created for the indels as well
#########################################################################
/*
if [ ! -s $PBS_O_WORKDIR/Phylo/out/master.vcf ]; then
    array=($(find $PBS_O_WORKDIR/Phylo/snps/*.gvcf -printf "%f "))
    n="${#array[@]}"
    array2=("${array[@]/#/-V }")

    log_eval $PBS_O_WORKDIR/Phylo/snps "$GATK CombineGVCFs -R $PBS_O_WORKDIR/${ref}.fasta ${array2[*]} -O $PBS_O_WORKDIR/Phylo/out/master.vcf"
	log_eval $PBS_O_WORKDIR/Phylo/snps "$GATK GenotypeGVCFs -ploidy $n -R $PBS_O_WORKDIR/${ref}.fasta -V $PBS_O_WORKDIR/Phylo/out/master.vcf -O $PBS_O_WORKDIR/Phylo/out/out.vcf" 
  else
    echo -e "The merged snp calls have already been combined into the master.vcf file\n"
fi
*/

gvcfArray = file('$PBS_O_WORKDIR/Phylo/snps/*.gvcf')
process CombineGVCFs {

    input:
    file gvcf from ardap/spandx.nf

    output:
    file "$PBS_O_WORKDIR/Phylo/out/out.vcf" into GenotypeGVCFs


    """
    gatk CombinGVCFs -R $PBS_O_WORKDIR/${ref}.fasta ${array2[*]} -O $PBS_O_WORKDIR/Phylo/out/master.vcf
    gatkK GenotypeGVCFs -ploidy $n -R $PBS_O_WORKDIR/${ref}.fasta -V $PBS_O_WORKDIR/Phylo/out/master.vcf -O $PBS_O_WORKDIR/Phylo/out/out.vcf" 
    gatk VariantFiltration -R ${reference}.fasta -O $seq_path/Phylo/out/out.filtered.vcf -V $seq_path/Phylo/out/out.vcf --cluster-size $CLUSTER_SNP -window $CLUSTER_WINDOW_SNP -filter \"QD < $QD_SNP\" --filter-name \"QDFilter\" -filter \"MQ < $MQ_SNP\" --filter-name \"MQFilter\" -filter \"FS > $FS_SNP\" --filter-name \"HaplotypeScoreFilter\""

    """

}


