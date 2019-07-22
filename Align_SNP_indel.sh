#!/bin/bash
#PBS -o logs/Alignment_${seq}.txt
#$ -S /bin/bash
#$ -cwd
#PBS -M $mail
#PBS -m a


############################################################################
# 
# Thank you for using ARDaP. ARDaP is meant to be run using the main script ARDaP.sh
# For help please refer to the ARDaP manual
#
# Written by Derek Sarovich - University of the Sunshine Coast
# Version 2.1
# v0.1
#
############################################################################
#### Variables required seq ref org strain seq_path annotate pairing tech window phylogeny ####

#source variables
source "$SCRIPTPATH"/ARDaP.config
source "$SCRIPTPATH"/GATK.config
#module load java/1.8.0_131
#which java
#echo $PATH

if [ ! "$PBS_O_WORKDIR" ]
    then
        PBS_O_WORKDIR="$seq_path"
fi

cd "$PBS_O_WORKDIR"

log_eval()
{
  cd $1
  echo -e "\nIn $1\n"
  echo "Running: $2"
  
  #eval "$2"
  eval "time $2"
  status=$?

  if [ ! $status == 0 ]; then
    echo "Previous command returned error: $status"
    exit 1
  fi
}

###file variable list

REF_FILE="$seq_path"/"${ref}"
REF_FASTA="$seq_path"/"${ref}".fasta
READ1_FILE="$seq_path"/Clean_reads/"${seq}"_1_sequence.fastq.gz
READ2_FILE="$seq_path"/Clean_reads/"${seq}"_2_sequence.fastq.gz
SAM="$seq_path"/"${seq}"/unique/"${seq}".sam
BAM="$seq_path"/"${seq}"/unique/"${seq}".tmp
BAM_INDEX_FILE="$seq_path"/"${seq}"/unique/"${seq}".bam.bai
BAM_TEMP_FILE="$seq_path"/"${seq}"/unique/"${seq}".temp.bam
BAM_UNIQUE_FILE="$seq_path"/"${seq}"/unique/"${seq}".bam
BAM_UNIQUE_INDEX_FILE="$seq_path"/"${seq}"/unique/"${seq}".bam.bai
BAM_DUPLICATESREM_FILE="$seq_path"/"${seq}"/unique/"${seq}".dups.bam
BAM_DUPLICATESREM_FILE_INDEX="$seq_path"/"${seq}"/unique/"${seq}".dups.bam.bai
DUP_METRICS="$seq_path"/"${seq}"/unique/dup_metrics.txt
GATK_DEPTH_FILE="$seq_path"/"${seq}"/unique/"${seq}".sample_summary
GATK_TARGET_FILE="$seq_path"/"${seq}"/unique/"${seq}".bam.list
GATK_REALIGNED_BAM="$seq_path"/"${seq}"/unique/"${seq}".realigned.bam
GATK_RAW_SNPS_FILE="$seq_path"/"${seq}"/unique/"${seq}".snps.raw.vcf
GATK_RAW_INDELS_FILE="$seq_path"/"${seq}"/unique/"${seq}".indels.raw.vcf
GATK_FILTER_SNPS_FILE="$seq_path"/"${seq}"/unique/"${seq}".snps.filter.vcf
GATK_FILTER_INDELS_FILE="$seq_path"/"${seq}"/unique/"${seq}".indels.filter.vcf
GATK_PASS_SNPS_FILE="$seq_path"/"${seq}"/unique/"${seq}".snps.PASS.vcf
GATK_PASS_INDELS_FILE="$seq_path"/"${seq}"/unique/"${seq}".indels.PASS.vcf
ANNOTATED_SNPS="$seq_path"/"${seq}"/unique/annotated/"${seq}".snps.PASS.vcf.annotated
ANNOTATED_INDELS="$seq_path"/"${seq}"/unique/annotated/"${seq}".indels.PASS.vcf.annotated
GATK_SNP_HEAD="$seq_path"/"${seq}"/unique/"${seq}".snp.head.vcf
GATK_INDEL_HEAD="$seq_path"/"${seq}"/unique/"${seq}".indel.head.vcf
GATK_SNP_AMB="$seq_path"/"${seq}"/unique/"${seq}".snps.AMB.vcf
GATK_INDELS_AMB="$seq_path"/"${seq}"/unique/"${seq}".indels.AMB.vcf
GATK_SNP_HEAD2="$seq_path"/"${seq}"/unique/"${seq}".snp.head2.vcf
GATK_SNP_FAIL="$seq_path"/"${seq}"/unique/"${seq}".snps.FAIL.vcf
GATK_INDELS_HEAD2="$seq_path"/"${seq}"/unique/"${seq}".indels.head2.vcf
GATK_INDELS_FAIL="$seq_path"/"${seq}"/unique/"${seq}".indels.FAIL.vcf
GATK_RAW_SNPS_INDELS="$seq_path"/"${seq}"/unique/"${seq}".snps.indels.raw.vcf
GATK_RAW_VARIANTS="$seq_path"/"${seq}"/unique/"${seq}".variants.raw.gvcf

