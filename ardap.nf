#!/usr/bin/env nextflow

/*
 *
 *  Pipeline            ARDAP
 *  Version             1.4
 *  Description         Antimicrobial resistance genotyping for B. pseudomallei
 *
 */


log.info """
==================================================================
                           NF-ARDAP
                             v1.4
==================================================================

Required Parameters:

-r|--reference <FASTA reference genome {reference}.fasta>
-d|--database  <Species specific database for resistance determination>

Optional Parameters:

-g|--gwas       Perform genome wide association analysis (yes/no)
-m|--mixtures   Optionally perform within species mixtures analysis.
                Set this parameter to yes if you are dealing with
                multiple strains (yes/no)
-s|--size       ARDaP can optionally down-sample your read data to
                run through the pipeline quicker.
-p|--phylogeny  Please switch to 'yes' if you would like a whole
                genome phylogeny. Not that this may take a long time
                if you have a large number of isolates (yes/no)

==================================================================
==================================================================
"""


/*  Index Section
 *
 *  Create a bunch of indices for ARDaP
 *
 */

// Define Parameters
// $resistance_db $card_db $GWAS_cutoff

// Don't forget to assign CPU for tasks to optimize!

// Check what needs to be done for SE, instead of PE

fastq = Channel
		.fromFilePairs("${params.fastq}", flat: true)
		.ifEmpty { exit 1, "Input read files could not be found." }





process IndexReference {

    // Create reference genome indices and dicationary for PICARD

    label "index"

    input:
    file(reference) from Channel.fromPath("${params.reference}")

    output:
    file("ref.*") into bwa_alignment
    file("${reference}.fai") into (gatk_call_snp_ref_sam, gatk_filter_snp_ref_sam, gatk_filter_indel_ref_sam, pindelReferenceIndex, pindelAnnotationReferenceIndex, mixtureFilterReferenceIndex )
    file("${reference.baseName}.dict") into (gatk_call_snp_ref_picard, gatk_filter_snp_ref_picard, gatk_filter_indel_ref_picard, mixtureFilterReferenceDict)
    file("${reference}.bed") into refcov


    """
    bwa index -a is -p ref $reference
    samtools faidx $reference
    picard CreateSequenceDictionary R=$reference O=${reference.baseName}.dict
    bedtools makewindows -g ${reference}.fai -w $params.window > ${reference}.bed
    """

}

// Reference Alignment and Variant Calling - Updated SPANDx pipeline

