#!/usr/bin/env nextflow

/*
 *
 *  Pipeline            ARDaP - CARD support pipeline
 *  Version             1.4
 *  Description         Download and index CARD DB
 *  Notes               This is a support script for updating indices
 *                      of the CARD DB for ARDaP.
 *
 */


//Overwrites data in resources/card/latest, can be changed here or on CLI:

params.outdir = "$baseDir/resources/card/latest"
params.window = 10000

process Download {

  executor 'local'
  publishDir "${params.outdir}", pattern: "*.txt", mode: "copy"
  publishDir "${params.outdir}", pattern: "card.fasta", mode: "copy"


  output:
  file('date.txt')
  file("card.fasta") into (card_bwa, card_sam, card_bed)

  shell:

  """
  wget https://card.mcmaster.ca/latest/data -O card-data.tar.bz2
  tar xvjf card-data.tar.bz2
  wget https://card.mcmaster.ca/latest/ontology -O card-ontology.tar.bz2
  tar xvjf card-ontology.tar.bz2
  mv nucleotide_fasta_protein_homolog_model.fasta card.fasta
  date > date.txt
  """

}

process BWAIndex {

   label "index"
   publishDir "${params.outdir}", mode: "copy"

   input:
   file(ref) from card_bwa

   output:
   file("card.*")

   """
   bwa index -a is $ref
   """

}

process SAMtoolsIndex {

   label "index"
   publishDir "${params.outdir}", mode: "copy"

   input:
   file(ref) from card_sam

   output:
   file("${ref}.fai") into card_bed_fai

   """
   samtools faidx $ref
   """

}

process BEDtoolsIndex {

   label "card"
   publishDir "${params.outdir}", mode: "copy"

   input:
   file(ref) from card_bed
   file(ref_index) from card_bed_fai

   output:
   file("${ref.baseName}.bed")
   file("${ref.baseName}.coverage.bed")

   """
   bedtools makewindows -g $ref_index -w $params.window > ${ref.baseName}.bed && bedtools makewindows -g $ref_index -w 90000000 > ${ref.baseName}.coverage.bed
   """

}