#------------- Variable for CARD alignment
CARD_REF_FILE="$seq_path"/CARD_db.fasta
CARD_SAM="$seq_path"/"${seq}"/unique/CARD/"${seq}".sam
CARD_BAM="$seq_path"/"${seq}"/unique/CARD/"${seq}".tmp
CARD_BAM_TEMP_FILE="$seq_path"/"${seq}"/unique/CARD/"${seq}".temp.bam
CARD_BAM_INDEX_FILE="$seq_path"/"${seq}"/unique/CARD/"${seq}".bam.bai
CARD_BAM_UNIQUE_FILE="$seq_path"/"${seq}"/unique/CARD/"${seq}".bam
CARD_BAM_UNIQUE_INDEX_FILE="$seq_path"/"${seq}"/unique/CARD/"${seq}".bam.bai
CARD_BAM_DUPLICATESREM_FILE="$seq_path"/"${seq}"/unique/CARD/"${seq}".dups.bam
CARD_BAM_DUPLICATESREM_FILE_INDEX="$seq_path"/"${seq}"/unique/CARD/"${seq}".dups.bam.bai
CARD_DUP_METRICS="$seq_path"/"${seq}"/unique/CARD/dup_metrics.txt
CARD_BED_WINDOW_FILE="$seq_path"/CARD_db.coverage.bed
CARD_COV_FILE="$seq_path"/"${seq}"/unique/CARD/"${seq}".bedcov
CARD_GATK_REALIGNED_BAM="$seq_path"/"${seq}"/unique/CARD/"${seq}".bam
CARD_GATK_DEPTH_FILE="$seq_path"/"${seq}"/unique/CARD/"${seq}".sample_summary


## create directory structure for each sequence file
if [ ! -d "$seq_path/${seq}" ]; then
	mkdir -p "$seq_path"/"${seq}"
fi

if [ ! -d "$seq_path/${seq}/unique" ]; then
    mkdir -p "$seq_path"/"${seq}"/unique
fi  
  
if [ ! -s "$READ1_FILE" -o ! -s "$READ2_FILE" ]; then
  ln -s  "$seq_path"/"$seq"_1_sequence.fastq.gz "$READ1_FILE"
  ln -s  "$seq_path"/"$seq"_2_sequence.fastq.gz "$READ2_FILE"
  log_eval "$PBS_O_WORKDIR" "$JAVA -jar $TRIMMOMATIC PE -threads 2 $READ1_FILE $READ2_FILE $seq_path/Clean_reads/${seq}_1.fq.gz $seq_path/Clean_reads/${seq}_1_unpaired.fq.gz $seq_path/Clean_reads/${seq}_2.fq.gz $seq_path/Clean_reads/${seq}_2_unpaired.fq.gz ILLUMINACLIP:$ADAPTERS/all_adapters.fa:2:30:10 LEADING:10 TRAILING:10 SLIDINGWINDOW:4:15 MINLEN:36" 
  rm "$seq_path"/Clean_reads/"${seq}"_1_unpaired.fq.gz "$seq_path"/Clean_reads/"${seq}"_2_unpaired.fq.gz
  
  #downsample to 50x
  size_actual=$(echo "$size" | bc)
  echo "Down-sampling to ~50x. Assuming genome size of $size_actual"
  "$SEQTK" sample -s 11 "$seq_path"/Clean_reads/"${seq}"_1.fq.gz "$size" | gzip - > "$READ1_FILE".tmp
  mv "$READ1_FILE".tmp "$READ1_FILE"
  "$SEQTK" sample -s 11 "$seq_path"/Clean_reads/"${seq}"_2.fq.gz "$size" | gzip - > "$READ2_FILE".tmp
  mv "$READ2_FILE".tmp "$READ2_FILE"
  rm "$seq_path"/Clean_reads/"${seq}"_1.fq.gz
  rm "$seq_path"/Clean_reads/"${seq}"_2.fq.gz
fi  
 
  
#########################################################################
##   -infile(s) - PE NGS reads $READ1_FILE and $READ2_file             ## 
##                                                                     ##
##                                                                     ## 
## Illumina 1.8+ alignment with BWA mem for both PE and SE             ##   
##             and alignment file processing with SAMtools             ##
##                                                                     ##
##      -outfiles(s) aligned sequence file $SAM and $BAM               ##
#########################################################################