if (params.strain == "all") {

    // Variant calling sub-workflow - SPANDX

    // Careful here, not sure if the output overwrites the symlinks
    // created by Nextflow (if input is .fq.gz) and would do weird stuff?

    process Trimmomatic {

        label "spandx_default"
        tag {"$id"}

        input:
        set id, file(forward), file(reverse) from fastq

        output:
        set id, file("${id}_1.fq.gz"), file("${id}_2.fq.gz") into downsample

        """
        trimmomatic PE -threads $task.cpus $forward $reverse \
        ${id}_1.fq.gz ${id}_1_u.fq.gz ${id}_2.fq.gz ${id}_2_u.fq.gz \
        ILLUMINACLIP:${baseDir}/resources/all_adapters.fa:2:30:10: \
        LEADING:10 TRAILING:10 SLIDINGWINDOW:4:15 MINLEN:36
        """
    }

    process Downsample {

        label "spandx_default"
        tag { "$id" }
        publishDir "./Clean_reads", mode: 'copy', overwrite: false

        input:
        set id, file(forward), file(reverse) from downsample

        output:
        set id, file("${id}_1_cov.fq.gz"), file("${id}_2_cov.fq.gz") into (alignment, alignmentCARD)

        script:

        if (params.size > 0)

            """
            seqtk sample -s 11 $forward $params.size | gzip - > ${id}_1_cov.fq.gz
            seqtk sample -s 11 $reverse $params.size | gzip - > ${id}_2_cov.fq.gz
            """

        else

            // Rename files even if not downsampled to channel into Alignment

            """
            mv $forward ${id}_1_cov.fq.gz
            mv $reverse ${id}_2_cov.fq.gz
            """
    }

    process ReferenceAlignment {

        label "spandx_alignment"
        tag {"$id"}

        input:
        file(bwa_index) from bwa_alignment // Index
        set id, file(forward), file(reverse) from alignment // Reads

        output:
        set id, file("${id}.bam"), file("${id}.bam.bai") into dup

        """
        bwa mem -R '@RG\\tID:${params.org}\\tSM:${id}\\tPL:ILLUMINA' -a \
        -t $task.cpus ref $forward $reverse > ${id}.sam
        samtools view -h -b -@ 1 -q 1 -o bam_tmp ${id}.sam
        samtools sort -@ 1 -o ${id}.bam bam_tmp
        samtools index ${id}.bam
        """

    }

    process Deduplicate {

        label "spandx_default"
        tag { "$id" }

        input:
        set id, file(bam), file(bai) from dup

        // Saturday, changed brackets here in case somethign goes wrong??

        output:
        set id, file("${id}.dedup.bam"), file("${id}.dedup.bam.bai") into (averageCoverage, variantCalling, mixturePindel)

        """
        gatk MarkDuplicates -I $bam -O ${id}.dedup.bam --REMOVE_DUPLICATES true \
        --METRICS_FILE ${id}.dedup.txt --VALIDATION_STRINGENCY LENIENT
        samtools index ${id}.dedup.bam
        """
    }

    process ReferenceCoverage {

        label "spandx_default"
        tag { "$id" }

        input:
        file(refcov) from refcov
        set id, file(dedup_bam), file(dedup_index) from averageCoverage

        output:
        set id, file("output.per-base.bed.gz"), file("${id}.depth.txt") into (coverageData, coverageDataCARD)

        """
        mosdepth --by $refcov output $dedup_bam
        sum_depth=\$(zcat output.regions.bed.gz | awk '{print \$4}' | awk '{s+=\$1}END{print s}')
        total_chromosomes=\$(zcat output.regions.bed.gz | awk '{print \$4}' | wc -l)
        echo "\$sum_depth/\$total_chromosomes" | bc > ${id}.depth.txt
        """
    }

    if (params.mixtures) {

      process VariantCallingMixture {

        label "spandx_gatk"
        tag { "$id" }

        input:
        file(reference) from Channel.fromPath("${params.reference}")
        file(fai) from gatk_call_snp_ref_sam
        file(dict) from gatk_call_snp_ref_picard
        set id, file(dedup_bam), file(dedup_index) from variantCalling

        output:
        set id, file("${id}.raw.snps.indels.mixed.vcf"), file("${id}.raw.snps.indels.mixed.vcf.idx") into mixtureFilter

        // Splitting into SNPs and INDELS
        // Might want to speed this one up with threads?

        // v1.4 has this: gatk HaplotypeCaller -R $reference -ERC GVCF --I $GATK_REALIGNED_BAM -O $GATK_RAW_VARIANTS

        """
        gatk HaplotypeCaller -R $reference --I $dedup_bam -O ${id}.raw.snps.indels.mixed.vcf
        """
      }

      process VariantFilterMixture {

        label "spandx_gatk"
        tag { "$id" }
        publishDir "./Outputs/Variants/VCFs", mode: 'copy', overwrite: false
        input:
        file(reference) from Channel.fromPath("${params.reference}")
        file(fai) from mixtureFilterReferenceIndex
        file(dict) from mixtureFilterReferenceDict
        set id, file(variants), file(variants_idx) from mixtureFilter

        output:
        set id, file("${id}.PASS.snps.indels.mixed.vcf") into filteredMixture

        // Not sure if I overlooked something, but no FAIL here

        """
        gatk VariantFiltration -R $reference -O ${id}.snps.indels.filtered.mixed.vcf -V $variants \
        -filter "MQ < $params.MQ_SNP" --filter-name "MQFilter" \
        -filter "FS > $params.FS_SNP" --filter-name "FSFilter" \
        -filter "QUAL < $params.QUAL_SNP" --filter-name "StandardFilters"

        header=`grep -n "#CHROM" ${id}.snps.indels.filtered.mixed.vcf | cut -d':' -f 1`
    		head -n "\$header" ${id}.snps.indels.filtered.mixed.vcf > snp_head
    		cat ${id}.snps.indels.filtered.mixed.vcf | grep PASS | cat snp_head - > ${id}.PASS.snps.indels.mixed.vcf
        """
      }

      process AnnotateMixture {

        label "spandx_snpeff"
        tag { "$id" }

        input:
        set id, file(variants_pass) from filteredMixture

        output:
        set id, file("${id}.ALL.annotated.mixture.vcf") into mixtureArdapProcessing

        """
        snpEff eff -t -nodownload -no-downstream -no-intergenic -ud 100 -v -dataDir $baseDir/resources/snpeff $params.snpeff $variants_pass > ${id}.ALL.annotated.mixture.vcf
        """
      }

      process PindelProcessing {

        label "spandx_pindel"
        tag { "$id" }

        input:
        file(reference) from Channel.fromPath("${params.reference}")
        file(fai) from pindelReferenceIndex
        set id, file(alignment), file(alignment_index) from mixturePindel

        output:
        file("pindel.out_D.vcf") into mixtureDeletionSummary
        file("pindel.out_TD.vcf") into mixtureDuplicationSummary

        // Pindel + threads to run a bit faster
        // In the original script, there is a pindel.out_INT, here: pindel.out_INT_final

        """
        echo -e "$alignment\t250\tB" > pindel.bam.config
        pindel -f $reference -T $task.cpus -i pindel.bam.config -o pindel.out

        rm -f pindel.out_CloseEndMapped pindel.out_INT_final

        for f in pindel.out_*; do
          pindel2vcf -r $reference -R ${reference.baseName} -d ARDaP -p \$f -v \${f}.vcf -e 5 -is 15 -as 50000
          snpEff eff -no-downstream -no-intergenic -ud 100 -v -dataDir $baseDir/resources/snpeff $params.snpeff \${f}.vcf > \${f}.vcf.annotated
        done
        """
      }

      process MixtureSummariesSQL {

        label "spandx_default"

        input:
        set id, file(variants) from mixtureArdapProcessing
        file(pindelD) from mixtureDeletionSummary
        file(pindelTD) from mixtureDuplicationSummary

        output:
        file("${id}.annotated.ALL.effects") into SqlSnpsIndelsMix
        file("${id}.Function_lost_list.txt") into SqlDeletionDuplication, SqlSnpsIndelsMix, SqlSnpsIndelsNoMix
        file("${id}.deletion_summary_mix.txt") into SqlDeletionDuplication
        file("${id}.duplication_summary_mix.txt") into SqlDeletionDuplication
        // check additional escapes in sed command

        // Use shell directive and single quotes to declare Netflow variables as !{var}
        // prevents mucking around with escaping commands in AWK, \ need to be esacaped still

        shell:

        '''
        echo 'Effects summary'

        awk '{if (match($0,"ANN=")){print substr($0,RSTART)}}' !{variants} > all.effects.tmp
        awk -F "|" '{ print $4,$10,$11,$15 }' all.effects.tmp | sed 's/c\\.//' | sed 's/p\\.//' | sed 's/n\\.//'> annotated.ALL.effects.tmp
        grep -E "#|ANN=" !{variants} > ALL.annotated.subset.vcf
        gatk VariantsToTable -V ALL.annotated.subset.vcf -F CHROM -F POS -F REF -F ALT -F TYPE -GF GT -GF AD -GF DP -O ALL.genotypes.subset.table
        tail -n +2 ALL.genotypes.subset.table | awk '{ print $5,$6,$7,$8 }' > ALL.genotypes.subset.table.headerless
        paste annotated.ALL.effects.tmp ALL.genotypes.subset.table.headerless > !{id}.annotated.ALL.effects

        echo 'Identification of high confidence mutations'

        grep '|HIGH|' !{variants} > ALL.func.lost
    		awk '{if (match($0,"ANN=")){print substr($0,RSTART)}}' ALL.func.lost > ALL.func.lost.annotations
    		awk -F "|" '{ print $4,$11,$15 }' ALL.func.lost.annotations | sed 's/c\\.//' | sed 's/p\\.//' | sed 's/n\\.//'> ALL.func.lost.annotations.tmp
    		grep -E "#|\\|HIGH\\|" !{variants} > ALL.annotated.func.lost.vcf
        gatk VariantsToTable -V ALL.annotated.func.lost.vcf -F CHROM -F POS -F REF -F ALT -F TYPE -GF GT -GF AD -GF DP -O ALL.annotated.func.lost.table
    		tail -n +2 ALL.annotated.func.lost.table | awk '{ print $5,$6,$7,$8 }' > ALL.annotated.func.lost.table.headerless
    		paste ALL.func.lost.annotations.tmp ALL.annotated.func.lost.table.headerless > !{id}.Function_lost_list.txt

        echo 'Summary of deletions and duplications'

        grep -v '#' !{pindelD} | awk -v OFS="\t" '{ print $1,$2 }' > d.start.coords.list
    		grep -v '#' !{pindelD} | gawk 'match($0, /END=([0-9]+);/,arr){ print arr[1]}' > d.end.coords.list
    		grep -v '#' !{pindelD} | awk '{ print $10 }' | awk -F":" '{print $2 }' | awk -F"," '{ print $2 }' > mutant_depth.D
    		grep -v '#' !{pindelD} | awk '{ print $10 }' | awk -F":" '{print $2 }' | awk -F"," '{ print $1+$2 }' > depth.D
    		paste d.start.coords.list d.end.coords.list mutant_depth.D depth.D > !{id}.deletion_summary_mix.txt

        grep -v '#' !{pindelTD} | awk -v OFS="\t" '{ print $1,$2 }' > td.start.coords.list
    		grep -v '#' !{pindelTD} | gawk 'match($0, /END=([0-9]+);/,arr){ print arr[1]}' > td.end.coords.list
    		grep -v '#' !{pindelTD} | awk '{ print $10 }' | awk -F":" '{print $2 }' | awk -F"," '{ print $2 }' > mutant_depth.TD
    		grep -v '#' !{pindelTD} | awk '{ print $10 }' | awk -F":" '{print $2 }' | awk -F"," '{ print $1+$2 }' > depth.TD
    		paste td.start.coords.list td.end.coords.list mutant_depth.TD depth.TD > !{id}.duplication_summary_mix.txt
        '''

      }

    } else {

        // Not a mixture:

        process VariantCalling {

          label "spandx_gatk"
          tag { "$id" }

          input:
          file(reference) from Channel.fromPath("${params.reference}")
          file(fai) from gatk_call_snp_ref_sam
          file(dict) from gatk_call_snp_ref_picard
          set id, file(dedup_bam), file(dedup_index) from variantCalling

          output:
          set id, file("${id}.raw.snps.vcf"), file("${id}.raw.snps.vcf.idx") into snpFilter
          set id, file("${id}.raw.indels.vcf"), file("${id}.raw.indels.vcf.idx") into indelFilter

          // v1.4 Line 261 not included yet: gatk HaplotypeCaller -R $reference -ERC GVCF --I $GATK_REALIGNED_BAM -O $GATK_RAW_VARIANTS

          """
          gatk HaplotypeCaller -R $reference --ploidy 1 --I $dedup_bam -O ${id}.raw.snps.indels.vcf
          gatk SelectVariants -R $reference -V ${id}.raw.snps.indels.vcf -O ${id}.raw.snps.vcf -select-type SNP
          gatk SelectVariants -R $reference -V ${id}.raw.snps.indels.vcf -O ${id}.raw.indels.vcf -select-type INDEL
          """
        }

      process FilterSNPs {

        label "spandx_gatk"
        tag { "$id" }

        input:
        file(reference) from Channel.fromPath("${params.reference}")
        file(fai) from gatk_filter_snp_ref_sam
        file(dict) from gatk_filter_snp_ref_picard
        set id, file(snps), file(snps_idx) from snpFilter

        output:
        set id, file("${id}.PASS.snps.vcf"), file("${id}.FAIL.snps.vcf") into filteredSNPs

        """
        gatk VariantFiltration -R $reference -O ${id}.filtered.snps.vcf -V $snps \
        --cluster-size $params.CLUSTER_SNP -window $params.CLUSTER_WINDOW_SNP \
        -filter "MLEAF < $params.MLEAF_SNP" --filter-name "AFFilter" \
        -filter "QD < $params.QD_SNP" --filter-name "QDFilter" \
        -filter "MQ < $params.MQ_SNP" --filter-name "MQFilter" \
        -filter "FS > $params.FS_SNP" --filter-name "FSFilter" \
        -filter "QUAL < $params.QUAL_SNP" --filter-name "StandardFilters"

        header=`grep -n "#CHROM" ${id}.filtered.snps.vcf | cut -d':' -f 1`
    		head -n "\$header" ${id}.filtered.snps.vcf > snp_head
    		cat ${id}.filtered.snps.vcf | grep PASS | cat snp_head - > ${id}.PASS.snps.vcf

        gatk VariantFiltration -R $reference -O ${id}.failed.snps.vcf -V $snps \
        --cluster-size $params.CLUSTER_SNP -window $params.CLUSTER_WINDOW_SNP \
        -filter "MLEAF < $params.MLEAF_SNP" --filter-name "FAIL" \
        -filter "QD < $params.QD_SNP" --filter-name "FAIL1" \
        -filter "MQ < $params.MQ_SNP" --filter-name "FAIL2" \
        -filter "FS > $params.FS_SNP" --filter-name "FAIL3" \
        -filter "QUAL < $params.QUAL_SNP" --filter-name "FAIL5"

        header=`grep -n "#CHROM" ${id}.failed.snps.vcf | cut -d':' -f 1`
    		head -n "\$header" ${id}.failed.snps.vcf > snp_head
    		cat ${id}.filtered.snps.vcf | grep FAIL | cat snp_head - > ${id}.FAIL.snps.vcf
        """
      }

      process FilterIndels {

        label "spandx_gatk"
        tag { "$id" }

        input:
        file(reference) from Channel.fromPath("${params.reference}")
        file(fai) from gatk_filter_indel_ref_sam
        file(dict) from gatk_filter_indel_ref_picard
        set id, file(indels), file(indels_idx) from indelFilter

        output:
        set id, file("${id}.PASS.indels.vcf"), file("${id}.FAIL.indels.vcf") into filteredIndels

        """
        gatk VariantFiltration -R $reference -O ${id}.filtered.indels.vcf -V $indels \
        -filter "MLEAF < $params.MLEAF_INDEL" --filter-name "AFFilter" \
        -filter "QD < $params.QD_INDEL" --filter-name "QDFilter" \
        -filter "FS > $params.FS_INDEL" --filter-name "FSFilter" \
        -filter "QUAL < $params.QUAL_INDEL" --filter-name "QualFilter"

        header=`grep -n "#CHROM" ${id}.filtered.indels.vcf | cut -d':' -f 1`
    		head -n "\$header" ${id}.filtered.indels.vcf > snp_head
    		cat ${id}.filtered.indels.vcf | grep PASS | cat snp_head - > ${id}.PASS.indels.vcf

        gatk VariantFiltration -R  $reference -O ${id}.failed.indels.vcf -V $indels \
        -filter "MLEAF < $params.MLEAF_INDEL" --filter-name "FAIL" \
        -filter "MQ < $params.MQ_INDEL" --filter-name "FAIL1" \
        -filter "QD < $params.QD_INDEL" --filter-name "FAIL2" \
        -filter "FS > $params.FS_INDEL" --filter-name "FAIL3" \
        -filter "QUAL < $params.QUAL_INDEL" --filter-name "FAIL5"

        header=`grep -n "#CHROM" ${id}.failed.indels.vcf | cut -d':' -f 1`
    		head -n "\$header" ${id}.failed.indels.vcf > indel_head
    		cat ${id}.filtered.indels.vcf | grep FAIL | cat indel_head - > ${id}.FAIL.indels.vcf
        """
      }


      process AnnotateSNPs {

        // Need to split and optimize with threads

        label "spandx_snpeff"
        tag { "$id" }

        input:
        set id, file(snp_pass), file(snp_fail) from filteredSNPs

        output:
        set id, file("${id}.PASS.snps.annotated.vcf") into annotatedSNPs

        """
        snpEff eff -t -nodownload -no-downstream -no-intergenic -ud 100 -v -dataDir $baseDir/resources/snpeff $params.snpeff $snp_pass > ${id}.PASS.snps.annotated.vcf
        """
      }

      process AnnotateIndels {

        // Need to split and optimize with threads

        label "spandx_snpeff"
        tag { "$id" }

        input:
        set id, file(indel_pass), file(indel_fail) from filteredIndels

        output:
        set id, file("${id}.PASS.indels.annotated.vcf") into annotatedIndels

        """
        snpEff eff -t -nodownload -no-downstream -no-intergenic -ud 100 -v -dataDir $baseDir/resources/snpeff $params.snpeff $indel_pass > ${id}.PASS.indels.annotated.vcf
        """
      }

      process VariantSummaries {

        label "spandx_default"
        tag { "$id" }

        input:
        set id, file(perbase), file(depth) from coverageData

        output:
        set id, file("${id}.deletion_summary.txt"), file("${id}.duplication_summary.txt")  into summaries

        """
    		echo -e "Chromosome\tStart\tEnd\tInterval" > tmp.header
    		zcat $perbase | awk '\$4 ~ /^0/ { print \$1,\$2,\$3,\$3-\$2 }' > del.summary.tmp
    		cat tmp.header del.summary.tmp > ${id}.deletion_summary.txt

        covdep=\$(head -n 1 $depth)
        DUP_CUTOFF=\$(echo "\$covdep*3" | bc)

        zcat $perbase | awk -v DUP_CUTOFF="\$DUP_CUTOFF" '\$4 >= DUP_CUTOFF { print \$1,\$2,\$3,\$3-\$2 }' > dup.summary.tmp

    	  i=\$(head -n1 dup.summary.tmp | awk '{ print \$2 }')
    	  k=\$(tail -n1 dup.summary.tmp | awk '{ print \$3 }')
    	  chr=\$(head -n1 dup.summary.tmp | awk '{ print \$1 }')

    	  awk -v i="\$i" -v k="\$k" -v chr="\$chr" 'BEGIN {printf "chromosome " chr " start " i " "; j=i} {if (i==\$2 || i==\$2-1 || i==\$2-2 ) {
    		i=\$3;
    		}
    		else {
    		  print "end "i " interval " i-j;
    		  j=\$2;
    		  i=\$3;
    		  printf "chromosome " \$1 " start "j " ";
    		}} END {print "end "k " interval "k-j}' < dup.summary.tmp > dup.summary.tmp1

    	  sed -i 's/chromosome\\|start \\|end \\|interval //g' dup.summary.tmp1
    	  echo -e "Chromosome\\tStart\\tEnd\\tInterval" > dup.summary.tmp.header
    	  cat dup.summary.tmp.header dup.summary.tmp1 > ${id}.duplication_summary.txt
        """
      }

      process VariantSummariesSQL {

        input:
        set id, file(indels) from annotatedIndels
        set id, file(snps) from annotatedSNPs


        shell:

        '''
        awk '{
    			if (match($0,"ANN=")){print substr($0,RSTART)}
    			}' !{indels} > indel.effects.tmp

    		awk -F "|" '{ print $4,$10,$11,$15 }' indel.effects.tmp | sed 's/c\\.//' | sed 's/p\\.//' | sed 's/n\\.//'> annotated.indel.effects

    		awk '{
    			if (match($0,"ANN=")){print substr($0,RSTART)}
    			}' !{snps} > snp.effects.tmp
    		awk -F "|" '{ print $4,$10,$11,$15 }' snp.effects.tmp | sed 's/c\\.//' | sed 's/p\\.//' | sed 's/n\\.//' > annotated.snp.effects

    		echo 'Identifying high consequence mutations'

    		grep 'HIGH' snp.effects.tmp  | awk -F"|" '{ print $4,$11 }' >> Function_lost_list.txt
    		grep 'HIGH' indel.effects.tmp | awk -F"|" '{ print $4,$11 }' >> Function_lost_list.txt

    		sed -i 's/p\\.//' ${id}.Function_lost_list.txt
        '''

      }


    }

    process AlignmentCARD {

      label "spandx_alignment"
      tag { "$id" }

      input:
      file(card_indices) from Channel.fromPath("$baseDir/resources/card/latest/card.*").collect()
      set id, file(forward), file(reverse) from alignmentCARD
      set id, file(perbase), file(depth) from coverageDataCARD

      output:
      set id, file("${id}.card.bam"), file("${id}.card.bam.bai") into card_coverage

      """
      bwa mem -R '@RG\\tID:${params.org}\\tSM:${id}\\tPL:ILLUMINA' -a -t $task.cpus card.fasta $forward $reverse > ${id}.card.sam
      samtools view -h -b -@ 1 -q 1 -o bam_tmp ${id}.card.sam
      samtools sort -@ 1 -o ${id}.card.bam bam_tmp
      samtools index ${id}.card.bam
      """
    }

    process CoverageCARD {

      label "spandx_default"
      tag { "$id" }

      input:
      file(card_coverage) from Channel.fromPath("$baseDir/resources/card/latest/*.bed").collect()
      set id, file(card_bam), file(card_bai) from card_coverage

      output:
      set id, file("${id}.card.bedcov")

      """
      bedtools coverage -abam $card_bam -b card.coverage.bed > ${id}.card.bedcov
      """

    }

}

