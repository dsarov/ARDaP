# ARDaP - Antimicrobial Resistance Detection and Prediction <img src='image.png' align="right" height="210" />


![](https://img.shields.io/badge/version-alpha-red.svg)
![](https://img.shields.io/badge/lifecycle-experimental-orange.svg)
![](https://img.shields.io/badge/docs-latest-green.svg)
![](https://img.shields.io/badge/BioRxiv-prep-green.svg)


ARDaP was written by Derek Sarovich ([@DerekSarovich](https://twitter.com/DerekSarovich)) (University of the Sunshine Coast, Australia) with database construction, code testing and feature design by Danielle Madden ([@dmadden9](https://twitter.com/demadden9)), Eike Steinig ([@EikeSteinig](https://twitter.com/EikeSteinig)) (Australian Institute of Tropical Health and Medicine, Australia) and Erin Price ([@Dr_ErinPrice](https://twitter.com/Dr_ErinPrice)).


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

ARDaP is available on our development channel and its dependencies can be installed with:

`conda install -c esteinig -c bioconda -c r ardap`

The pipeline itself is run with Nextflow from a local cache of the repository:

`nextflow run dsarov/ardap`

The local cache can be updated with

`nextflow pull dsarov/ardap`

If you want to make changes to the default `nextflow.config` file
clone the workflow into a local directory and change parameters
in `nextflow.config`:

    `nextflow clone dsarov/ardap install_dir/`

## Usage

To control the data pipeline, ARDaP is implemented in Nextflow. More information about Nextflow can be found here --> https://www.nextflow.io/docs/latest/getstarted.html

ARDaP can be called from the command line through Nextflow (https://www.nextflow.io/docs/latest/getstarted.html). This will pull the current workflow into local storage. Any parameter in the configuration file `nextflow.config` can be changed on the command line via `--` dashes, while Nextflow runtime parameters can be changed via `-` dash. 

For example, to run Nextflow with a maximum job queue size of 300 and the default cluster job submission template profile for `PBS`, and activate the mixture setting in `ARDaP` we can simply run:

`nextflow run dsarov/ardap -qs 300 -profile pbs --mixture true`

## Resource Managers

ARDaP is written in the nextflow language and as such has support for most resource management systems.

List of schedulers and default template profiles in `nextflow.config` and can be selected when the pipeline is initiated with the `--executor` flag. For example, if you want to run ARDaP on a system with PBS, simply set `--executor pbs` when initialising ARDaP.

If you need any more information about how to set your resource manager (e.g. memory, queue, account settings) see https://www.nextflow.io/docs/latest/executor.html

## ARDaP Workflow

To achieve high-quality variant calls, ARDaP incorporates the following programs into its workflow:

- Burrows Wheeler Aligner (BWA) ([doi: 10.1093/bioinformatics/btp324](https://academic.oup.com/bioinformatics/article/25/14/1754/225615))

- SAMTools (ref)
- Picard (ref)
- Genome Analysis Toolkit (GATK) (ref)
- BEDTools (ref)
- SNPEff (ref)
- VCFtools (ref)

## Parameters
   
Optional Parameter: \
  `--mixture`   Optionally perform within species mixtures analysis or metagenomic analysis for species of interest. Run ARDaP with the --mixtures flag for analysis with multiple strains and/or metagenomic data. Default=false
  
  `--size` ARDaP can optionally down-sample your read data to run through the pipeline quicker (integer value expected). Default=6000000, which roughly cooresponds to a 50x coverage given a genome size of 6Mbp. To switch downsampling off, specify --size 0. Note that this option is switch off when mixture analysis is requested.
  
  `--phylogeny` Use this flag if you would like a whole genome phylogeny or a combined and annotated variant file. Note that this may take a long time if you have a large number of isolates. Default=false
  
  ARDaP requires at least a reference genome and the name of the associated database
  Currently there are databases available for:
  <i>Pseudomonas aeruginosa</i> `--database Pseudomonas_aeruginosa_pao1`
  <i>Burkholderia pseudomallei</i> `--database Burkholderia_pseudomallei_k96243`
  
  For example: \
  `nextflow run dsarov/ardap --database Pseudomonas_aeruginosa_pao1`


## Important Information

### File names
ARDaP, by default, expects reads to be paired-end, Illumina data in the following format: 

```
STRAIN_1.fastq.gz (first pair) 
STRAIN_2.fastq.gz (second pair)
```
Reads not in this format will be ignored. 

### ARDaP requires a reference file in FASTA format

By default, all reads in Illumina format (i.e. strain_1.fastq.gz) in the present working directory are processed. Sequence files are aligned against the reference using BWA. Alignments are subsequently filtered and converted using SAMtools and Picard Tools. SNPs and indels are identified with GATK and coverage assessed with BEDtools. 

### Database-creation

TO BE ADDED

### Bugs!!
Please send bug reports to derek.sarovich@gmail.com or log them in the github issues tab
=======
Please send bug reports to derek.sarovich@gmail.com.