if [ "$tech" == Illumina -a "$pairing" == PE ]; then
	if [ ! -s "$GATK_REALIGNED_BAM" ]; then
		log_eval "$PBS_O_WORKDIR" "$BWA mem -R '@RG\tID:${org}\tSM:${seq}\tPL:ILLUMINA' -a -t 2 $REF_FILE $READ1_FILE $READ2_FILE > $SAM"   		
	fi
fi

if [ ! -s "$BAM_UNIQUE_FILE.bam" -a ! -s "$GATK_REALIGNED_BAM" ]; then
	log_eval "$PBS_O_WORKDIR" "$SAMTOOLS view -h -b -@ 1 -q 1 -o $BAM_TEMP_FILE $SAM && $SAMTOOLS sort -@ 1 -o $BAM_UNIQUE_FILE $BAM_TEMP_FILE"
	rm "$BAM_TEMP_FILE"
fi
if [ ! -s "$BAM_UNIQUE_INDEX_FILE" -a ! -s "$GATK_REALIGNED_BAM" ]; then
    log_eval "$PBS_O_WORKDIR" "$SAMTOOLS index $BAM_UNIQUE_FILE"
fi


### Removal of duplicates using GATK/Picard 

if [ ! -s "$BAM_DUPLICATESREM_FILE" -a ! -s "$GATK_REALIGNED_BAM" ]; then 
      log_eval "$PBS_O_WORKDIR" "$GATK MarkDuplicates -I $BAM_UNIQUE_FILE -O $BAM_DUPLICATESREM_FILE --REMOVE_DUPLICATES true --METRICS_FILE $DUP_METRICS --VALIDATION_STRINGENCY LENIENT"
	  mv "$BAM_DUPLICATESREM_FILE" "$GATK_REALIGNED_BAM" && log_eval "$PBS_O_WORKDIR" "$SAMTOOLS index $GATK_REALIGNED_BAM"
fi


### cleanup ###
if [ -s "$BAM_DUPLICATESREM_FILE" ]; then
    rm "$BAM_UNIQUE_FILE" "$BAM_DUPLICATESREM_FILE_INDEX" "$GATK_TARGET_FILE"
fi
if [ -s "$BAM_UNIQUE_INDEX_FILE" ]; then
    rm "$BAM_UNIQUE_INDEX_FILE"
fi
if [ -s "$BAM_UNIQUE_FILE" ]; then
    rm "$BAM_UNIQUE_FILE"
fi
if [ -s "$SAM" ]; then
	rm "$SAM"
fi

if [ ! -s "${seq_path}"/"${seq}"/unique/output.regions.bed.gz ]; then
    log_eval "${seq_path}"/"${seq}"/unique/ "${MOSDEPTH} --by $PBS_O_WORKDIR/${ref}.coverage.bed output ${seq_path}/${seq}/unique/${seq}.realigned.bam"
fi


sum_depth=$(zcat $seq_path/${seq}/unique/output.regions.bed.gz | awk '{print $4}' | awk '{s+=$1}END{print s}')
total_chromosomes=$(zcat $seq_path/${seq}/unique/output.regions.bed.gz | awk '{print $4}' | wc -l)
AVG_DEPTH=$(echo "$sum_depth/$total_chromosomes" | bc )


echo -e "The average coverage of your genome alignment calculated with mosdepth is $AVG_DEPTH\n"
echo -e "The duplication value cutoff used to determine gene duplication is 5x the average sequence coverage"
DUP_CUTOFF=$(echo "$AVG_DEPTH*3" | bc)


