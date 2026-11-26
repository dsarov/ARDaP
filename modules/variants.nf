/*
=======================================================================
                        Part 2F: Variant identification
=======================================================================
Non-mixture samples: variant calling, SQL queries and the report run as ONE job (VariantCalling).
Mixture samples: VariantCallingMixture -> MixtureSummariesSQL -> SqlSnpsIndelsMix -> R_report.
*/

process VariantCalling {

    label "gatk"
    tag "$id"
    publishDir "./Outputs/Variants/VCFs", mode: 'copy', pattern: "*FAIL*.vcf", overwrite: false
    publishDir "./Outputs/Variants/VCFs", mode: 'copy', pattern: "*PASS*.vcf", overwrite: false
    publishDir "./Outputs/Variants/Annotated", mode: 'copy', pattern: "*annotated*.vcf", overwrite: false
    publishDir "./Outputs/AbR_reports", mode: 'copy', pattern: "*_report.html", overwrite: true
    publishDir "./Outputs/AbR_reports", mode: 'copy', pattern: "*.AbR_output.final.txt", overwrite: true

    input:
    path reference
    path reference_fai
    path reference_dict
    path intervals, stageAs: 'intervals.list'
    tuple val(id), path(dedup_bam), path(dedup_index), path(perbase), path(depth), path(resfinder)
    path resistance_db
    path patient_meta, stageAs: 'patientMetaData.csv'
    val snpeff_db

    output:
    tuple val(id), path("${id}.PASS.snps.vcf"), path("${id}.FAIL.snps.vcf"), emit: filtered_snps
    tuple val(id), path("${id}.PASS.indels.vcf"), path("${id}.FAIL.indels.vcf"), emit: filtered_indels
    tuple val(id), path("${id}.annotated.indel.effects"), emit: indel_effects
    tuple val(id), path("${id}.annotated.snp.effects"), emit: snp_effects
    tuple val(id), path("${id}.Function_lost_list.txt"), emit: function_lost
    tuple val(id), path("${id}.PASS.snps.annotated.vcf"), emit: annotated_snps
    tuple val(id), path("${id}.PASS.indels.annotated.vcf"), emit: annotated_indels
    tuple val(id), path("${id}.deletion_summary.txt"), emit: deletions
    tuple val(id), path("${id}.duplication_summary.txt"), emit: duplications
    tuple val(id), path("${id}_report.html"), path("${id}.AbR_output.final.txt"), emit: report

    script:
    """
    bash VariantCalling.sh ${id} ${reference} ${projectDir} ${snpeff_db} ${params.fast} ${task.cpus} intervals.list ${params.hc_chunks} ${task.memory.toGiga()}
    echo "[timer] variant calling finished at \${SECONDS}s"

    # the database queries and the report take about a second, so they run in this job
    # rather than paying for two more scheduler submissions per sample
    bash SQL_queries_SNP_indel.sh ${id} ${resistance_db}
    echo "[timer] SNP/indel queries finished at \${SECONDS}s"
    bash SQL_queries_DelDup.sh ${id} ${resistance_db}
    echo "[timer] deletion/duplication queries finished at \${SECONDS}s"
    bash AbR_reports.sh ${id} ${resistance_db}
    echo "[timer] AbR report finished at \${SECONDS}s"
    bash Report_html.sh ${params.species}
    echo "[timer] HTML report finished at \${SECONDS}s"
    """
}

