/*
======================================================================
      Part 1: create reference indices, dict files and bed files
======================================================================
*/

process IndexReference {

    label "index"

    input:
    path reference

    output:
    path "ref.*", emit: index
    path "${reference}.fai", emit: fai
    path "${reference.baseName}.dict", emit: dict
    path "${reference}.bed", emit: bed

    script:
    """
    bwa index -a is -p ref $reference
    samtools faidx $reference
    picard CreateSequenceDictionary R=$reference O=${reference.baseName}.dict
    bedtools makewindows -g ${reference}.fai -w $params.window > ${reference}.bed
    """
}

/*
======================================================================
   Part 1A: build the interval list ONCE per run (only used by --fast)
   Whole-genome and mixture runs never call this process.
======================================================================
*/

process MakeIntervals {

    label "index"
    // A failure here would otherwise silently drop every sample, so stop the run instead
    errorStrategy 'terminate'

    input:
    path resistance_db
    val snpeff_db

    output:
    path "intervals.list", emit: intervals

    script:
    """
    if [ -s ${projectDir}/Databases/${snpeff_db}/intervals.list ]; then
      # A pre-built list shipped with the database takes priority
      cp ${projectDir}/Databases/${snpeff_db}/intervals.list intervals.list
    else
      sqlite3 ${resistance_db} "SELECT Coverage.Gene FROM Coverage;" > gene.list.coverage
      sqlite3 ${resistance_db} "SELECT Variants_SNP_indel.Gene_name FROM Variants_SNP_indel;" > gene.list.variants
      cat gene.list.variants gene.list.coverage | sort -u > gene.list
      snpEff genes2bed ${snpeff_db} -dataDir ${projectDir}/resources/snpeff -f gene.list > genes.bed
      sed 's/\\t/:/;s/\\t/-/' genes.bed | awk '{print \$1}' | tail -n+2 > intervals.list
    fi
    """
}