#Call SNPS and indels with mixtures
if [ "$mixtures" = yes ]; then
	if [ ! -s "$seq_path"/"${seq}"/unique/"${seq}".snps.indels.raw.mixed.vcf -a ! -s "$PBS_O_WORKDIR"/Outputs/Annotated_variants/"${seq}".ALL.annotated.mixed.vcf ]; then
		log_eval "$PBS_O_WORKDIR" "$GATK HaplotypeCaller -R $REF_FASTA --I $GATK_REALIGNED_BAM -O ${seq_path}/${seq}/unique/${seq}.snps.indels.raw.mixed.vcf" #can include db SNPs here
	fi
	if [ ! -s "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".snps.indels.filtered.mixed.vcf -a ! -s "$PBS_O_WORKDIR"/Outputs/SNPs_indels_PASS/"${seq}".ALL.PASS.vcf ]; then
		log_eval "$PBS_O_WORKDIR" "$GATK VariantFiltration -R $REF_FASTA -O ${seq_path}/${seq}/unique/${seq}.snps.indels.filtered.mixed.vcf -V ${seq_path}/${seq}/unique/${seq}.snps.indels.raw.mixed.vcf -filter \"MQ < $MQ_SNP\" --filter-name \"MQFilter\" -filter \"FS > $FS_SNP\" --filter-name \"FSFilter\" -filter \"QUAL < $QUAL_SNP\" --filter-name \"StandardFilters\""
	fi 
	if [ ! -s "$GATK_PASS_SNPS_FILE" -a ! -s "$PBS_O_WORKDIR"/Outputs/SNPs_indels_PASS/"${seq}".snps.PASS.vcf ]; then 
		header=`grep -n "#CHROM" ${seq_path}/${seq}/unique/${seq}.snps.indels.filtered.mixed.vcf | cut -d':' -f 1`
		head -n "$header" "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".snps.indels.filtered.mixed.vcf > "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".snps.indels.filtered.mixed.vcf.header.tmp
		cat "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".snps.indels.filtered.mixed.vcf | grep PASS | cat "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".snps.indels.filtered.mixed.vcf.header.tmp - > "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".snps.indels.PASS.mixed.vcf
		rm "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".snps.indels.filtered.mixed.vcf.header.tmp
	fi
	if [ "$annotate" == yes ]; then
		if [ ! -d "$PBS_O_WORKDIR"/"${seq}"/unique/annotated ]; then
			mkdir "$PBS_O_WORKDIR"/"${seq}"/unique/annotated
		fi
		if [ ! -s "$PBS_O_WORKDIR"/Outputs/Annotated_variants/"${seq}".ALL.annotated.mixed.vcf ]; then
			log_eval "$PBS_O_WORKDIR"/"${seq}"/unique/annotated "$JAVA -jar $SNPEFF eff -no-downstream -no-intergenic -ud 100 -v $variant_genome ${seq_path}/${seq}/unique/${seq}.snps.indels.PASS.mixed.vcf > ${seq_path}/${seq}/unique/annotated/${seq}.ALL.annotated.mixed.vcf"
			mv "$PBS_O_WORKDIR"/"${seq}"/unique/annotated/snpEff_genes.txt "$PBS_O_WORKDIR"/"${seq}"/unique/annotated/snpEff_genes_ALL.txt
			mv "$PBS_O_WORKDIR"/"${seq}"/unique/annotated/snpEff_summary.html "$PBS_O_WORKDIR"/"${seq}"/unique/annotated/snpEff_summary_ALL.html
		fi
		if [ -s "$PBS_O_WORKDIR"/"${seq}"/unique/annotated/"${seq}".ALL.annotated.mixed.vcf ]; then
			cp "$PBS_O_WORKDIR"/"${seq}"/unique/annotated/"${seq}".ALL.annotated.mixed.vcf  "$PBS_O_WORKDIR"/Outputs/Annotated_variants/"${seq}".ALL.annotated.mixed.vcf
		fi
	fi

	#Processing of deletions, duplications and inversions.

	#PINDEL="/home/dsarovich2/bin/ARDaP_v1.3/bin/pindel"; 
	#PINDEL2VCF="/home/dsarovich2/bin/ARDaP_v1.3/bin/pindel2vcf"; 
	
	echo "Creating Pindel config file"
	if [ ! -s "${PBS_O_WORKDIR}"/"${seq}"/unique/pindel.bam.config ]; then
		echo -e "${seq}.realigned.bam\t250\tB" > "${PBS_O_WORKDIR}"/"${seq}"/unique/pindel.bam.config
	fi
	
	if [ ! -s "${PBS_O_WORKDIR}"/"${seq}"/unique/pindel.out_D ]; then
		log_eval "${PBS_O_WORKDIR}"/"${seq}"/unique/ "$PINDEL -f $REF_FASTA -i ${PBS_O_WORKDIR}/${seq}/unique/pindel.bam.config -o ${PBS_O_WORKDIR}/${seq}/unique/pindel.out"
	fi
	
	cd "${PBS_O_WORKDIR}"/"${seq}"/unique/
	for f in pindel.out_{BP,D,INT,INV,LI,RP,SI,TD}; do
		if [ -s "$f" -a ! -s "${f}".vcf ]; then
			echo "converting $f to vcf"
			log_eval "${PBS_O_WORKDIR}"/"${seq}"/unique/ "$PINDEL2VCF -r $REF_FASTA -R $REF_FILE -d ARDaP -p $f -v ${f}.vcf -e 5 -is 15 -as 50000"
		fi
	done
		
	for f in pindel.out_{BP,D,INT,INV,LI,RP,SI,TD}.vcf; do
		if [ -s "$f" ]; then
			echo "annotating $f"
			"$JAVA" -jar "$SNPEFF" eff -no-downstream -no-intergenic -ud 100 -v "$variant_genome" "${seq_path}"/"${seq}"/unique/"${f}" > "${seq_path}"/"${seq}"/unique/annotated/"${f}".annotated
		fi
	done
    cd "${PBS_O_WORKDIR}"
	##TODO variants to table here for post processing?
fi