process VariantCallingMixture {

    label "gatk"
    tag "$id"
    publishDir "./Outputs/Variants/Annotated", mode: 'copy', pattern: "*.ALL.annotated.mixture.vcf", overwrite: false
    publishDir "./Outputs/Variants/VCFs", mode: 'copy', pattern: "*.PASS.snps.indels.mixed.vcf", overwrite: false

    input:
    path reference
    path reference_fai
    path reference_dict
    tuple val(id), path(dedup_bam), path(dedup_index), path(resfinder)
    val snpeff_db

    output:
    tuple val(id), path("${id}.ALL.annotated.mixture.vcf"), emit: annotated
    tuple val(id), path("pindel.out_D.vcf"), emit: pindel_d
    tuple val(id), path("pindel.out_TD.vcf"), emit: pindel_td
    tuple val(id), path("${id}_resfinder.txt"), emit: resfinder
    tuple val(id), path("${id}.PASS.snps.indels.mixed.vcf"), emit: pass

    script:
    """
    gatk HaplotypeCaller -R ${reference} --native-pair-hmm-threads $task.cpus --I ${id}.dedup.bam -O ${id}.raw.snps.indels.mixed.vcf

    gatk VariantFiltration -R ${reference} -O ${id}.snps.indels.filtered.mixed.vcf -V ${id}.raw.snps.indels.mixed.vcf \
    -filter "MQ < $params.MQ_SNP" --filter-name "MQFilter" \
    -filter "FS > $params.FS_SNP" --filter-name "FSFilter" \
    -filter "QUAL < $params.QUAL_SNP" --filter-name "StandardFilters"

    header=`grep -n "#CHROM" ${id}.snps.indels.filtered.mixed.vcf | cut -d':' -f 1`
    head -n "\$header" ${id}.snps.indels.filtered.mixed.vcf > snp_head
    cat ${id}.snps.indels.filtered.mixed.vcf | grep PASS | cat snp_head - > ${id}.PASS.snps.indels.mixed.vcf

    snpEff eff -nodownload -no-downstream -no-intergenic -ud 100 -v -dataDir ${projectDir}/resources/snpeff ${snpeff_db} ${id}.PASS.snps.indels.mixed.vcf > ${id}.ALL.annotated.mixture.vcf

    echo -e "${id}.dedup.bam\t500\tB" > pindel.bam.config
    pindel -f ${reference} -T $task.cpus -i pindel.bam.config -o pindel.out

    rm -f pindel.out_CloseEndMapped pindel.out_INT_final

    for f in pindel.out_*; do
      pindel2vcf -r ${reference} -R ${reference.baseName} -d ARDaP -p \$f -v \${f}.vcf -e 5 -is 15 -as 50000
      snpEff eff -no-downstream -no-intergenic -ud 100 -v -dataDir ${projectDir}/resources/snpeff ${snpeff_db} \${f}.vcf > \${f}.vcf.annotated
    done
    """
}

process MixtureSummariesSQL {

    label "ardap_default"
    tag "$id"

    input:
    tuple val(id), path(variants), path(pindelD), path(pindelTD), path(resfinder)

    output:
    tuple val(id), path("${id}.annotated.ALL.effects"), emit: effects
    tuple val(id), path("${id}.Function_lost_list.txt"), emit: function_lost
    tuple val(id), path("${id}.deletion_summary_mix.txt"), emit: deletions
    tuple val(id), path("${id}.duplication_summary_mix.txt"), emit: duplications
    tuple val(id), path("${id}_resfinder.txt"), emit: resfinder

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

process SqlSnpsIndelsMix {

    label "genomic_queries"
    tag "$id"

    input:
    tuple val(id), path(effects), path(function_lost), path(deletions), path(duplications), path(resfinder)
    path resistance_db
    path patient_meta, stageAs: 'patientMetaData.csv'

    output:
    tuple val(id), path("${id}.AbR_output.final.txt"), path("patientMetaData.csv"), path("patientDrugSusceptibilityData.csv"), emit: report_inputs

    script:
    """
    bash SQL_queries_SNP_indel_mix.sh ${id} ${resistance_db}
    bash SQL_queries_DelDupMix.sh ${id} ${resistance_db}
    bash AbR_reports_mix.sh ${id} ${resistance_db}
    """
}

process R_report {

    label "report"
    tag "$id"
    publishDir "./Outputs/AbR_reports", mode: 'copy', overwrite: true

    input:
    tuple val(id), path(abr_output), path(patient_meta), path(drug_data)

    output:
    tuple val(id), path("${id}_report.html"), path("${id}.AbR_output.final.txt"), emit: report

    script:
    """
    bash Report_html.sh ${params.species}
    """
}

process GWASInterrogate {

    label "genomic_queries"
    tag "$id"
    publishDir "./Outputs/AbR_reports", mode: 'copy', overwrite: true

    input:
    tuple val(id), path(snps), path(indels)
    path resistance_db

    output:
    tuple val(id), path("${id}.AbR_output.GWAS_SNP.txt"), emit: gwas_snp
    tuple val(id), path("${id}.AbR_output.GWAS_indel.txt"), emit: gwas_indel

    script:
    """
    bash SQL_GWAS.sh ${id} ${resistance_db}
    """
}