/*
*These processes will interogate the SQL databases. These have been split to run
*across different flavours of variants so they can be run in parrallel
*
*
*TO DO 
*Eventually want to incorporate into nextflow format rather than outsourcing to shell scripts
*
*
*/

process SqlSnpsIndelsMix {

  label "genomic_queries"
  tag { "$id" }

  input:
  file("${id}.annotated.ALL.effects") from MixturesSummariesSQL
  file("${id}.Function_lost_list.txt") from MixturesSummariesSQL

  output:
  file("${id}.Abr_output.txt") into AbrReport

  """
  run SQL_queries_SNP_indel.sh $id $resistance_db $card_db $GWAS_cutoff

  """
//seq=$1
//RESISTANCE_DB=$2 
//CARD_DB=$3

//##GWAS cutoff value
//cutoff=$4


}

process SqlDeletionDuplication {
  label "genomic_queries"
  tag { "$id" }

  input:
  file("${id}.Function_lost_list.txt") from MixturesSummariesSQL
  file("${id}.deletion_summary_mix.txt") MixturesSummariesSQL
  file("${id}.duplication_summary_mix.txt") MixturesSummariesSQL
}

process SqlSnpsIndelsNoMix { 
  label "genomic_queries"
  tag { "$id" }
}


        file("${id}.annotated.ALL.effects") into SqlSnpsIndelsMix
        file("${id}.Function_lost_list.txt") into SqlDeletionDuplication, SqlSnpsIndelsMix, SqlSnpsIndelsNoMix
        file("${id}.deletion_summary_mix.txt") into SqlDeletionDuplication
        file("${id}.duplication_summary_mix.txt") into SqlDeletionDuplication