if [ "$mixtures" = no -o "$phylogeny" = yes ]; then
	if [ ! -s "$GATK_RAW_SNPS_INDELS" -a ! -s "$seq_path/Outputs/SNPs_indels_PASS/${seq}.snps.PASS.vcf" ]; then
		log_eval "$PBS_O_WORKDIR" "$GATK HaplotypeCaller -R $REF_FASTA --ploidy 1 --I $GATK_REALIGNED_BAM -O $GATK_RAW_SNPS_INDELS" #can include db SNPs
	fi
	
	#Emit GVCFs.
	
    if [ ! -s "$GATK_RAW_VARIANTS" -a ! -s "$seq_path/Outputs/SNPs_indels_PASS/${seq}.snps.PASS.vcf" -a "$phylogeny" = yes ]; then
		log_eval "$PBS_O_WORKDIR" "$GATK HaplotypeCaller -R $REF_FASTA -ERC GVCF --I $GATK_REALIGNED_BAM -O $GATK_RAW_VARIANTS" #can include db SNPs
	fi
	
		#split SNPs and indels
	if [ ! -s "$GATK_RAW_SNPS_FILE" ]; then
		log_eval "$PBS_O_WORKDIR" "$GATK SelectVariants -R $REF_FASTA -V $GATK_RAW_SNPS_INDELS -O $GATK_RAW_SNPS_FILE -select-type SNP"
	fi
	if [ ! -s "$GATK_RAW_INDELS_FILE" ]; then
		log_eval "$PBS_O_WORKDIR" "$GATK SelectVariants -R $REF_FASTA -V $GATK_RAW_SNPS_INDELS -O $GATK_RAW_INDELS_FILE -select-type INDEL"
	fi

	# Filter the SNPs #TODO use select variants here rather than filtering to parse snp and indel files

	if [ ! -s "$GATK_FILTER_SNPS_FILE" -a ! -s "$seq_path/Outputs/SNPs_indels_PASS/${seq}.snps.PASS.vcf" ]; then
		log_eval "$PBS_O_WORKDIR" "$GATK VariantFiltration -R $REF_FASTA -O $GATK_FILTER_SNPS_FILE -V $GATK_RAW_SNPS_FILE --cluster-size $CLUSTER_SNP -window $CLUSTER_WINDOW_SNP -filter \"MLEAF < $MLEAF_SNP\" --filter-name \"AFFilter\" -filter \"QD < $QD_SNP\" --filter-name \"QDFilter\" -filter \"MQ < $MQ_SNP\" --filter-name \"MQFilter\" -filter \"FS > $FS_SNP\" --filter-name \"FSFilter\" -filter \"QUAL < $QUAL_SNP\" --filter-name \"StandardFilters\""
	fi 
	if [ ! -s "$GATK_PASS_SNPS_FILE" -a ! -s "$seq_path/Outputs/SNPs_indels_PASS/${seq}.snps.PASS.vcf" ]; then 
		header=`grep -n "#CHROM" $GATK_FILTER_SNPS_FILE | cut -d':' -f 1`
		head -n "$header" "$GATK_FILTER_SNPS_FILE" > "$GATK_SNP_HEAD"
		cat "$GATK_FILTER_SNPS_FILE" | grep PASS | cat "$GATK_SNP_HEAD" - > "$GATK_PASS_SNPS_FILE"
	fi

	# Reapply filters to the raw SNPs file to generate a list of failed SNP calls

	if [ ! -s "$GATK_SNP_AMB" -a ! -s "${seq_path}/Outputs/SNPs_indels_FAIL/${seq}.snps.FAIL.vcf" ]; then
		log_eval "$PBS_O_WORKDIR" "$GATK VariantFiltration -R $REF_FASTA -O $GATK_SNP_AMB -V $GATK_RAW_SNPS_FILE --cluster-size $CLUSTER_SNP -window $CLUSTER_WINDOW_SNP -filter \"MLEAF < $MLEAF_SNP\" --filter-name \"FAIL\" -filter \"QD < $QD_SNP\" --filter-name \"FAIL1\" -filter \"MQ < $MQ_SNP\" --filter-name \"FAIL2\" -filter \"FS > $FS_SNP\" --filter-name \"FAIL3\" -filter \"QUAL < $QUAL_SNP\" --filter-name \"FAIL5\""
	fi
	if [ ! -s "$GATK_SNP_FAIL" -a ! -s "${seq_path}/Outputs/SNPs_indels_FAIL/${seq}.snps.FAIL.vcf" ]; then
		header_amb=`grep -n "#CHROM" $GATK_SNP_AMB | cut -d':' -f 1`
		head -n "$header_amb" "$GATK_SNP_AMB" > "$GATK_SNP_HEAD2"
		cat "$GATK_SNP_AMB" | grep FAIL | cat "$GATK_SNP_HEAD2" - > "$GATK_SNP_FAIL"
	fi


	if [ ! -s "$GATK_FILTER_INDELS_FILE" -a ! -s "$seq_path/Outputs/SNPs_indels_FAIL/${seq}.indels.PASS.vcf" ]; then
		log_eval "$PBS_O_WORKDIR" "$GATK VariantFiltration -R $REF_FASTA -O $GATK_FILTER_INDELS_FILE -V $GATK_RAW_INDELS_FILE -filter \"MLEAF < $MLEAF_INDEL\" --filter-name \"AFFilter\" -filter \"MQ < $MQ_INDEL\" --filter-name \"MQFilter\" -filter \"QD < $QD_INDEL\" --filter-name \"QDFilter\" -filter \"FS > $FS_INDEL\" --filter-name \"FSFilter\" -filter \"QUAL < $QUAL_INDEL\" --filter-name \"QualFilter\""
	fi    
	if [ ! -s "$GATK_PASS_INDELS_FILE" -a ! -s "$seq_path/Outputs/SNPs_indels_FAIL/${seq}.indels.PASS.vcf" ]; then		
		header_indel=`grep -n "#CHROM" $GATK_FILTER_INDELS_FILE | cut -d':' -f 1`
		head -n "$header_indel" "$GATK_FILTER_INDELS_FILE" > "$GATK_INDEL_HEAD"
		cat "$GATK_FILTER_INDELS_FILE" | grep PASS | cat "$GATK_INDEL_HEAD" - > "$GATK_PASS_INDELS_FILE"
	fi
	if [ ! -s "$GATK_INDELS_AMB" -a ! -s "${seq_path}/Outputs/SNPs_indels_FAIL/${seq}.indels.FAIL.vcf" ]; then
		log_eval "$PBS_O_WORKDIR" "$GATK VariantFiltration -R $REF_FASTA -O $GATK_INDELS_AMB -V $GATK_RAW_INDELS_FILE -filter \"MLEAF < $MLEAF_INDEL\" --filter-name \"FAIL\" -filter \"MQ < $MQ_INDEL\" --filter-name \"FAIL1\" -filter \"QD < $QD_INDEL\" --filter-name \"FAIL2\" -filter \"FS > $FS_INDEL\" --filter-name \"FAIL3\" -filter \"QUAL < $QUAL_INDEL\" --filter-name \"FAIL5\""
	fi
	if [ ! -s "$GATK_INDELS_FAIL" -a ! -s "${seq_path}/Outputs/SNPs_indels_FAIL/${seq}.indels.FAIL.vcf" ]; then	
		header_amb_indel=`grep -n "#CHROM" $GATK_INDELS_AMB | cut -d':' -f 1`
		head -n "$header_amb_indel" "$GATK_INDELS_AMB" > "$GATK_INDELS_HEAD2"
		cat "$GATK_INDELS_AMB" | grep FAIL | cat "$GATK_INDELS_HEAD2" - > "$GATK_INDELS_FAIL"
	fi

	if [ "$annotate" == yes ]; then
		if [ ! -d "$PBS_O_WORKDIR"/"${seq}"/unique/annotated ]; then
			mkdir "$PBS_O_WORKDIR"/"${seq}"/unique/annotated
		fi
		if [ ! -s "$ANNOTATED_SNPS" ]; then
			log_eval "$PBS_O_WORKDIR"/"${seq}"/unique/annotated "$JAVA -jar $SNPEFF eff -no-downstream -no-intergenic -ud 100 -v $variant_genome $GATK_PASS_SNPS_FILE > $ANNOTATED_SNPS"
			mv "$PBS_O_WORKDIR"/"${seq}"/unique/annotated/snpEff_genes.txt "$PBS_O_WORKDIR"/"${seq}"/unique/annotated/snpEff_genes_SNPs.txt
			mv "$PBS_O_WORKDIR"/"${seq}"/unique/annotated/snpEff_summary.html "$PBS_O_WORKDIR"/"${seq}"/unique/annotated/snpEff_summary_SNPs.html
		fi
		if [ ! -s "$ANNOTATED_INDELS" ]; then
			log_eval "$PBS_O_WORKDIR"/"${seq}"/unique/annotated "$JAVA -jar $SNPEFF eff -no-downstream -no-intergenic -ud 100 -v $variant_genome $GATK_PASS_INDELS_FILE > $ANNOTATED_INDELS"
			mv "$PBS_O_WORKDIR"/"${seq}"/unique/annotated/snpEff_genes.txt "$PBS_O_WORKDIR"/"${seq}"/unique/annotated/snpEff_genes_indels.txt
			mv "$PBS_O_WORKDIR"/"${seq}"/unique/annotated/snpEff_summary.html "$PBS_O_WORKDIR"/"${seq}"/unique/annotated/snpEff_summary_indels.html
		fi
		if [ -s "$PBS_O_WORKDIR"/"${seq}"/unique/annotated/"${seq}".indels.PASS.vcf.annotated ]; then
			cp "$PBS_O_WORKDIR"/"${seq}"/unique/annotated/"${seq}".indels.PASS.vcf.annotated  "$PBS_O_WORKDIR"/Outputs/Annotated_variants/"${seq}".indels.PASS.vcf.annotated
		fi
		if [ -s "$PBS_O_WORKDIR"/"${seq}"/unique/annotated/"${seq}".snps.PASS.vcf.annotated ]; then
			cp "$PBS_O_WORKDIR"/"${seq}"/unique/annotated/"${seq}".snps.PASS.vcf.annotated  "$PBS_O_WORKDIR"/Outputs/Annotated_variants/"${seq}".snps.PASS.vcf.annotated
		fi  	
	fi


	if [ ! -s "$PBS_O_WORKDIR"/"${seq}"/unique/deletion_summary.txt ]; then
		echo "Generation of deletion summary"
		echo -e "Chromosome\tStart\tEnd\tInterval" > "$PBS_O_WORKDIR"/"${seq}"/unique/tmp.header
		zcat "$PBS_O_WORKDIR"/"${seq}"/unique/output.per-base.bed.gz| awk '$4 ~ /^0/ { print $1,$2,$3,$3-$2 }' > "$PBS_O_WORKDIR"/"${seq}"/unique/del.summary.tmp #need to include chromosome name here
		cat "$PBS_O_WORKDIR"/"${seq}"/unique/tmp.header "$PBS_O_WORKDIR"/"${seq}"/unique/del.summary.tmp > "$PBS_O_WORKDIR"/"${seq}"/unique/deletion_summary.txt  
		rm "$PBS_O_WORKDIR"/"${seq}"/unique/del.summary.tmp
	fi


	if [ ! -s "$PBS_O_WORKDIR"/"${seq}"/unique/duplication_summary.txt ]; then
	  echo "Generation of up-regulation summary"
	  zcat "$PBS_O_WORKDIR"/"${seq}"/unique/output.per-base.bed.gz| awk -v DUP_CUTOFF="$DUP_CUTOFF" '$4 >= DUP_CUTOFF { print $1,$2,$3,$3-$2 }' > "$PBS_O_WORKDIR"/"${seq}"/unique/dup.summary.tmp
	  i=$(head -n1 "$PBS_O_WORKDIR"/"${seq}"/unique/dup.summary.tmp | awk '{ print $2 }')
	  k=$(tail -n1 "$PBS_O_WORKDIR"/"${seq}"/unique/dup.summary.tmp | awk '{ print $3 }')
	  chr=$(head -n1 "$PBS_O_WORKDIR"/"${seq}"/unique/dup.summary.tmp | awk '{ print $1 }')

	  #The multiple test cases for  i  allow some tolerance in the summary output (2bp of lower coverage). Coverage data can become somewhat noisy so the multiple test condition for the initial if partially smooths the data.
	  awk -v i="$i" -v k="$k" -v chr="$chr" 'BEGIN {printf "chromosome " chr " start " i " "; j=i} {if (i==$2 || i==$2-1 || i==$2-2 ) { 
		i=$3;	
		}
		else {
		  print "end "i " interval " i-j;
		  j=$2;
		  i=$3;
		  printf "chromosome " $1 " start "j " ";
		}} END {print "end "k " interval "k-j}' < "$PBS_O_WORKDIR"/"${seq}"/unique/dup.summary.tmp > "$PBS_O_WORKDIR"/"${seq}"/unique/dup.summary.tmp1
	  sed -i 's/chromosome\|start \|end \|interval //g' "$PBS_O_WORKDIR"/"${seq}"/unique/dup.summary.tmp1	   
	  echo -e "Chromosome\tStart\tEnd\tInterval" > "$PBS_O_WORKDIR"/"${seq}"/unique/dup.summary.tmp.header
	  cat "$PBS_O_WORKDIR"/"${seq}"/unique/dup.summary.tmp.header "$PBS_O_WORKDIR"/"${seq}"/unique/dup.summary.tmp1 > "$PBS_O_WORKDIR"/"${seq}"/unique/duplication_summary.txt
	  #rm "$PBS_O_WORKDIR"/${seq}/unique/dup.summary.tmp.header "$PBS_O_WORKDIR"/${seq}/unique/dup.summary.tmp "$PBS_O_WORKDIR"/${seq}/unique/dup.summary.tmp1
	fi
