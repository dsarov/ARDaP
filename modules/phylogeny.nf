/*
===========================================================================
= Phylogeny (--phylogeny): GVCF per sample, merged master VCF, SNP matrix and trees
= Ported from DSL1 unchanged. A redesign of this part is planned for a later update.
===========================================================================
*/

process VariantCallingGVCF {

    label "gatk"
    tag "$id"
    publishDir "./Outputs/Variants/GVCFs", mode: 'copy', overwrite: false, pattern: '*.gvcf'

    input:
    path reference
    path reference_fai
    path reference_dict
    tuple val(id), path(dedup_bam), path(dedup_index)

    output:
    tuple val(id), path("${id}.raw.gvcf"), emit: gvcf

    script:
    """
    gatk HaplotypeCaller -R ${reference} --ploidy 1 --native-pair-hmm-threads $task.cpus -ERC GVCF --I ${id}.dedup.bam -O ${id}.raw.gvcf
    """
}

process Master_vcf {

    label "master_vcf"
    publishDir "./Outputs/Master_vcf", mode: 'copy', overwrite: true

    input:
    path gvcfs
    path reference
    path reference_fai
    path reference_dict

    output:
    tuple path("out.filtered.vcf"), path("out.vcf"), emit: vcfs

    script:
    """
    bash Master_vcf.sh ${reference.baseName}
    gatk VariantFiltration -R ${reference} -O out.filtered.vcf -V out.vcf \
    --cluster-size $params.CLUSTER_SNP -window $params.CLUSTER_WINDOW_SNP \
    -filter "QD < $params.QD_SNP" --filter-name "QDFilter" \
    -filter "MQ < $params.MQ_SNP" --filter-name "MQFilter" \
    -filter "FS > $params.FS_SNP" --filter-name "HaplotypeScoreFilter"
    """
}

process snp_matrix {

    label "snp_matrix"
    publishDir "./Outputs/Phylogeny_and_annotation", mode: 'copy', overwrite: false

    input:
    tuple path(filtered_vcf), path(out_vcf)

    output:
    path "Ortho_SNP_matrix.nex"
    path "MP_phylogeny.tre"
    path "ML_phylogeny.tre"
    path "All_SNPs_indels_annotated.txt"

    script:
    """
    bash SNP_matrix.sh $params.snpeff ${projectDir}
    """
}
