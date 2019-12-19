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
- [ARDaP Workflow](#ARDaP-workflow)
- [Usage](#usage)
- [Parameters](#parameters)
- [Examples](#examples)
- [Custom database creation](#Database-creation)
- [Troubleshooting](#Troubleshooting)
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

### Short version for those that just want to get started and understand how environments in conda work

ARDaP is available on our development channel and its dependencies can be installed with:

`conda install -c dsarov -c bioconda -c r -c conda-forge ardap`

The pipeline itself is run with Nextflow from a local cache of the repository:

`nextflow run dsarov/ardap`

The local cache can be updated with

`nextflow pull dsarov/ardap`

If you want to make changes to the default `nextflow.config` file
clone the workflow into a local directory and change parameters
in `nextflow.config`:

`nextflow clone dsarov/ardap install_dir/`

Or navigate to the conda install path of ARDaP and change the `nextflow.config` in that location.

### Long version for those unfamiliar with environments or just want all the steps for recommended installation

1) Make sure you have the conda package manager installed (e.g. Anaconda, miniconda). You can check this by testing if you can find the `conda` command (`which conda`). If you do have conda installed then it's a good idea to update conda so you have the latest version `conda update conda`. If you don't have this software installed then go to [the miniconda install page](https://docs.conda.io/en/latest/miniconda.html) and follow the instructions for your OS. After the install, make sure your install is up-to-date `conda update conda`.

2) Create a new environment with conda called "ardap" and install the software with `conda create --name ardap -c dsarov -c bioconda -c r  -c conda-forge ardap`. Follow the instructions and the software should fully install with all dependencies.

3) ARDaP requires Tex (specifically XeLaTeX) for compilation of the reports. If you don't have this compiler in your PATH or Tex installed on your system, you can follow the instructions here for installation (https://nbconvert.readthedocs.io/en/latest/install.html). On centOS you should be able to run `sudo yum install texlive-xetex` or on Ubuntu `sudo apt-get install texlive-xetex`. Once installed check that `xelatex` is in your PATH i.e. `which xelatex`. If this is still not in your PATH you can edit the nextflow.config file to manually point to the xelatex compiler by editing the line `env.PATH="$PATH:/usr/local/texlive/2017/bin/x86_64-linux/"` 



4) Activate the ardap environment that was installed by conda, `conda activate ardap`

5) To run ARDaP, `nextflow run dsarov/ardap`.

## Usage

To control the data pipeline, ARDaP is implemented in Nextflow. More information about Nextflow can be found [here](https://www.nextflow.io/docs/latest/getstarted.html)

ARDaP can be called from the command line through [Nextflow](https://www.nextflow.io/docs/latest/getstarted.html). This will pull the current workflow into local storage. Any parameter in the configuration file `nextflow.config` can be changed on the command line via `--` dashes, while Nextflow runtime parameters can be changed via `-` dash. 

For example, to run Nextflow with the default cluster job submission template profile for `PBS`, and activate the mixture setting in `ARDaP` we can run:

`nextflow run dsarov/ardap --executor pbs --mixtures`

## Resource Managers

ARDaP is written in the nextflow language and as such has support for most resource management systems.

List of schedulers and default template profiles in `nextflow.config` and can be selected when the pipeline is initiated with the `--executor` flag. For example, if you want to run ARDaP on a system with PBS, simply set `--executor pbs` when initialising ARDaP. Most popular resource managers are supported (e.g. sge, slurm) with the default configuration running on the local system.

If you need any more information about how to set your resource manager (e.g. memory, queue, account settings) see https://www.nextflow.io/docs/latest/executor.html

If you would like to just submit jobs to the resource manager queue without monitoring, then use of the screen or nohup command will allow you to run the pipeline process in the background and won't kill the pipline if the shell is terminated. Examples of nohup are included below.

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
  `--mixtures`   Optionally perform within species mixtures analysis or metagenomic analysis for species of interest. Run ARDaP with the --mixtures flag for analysis with multiple strains and/or metagenomic data. Default=false
  
  Example:
  
  `$ nextflow run dsarov/ardap --mixtures`
  
  `--size` ARDaP can optionally down-sample your read data to run through the pipeline quicker (integer value expected). Default=1000000, which roughly coresponds to a 50x coverage given a genome size of 6Mbp. To switch downsampling off, specify --size 0. Note that this option is switch off when mixture analysis is requested.
  
  Example:
  
  `$ nextflow run dsarov/ardap --size 0 --mixtures`
  
  `--phylogeny` Use this flag if you would like a whole genome phylogeny or a combined and annotated variant file. Note that this may take a long time if you have a large number of isolates. Default=false
  
  Example:
  
  `$ nextflow run dsarov/ardap --phylogeny`
  
  `--database` Use this flag to specify an ARDaP database that contains species specific resistance information. Note that you will also need to specify the correct reference file with `--ref`.
  
  Currently there are databases available for:
  <i>Pseudomonas aeruginosa</i> `--database Pseudomonas_aeruginosa_pao1 --ref Pa_PAO1`
  <i>Burkholderia pseudomallei</i> `--database Burkholderia_pseudomallei_k96243 --ref k96243` 
  
  For example: \
  `nextflow run dsarov/ardap --database Pseudomonas_aeruginosa_pao1 --ref Pa_PAO1`

If you don't want to constantly use the flags for different databases, all of these settings can be changed in the nextflow.config file if the default parameters aren't suitable.

`--fastq` ARDaP, by default, expects reads to be paired-end, Illumina data in the following format: 

```
STRAIN_1.fastq.gz (first pair) 
STRAIN_2.fastq.gz (second pair)
```
Reads not in this format will be ignored unless you change the `--fastq` flag to match the read naming on your system.

Example:

If your reads are in the following format

```
STRAIN_1_sequence.fq.gz (first pair) 
STRAIN_2_sequence.fq.gz (second pair)
```
`nextflow run dsarov/ardap --fastq "*_{1,2}_sequence.fq.gz"`

### Database Creation

The creators of ARDaP have thus far developed and validated a custom database of AMR variants for *Burkholderia pseudomallei*, and the construction of a *Pseudomonas aeruginosa*-specific AMR database is in progress. But ARDaP is capable of detecting and predicting AMR determinants in any bacterial species of interest. It just requires the user to construct a database of all known AMR determinants acquired from a) horizontal gene gain (through incorporation and improved annotation of the CARD database) and b) chromosomal mutations such as single nucleotide polymorphisms (SNPs), insertion-deletions (indels) and copy-number variations (CNVs). This task first requires a thorough review of the literature, followed by manual cataloguing and verification of individual resistance determinants that specify not only what class, but what specific antibiotic/s are affected by the presence of an AMR variant. Development of such detailed databases can be laborious and time consuming, and certainly require regular updates as new AMR variants are published in the literature, but this activity is essential for truly comprehensive AMR detection. 

The species-specific databases are incorporated into ARDaP using SQLiteStudio (3.2.1). The ARDaP software looks for information in specific tables of the SQLite database, and the structure and names of columns in these tables must not be modified when creating the custom database; if they are, ARDaP will be unable to properly detect and annotate the AMR information in a given strain. 

The following sections outline, with an example, what components of the database they can customise to tailor the database for their bacterial species of interest. The ARDaP tables include: 
-	**A table specifying the clinically-relevant antibiotics for the bacterial species of interest.** Required columns include: Antibiotic, abbreviation, drug class, drug family
-	**A Coverage table** (differences in genome coverage for conferring AMR). Required columns include:Gene, Locus tag, chromosome, start coordinates, end coordinates, upregulation or loss, antibiotic affected, known combination, comments
-	**A table for the genome-wide association study (GWAS) used in the predictive component of ARDaP.** Note that incorporation of this table requires a large amount of genomes, with accompanying AMR phenotypic data from sensitive and resistant strains from the bacterial species of interest. Depending on the target pathogen, this table may not be workable, for example, too few genomes were available for a GWAS to be undertaken in the *B. pseudomallei* module of ARDaP, but there are enough public genomes with accompanying resistance profiles for GWAS to be tested in the *P. aeruginosa* module. Required columns include: GWAS ID, genomic coordinate, reference base, mutation type, specific ‘antibiotic’ resistant p-value and specific ‘antibiotic’ intermediate resistance p-value (note: these resistant and intermediate p-values need to be included for every individual antibiotic)
-	**A table of mutational variants including SNPs and indels for conferring AMR**. Required columns include: Gene name, variant annotation, alternative variant annotation, antibiotic affected, known combination, comments 

** 1.	Structure of a table in SQLite** 

The first tab of the SQLite database is allows the user to create the ‘Structure’ of the table, adding columns and information, in this example about the clinically-relevant antibiotics for the bacterial species of interest (Figure 1). This example includes a column string of the antibiotic name (primary key), the antibiotic abbreviation, drug class and drug family that the antibiotic belongs to. Ensure to commit changes when new additions are made. 

![](https://raw.githubusercontent.com/demadden/ARDaP/master/Structure%20tab%20explained.png)

**Figure 1:**  Structure antibitoics table in SQLite database

**2.	Data**

In the next ‘Data’ tab (Figure 2), the creator then adds new rows, in this example a list of all of the clinically-relevant antibiotics (specific to the bacterial species of interest) to populate the columns created previously in the ‘Structure’ tab (Figure 1). The abbreviations are what links ARDaP (and the final AMR reports) with the specific antibiotics and their information about drug class and family. In other words, ARDaP will only report AMR determinants to antibiotics/abbreviations added to this ‘Data’ tab. Ensure to commit changes when new additions are made. 

![](https://raw.githubusercontent.com/demadden/ARDaP/master/Antibiotic%20tab%20explained.png)
**Figure 2:** Data tab of antibitoics table in SQLite database

**3.	Variants table (SNPs and indels for conferring AMR)**

As an additional example, Figure 3 describes the structure and data of the AMR variants (SNPs and indels) table. The column names have been specified in the structure tab, and now the user can populate the data tab with the AMR variants. This includes the gene name where the resistance variant is occurring, the annotation of the variant (and alternative variant annotation - if applicable), and the antibiotic/s that are affected by this variant. For example, in Figure 3, in row three there is a frameshift mutation occurring in the *ampD* AMR gene at the position of the serine (ser) amino acid which confers resistance to the cephalosporin antibiotic ceftazidime (CAZ). In this table there is also a column titled ‘known combination’, this is applicable for AMR variants that require multiple mutations to confer resistance.  

![](https://raw.githubusercontent.com/demadden/ARDaP/master/SNPs%20indels%20database%20explained.png)
**Figure 3:** Data tab of variants table in SQLite database

**Still to come: annotation of the CARD database**

## Troubleshooting

Q: My pipeline crashed. Where do I go to figure out what happened?

A: Nextflow (and ARDaP) will output A LOT of information about why a certain step failed and how to go about fixing the error. The first place to start looking is in the nextflow output to screen. This output will tell you where each step of the pipeline is being processed and where the log files are kept for that step.

### Bugs!!
Please send bug reports to derek.sarovich@gmail.com or log them in the github issues tab
=======
Please send bug reports to derek.sarovich@gmail.com.