fi

if [ -s "$GATK_SNP_FAIL" ]; then
    mv "$GATK_SNP_FAIL" "${seq_path}"/Outputs/SNPs_indels_FAIL/
fi
if [ -s "$GATK_INDELS_FAIL" ]; then 
    mv "$GATK_INDELS_FAIL" "${seq_path}"/Outputs/SNPs_indels_FAIL/
fi
if [ -s "$GATK_PASS_SNPS_FILE" ]; then
    mv "$GATK_PASS_SNPS_FILE" "${seq_path}"/Outputs/SNPs_indels_PASS/
fi
if [ -s "$GATK_PASS_INDELS_FILE" ]; then
    mv "$GATK_PASS_INDELS_FILE" "${seq_path}"/Outputs/SNPs_indels_PASS/
fi
if [ -s "${PBS_O_WORKDIR}"/"${seq}"/unique/"${seq}".snps.indels.PASS.mixed.vcf ]; then
	cp "${PBS_O_WORKDIR}"/"${seq}"/unique/"${seq}".snps.indels.PASS.mixed.vcf "$seq_path"/Outputs/SNPs_indels_PASS/"${seq}".snps.indels.PASS.mixed.vcf
fi
if [ -f "${seq_path}/${seq}/unique/${seq}.sample_statistics" ]; then
    rm "${seq_path}"/"${seq}"/unique/"${seq}".sample_statistics "${seq_path}"/"${seq}"/unique/"${seq}".sample_interva* "${seq_path}"/"${seq}"/unique/"${seq}".sample_cumulativ*
