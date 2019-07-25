# ARDaP - Antimicrobial Resistance Detection and Prediction 
                                                                ![GitHub Logo](image.png)


ARDaP was written by Derek Sarovich ([@DerekSarovich](https://twitter.com/DerekSarovich)), Eike Steinig and Erin Price ([@Dr_ErinPrice](https://twitter.com/Dr_ErinPrice)) at University of the Sunshine Coast, Queensland, Australia.
## Contents

- [Introduction](#introduction)
- [Installation](#Installation)
- [Resource Managers](#resource-managers)
- [ARDaP Workflow](#spandx-workflow)
- [Usage](#usage)
- [Parameters](#parameters)
- [Important Information](#important-information)
- [Custom database creation](#Database-creation)
- [Citation](#citation)


## Introduction

ARDaP (Antimicrobial Resistance Detection and Prediction) is a genomics pipeline 
for the comprehensive identification of antibiotic resistance markers from whole-genome
sequencing data. The impetus behind the creation of ARDaP was our frustration 
with current methodology not being able to detect antimicrobial resistance when confered by "complex" mechanisms.
Our two species of interest, <i>Burkholderia pseudomallei</i> and <i>Pseudomonas aeruginosa*</i>, develop antimicrobial resistance
in a multiple ways but predominately through chromosomal mutations, including gene loss, copy number variation, single nucleotide polymorphisms and indels. ARDaP will first identify all genetic variation in a sample and then interrogate this information against a user created database of resistance mechanisms. The software will then summarise the identified mechanisms and produce a simple report for the user.

*<i>P. aeruginosa</i> module is still under development

## Installation

**Github**

1) Download the latest installation with git clone

```
git clone https://github.com/dsarov/ARDaP.git
```

2) Install the dependencies \
Option 1 - Use conda to install all dependencies. \
Users are encouraged to use this option as there are fewer chances of failure and downstream errors

```
conda config --add channels bioconda
conda create -n ARDaP_v1.5 bwa bedtools seqtk pindel trimmomatic mosdepth samtools=1.9 gatk picard sqlite snpEff nextflow R 
```

## Resource Managers

ARDaP is mostly written in the nextflow language and as such has support for most common resource management systems.

//Need to include information about how to activate different schedulers

## ARDaP Workflow

To achieve high-quality variant calls, ARDaP incorporates the following programs into its workflow:

- Burrows Wheeler Aligner (BWA) (reference)
- SAMTools (ref)
- Picard (ref)
- Genome Analysis Toolkit (GATK) (ref)
- BEDTools (ref)
- SNPEff (ref)
- VCFtools (ref)

## Usage (will change once nextflow implementation is complete)
To control the data pipeline, ARDaP is implemented in nextflow language
More information about nextflow can be found here --> https://www.nextflow.io/docs/latest/getstarted.html
```
ARDaP.sh -r|--reference <fasta reference genome> -d|--database <Species specific database for resistance determination>
```
## Parameters
   
Optional Parameter: \
  -g|--gwas       Perform genome wide association analysis (yes/no). Default=no \
  -m|--mixtures   Optionally perform within species mixtures analysis. Set this parameter to yes if you are dealing with multiple strains and/or metagenomic data (yes/no). Default=no \
  -s|--size       ARDaP can optionally down-sample your read data to run through the pipeline quicker (integer value expected). Default=6000000 \
  -p|--phylogeny  Please switch to 'yes' if you would like a whole genome phylogeny. Not that this may take a long time if you have a large number of isolates (yes/no). Default=no \
  ARDaP requires at least a reference genome and the name of the associated database \
  Currently there are databases available for: \
  <i>Pseudomonas aeruginosa</i> (-d Pseudomonas_aeruginosa_pao1) \
  <i>Burkholderia pseudomallei</i> (-d Burkholderia_pseudomallei_k96243) \
  
  For example: \
  ARDaP.sh --reference Pa_PA01 --database Pseudomonas_aeruginosa_pao1 \

## Important Information

### File names
ARDaP, by default, expects reads to be paired-end, Illumina data in the following format: 

```
STRAIN_1_sequence.fastq.gz (first pair) 
STRAIN_2_sequence.fastq.gz (second pair)
```
Reads not in this format will be ignored. 

### ARDaP requires a reference file in FASTA format

By default, all reads in ARDaP format (i.e. strain_1_sequence.fastq.gz) in the present working directory are processed. Sequence files are aligned against the reference using BWA. Alignments are subsequently filtered and converted using SAMtools and Picard Tools. SNPs and indels are identified with GATK and coverage assessed with BEDtools. 

### Database-creation

TO BE ADDED

Please send bug reports to derek.sarovich@gmail.com.