fi

[ -f "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".snps.filter.vcf ] && rm "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".snps.filter.*
[ -f "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".snps.AMB.vcf ] && rm "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".snps.AMB.*
[ -f "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".snp.head.vcf ] && rm "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".snp.head*
[ -f "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".indels.filter.vcf ] && rm "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".indels.filter*
[ -f "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".indel.head.vcf ] && rm "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".indel.head*
[ -f "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".indels.head2.vcf ] && rm "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".indels.head*
[ -f "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".indels.AMB.vcf ] && rm "$PBS_O_WORKDIR"/"${seq}"/unique/"${seq}".indels.AMB*
if [ -s "$PBS_O_WORKDIR"/"${seq}"/unique/output.per-base.bed.gz ]; then
  rm "$PBS_O_WORKDIR"/"${seq}"/unique/output.*
  rm "$PBS_O_WORKDIR"/"${seq}"/unique/dup.summary.*
fi

## create directory structure for each sequence file
if [ ! -d "$PBS_O_WORKDIR"/"${seq}"/unique/CARD ]; then
    mkdir -p "$PBS_O_WORKDIR"/"${seq}"/unique/CARD
fi  

#########################################################################
##                                                                     ##
## This section will align to the CARD database and call gene presence ##
##                                                                     ##
#########################################################################

if [ ! -s "$CARD_GATK_REALIGNED_BAM" ]; then
    log_eval "$PBS_O_WORKDIR" "$BWA mem -R '@RG\tID:${org}\tSM:${seq}\tPL:ILLUMINA' -a -t 2 $CARD_REF_FILE $READ1_FILE $READ2_FILE > $CARD_SAM"   		
fi

if [ ! -s "$CARD_BAM_UNIQUE_FILE.bam" -a ! -s "$CARD_GATK_REALIGNED_BAM" ]; then
  	log_eval "$PBS_O_WORKDIR" "$SAMTOOLS view -h -b -@ 1 -q 1 -o $CARD_BAM_TEMP_FILE $CARD_SAM && $SAMTOOLS sort -@ 1 -o $CARD_BAM_UNIQUE_FILE $CARD_BAM_TEMP_FILE"
	rm "$CARD_BAM_TEMP_FILE"
fi

if [ -s "$CARD_SAM" ]; then
  rm "$CARD_SAM"
fi
  
if [ ! -s "$CARD_BAM_UNIQUE_INDEX_FILE" -a ! -s "$CARD_GATK_REALIGNED_BAM" ]; then
    log_eval "$PBS_O_WORKDIR" "$SAMTOOLS index $CARD_BAM_UNIQUE_FILE"
fi

if [ ! -s "$CARD_COV_FILE" ]
    then
        log_eval "$PBS_O_WORKDIR" "$BEDTOOLS coverage -abam $CARD_GATK_REALIGNED_BAM -b $CARD_BED_WINDOW_FILE > $CARD_COV_FILE"
fi

if [ -s "$CARD_COV_FILE" ]; then
    mv "$CARD_COV_FILE" "$seq_path"/Outputs/CARD
fi

if [ -f "$seq_path"/"${seq}"/unique/CARD/"${seq}".sample_statistics ]; then
    rm "$seq_path"/"${seq}"/unique/CARD/"${seq}".sample_statistics "$PBS_O_WORKDIR"/"${seq}"/unique/CARD/"${seq}".sample_interva* "$PBS_O_WORKDIR"/"${seq}"/unique/CARD/"${seq}".sample_cumulativ*
fi

exit 0