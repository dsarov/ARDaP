# ARDaP - Antimicrobial Resistance Detection and Prediction <img src='image.png' align="right" height="210" />


![](https://img.shields.io/badge/version-alpha-red.svg)
![](https://img.shields.io/badge/lifecycle-experimental-orange.svg)
![](https://img.shields.io/badge/docs-latest-green.svg)
![](https://img.shields.io/badge/BioRxiv-prep-green.svg)


ARDaP was written by Derek Sarovich ([@DerekSarovich](https://twitter.com/DerekSarovich)) (University of the Sunshine Coast, Australia), with database construction, code testing and feature design by Danielle Madden ([@dmadden9](https://twitter.com/demadden9)), Eike Steinig ([@EikeSteinig](https://twitter.com/EikeSteinig)) (Australian Institute of Tropical Health and Medicine, Australia) and Erin Price ([@Dr_ErinPrice](https://twitter.com/Dr_ErinPrice)).


## Contents

- [Introduction](#introduction)
- [Installation](#Installation)
- [Resource Managers](#resource-managers)
- [ARDaP Workflow](#ARDaP-workflow)
- [Usage](#usage)
- [Parameters](#parameters)
- [Inclusion of Assembled Genomes](#Inclusion-of-Assembled-Genomes)
- [Custom database creation](#Database-creation)
- [Troubleshooting](#Troubleshooting)
- [Citation](#citation)


## Introduction

ARDaP (**A**ntimicrobial **R**esistance **D**etection **a**nd **P**rediction) is a pipeline designed to identify genetic variants (i.e. single-nucleotide polymorphisms [SNPs], insertions/deletions [indels], copy-number variants [CNVs], and gene loss) associated with antimicrobial resistance (AMR) from microbial (meta)genomes or (meta)transcriptomes. The impetus behind developing ARDaP was our frustration with current methodology being unable to detect AMR conferred by "complex" chromosomal alterations. Our two species of interest, *Burkholderia pseudomallei* and \**Pseudomonas aeruginosa*, can develop AMR in a multiple ways, predominantly through chromosomal gene loss, CNVs, SNPs, and indels; and in *B. pseudomallei*, gene gain plays no role in conferring AMR, rendering many existing AMR tools entirely ineffective. ARDaP first identifies all genetic variation in a microbial sequence data (either .fasta assemblies or Illumina paired-end data; other data types currently not supported), and then interrogates this information against a user-created database of AMR determinants. The software will then summarise the identified AMR determinants and produce an easy-to-interpret summary report.

\**P. aeruginosa* module still under development

## Installation

### Short version for those that just want to get started and understand how conda environments work

ARDaP is available on our development channel, and its dependencies can be installed with:

`conda install -c dsarov -c bioconda -c conda-forge ardap`

The pipeline itself is run with Nextflow from a local cache of the repository:

`nextflow run dsarov/ardap`

The local cache can be updated with:

`nextflow pull dsarov/ardap`

If you want to make changes to the default `nextflow.config` file, clone the workflow into a local directory and change parameters in `nextflow.config`:

`nextflow clone dsarov/ardap install_dir/`

Or navigate to the conda install path of ARDaP and change the `nextflow.config` in that location.

### Long version for those unfamiliar with environments or who just want all the steps for recommended installation

1) Make sure you have the conda package manager installed (e.g. Anaconda, miniconda). You can check this by testing if you can find the `conda` command (`which conda`). If you  have conda installed,  it's a good idea to update conda so you have the latest version: `conda update conda`. If you don't have this software installed,  go to [the miniconda install page](https://docs.conda.io/en/latest/miniconda.html) and follow the instructions for your OS. After conda install, make sure your install is up-to-date: `conda update conda`.

2) Create a new environment with conda called "ardap" and install the ARDaP software with `conda create --name ardap -c dsarov -c bioconda -c conda-forge ardap`. Follow the instructions and the software should fully install with all dependencies.

3) Activate the ARDaP environment that was installed by conda: `conda activate ardap`

4) To run ARDaP: `nextflow run dsarov/ardap`

5) If you're running ARDaP on a HPC/submission system (e.g. PBS), the `screen` command will allow you to detach the terminal while the pipeline is still running in the background

## Usage

ARDaP is implemented in Nextflow. More information about Nextflow can be found [here](https://www.nextflow.io/docs/latest/getstarted.html)

ARDaP can be called from the command line through [Nextflow](https://www.nextflow.io/docs/latest/getstarted.html). This will pull the current workflow into local storage. Any parameter in the configuration file `nextflow.config` can be changed on the command line via `--` dashes, while Nextflow runtime parameters can be changed via `-` dash. 

For example, to run Nextflow with the default cluster job submission template profile for `PBS`, and activate the mixture setting in `ARDaP`, we can run:

`nextflow run dsarov/ardap --executor pbs --mixtures`

### Error-handling strategy

The nextflow pipeline language allows different error strategies to be applied to make sure your pipeline runs as seamlessly as possible. ARDaP will attempt to re-run any failed jobs four times before giving up. Frequent crashes may represent a bug and should be reported, but an occasional crash may happen and should be mostly mitigated by the "retry" error strategy. 

## Resource Managers

ARDaP is written in the Nextflow language, and as such, has support for most resource management systems.

The list of schedulers and default template profiles is in `nextflow.config` and can be selected when the pipeline is initiated with the `--executor` flag. For example, if you want to run ARDaP on a system with PBS, simply set `--executor pbs` when initialising ARDaP. Most popular resource managers are supported (e.g. sge, slurm). The default configuration is to run on the local system without a scheduler.

If you require more information about how to set your resource manager (e.g. memory, queue, account settings), please see https://www.nextflow.io/docs/latest/executor.html

If you would like to just submit jobs to the resource manager queue without monitoring, then use of the `screen` or `nohup` commands will allow you to run the pipeline process in the background, and won't kill the pipeline if the shell is terminated. Examples of `nohup` are included below.

## ARDaP Workflow

To achieve high-quality variant calls, ARDaP incorporates the following programs into its workflow:

- ART ([doi: 10.1093/bioinformatics/btr708](https://academic.oup.com/bioinformatics/article/28/4/593/213322))
- Trimmomatic ([doi: 10.1093/bioinformatics/btu170](https://academic.oup.com/bioinformatics/article/30/15/2114/2390096))
- Seqtk (https://github.com/lh3/seqtk)
- Burrows Wheeler Aligner (BWA) ([doi: 10.1093/bioinformatics/btp324](https://academic.oup.com/bioinformatics/article/25/14/1754/225615))
- SAMTools ([doi: 10.1093/bioinformatics/btp352ref](https://academic.oup.com/bioinformatics/article/25/16/2078/204688))
- Picard (https://broadinstitute.github.io/picard/)
- Genome Analysis Toolkit (GATK) ([doi: 10.1101/gr.107524.110.](https://genome.cshlp.org/content/20/9/1297))
- BEDTools ([doi: 10.1093/bioinformatics/btq033](https://academic.oup.com/bioinformatics/article/26/6/841/244688))
- Pindel ([doi: 10.1093/bioinformatics/btp394](https://academic.oup.com/bioinformatics/article/25/21/2865/2112044))
- Mosdepth ([doi: 10.1093/bioinformatics/btx699](https://academic.oup.com/bioinformatics/article/34/5/867/4583630))
- SNPEff ([doi 10.4161/fly.19695](https://www.tandfonline.com/doi/full/10.4161/fly.19695))
- CARD ([doi: 10.1093/nar/gkz935](https://academic.oup.com/nar/article/48/D1/D517/5608993))
- SQLite (https://sqlite.org/index.html)

## Parameters
   
Optional Parameter: \
  `--mixtures`   Optionally perform within-species mixture analysis (e.g. from metagenomic/metatranscriptomic data) for a particular species of interest. Run ARDaP with the --mixtures flag for analysis with multiple strains and/or meta-omic data. Default=false
  
  Example:
  
  `$ nextflow run dsarov/ardap --mixtures`
  
  `--size` ARDaP can optionally down-sample your read data to run through the pipeline more quickly (integer value expected). Default=1000000, which corresponds to ~50x coverage for a 6Mbp genome. To switch down-sampling off, specify --size 0. When mixture analysis is requested, this option should be switched to 0 for the most sensitive ARM determinant detection.
  
  Example:
  
  `$ nextflow run dsarov/ardap --size 0 --mixtures`
  
  `--phylogeny` Use this flag if you would like a whole-genome phylogeny, or an annotated variant matrix file. Note that this may take a long time if you have a large number of isolates. Default=false
  
  Example:
  
  `$ nextflow run dsarov/ardap --phylogeny`
  
  `--species` Use this flag to specify an ARDaP database that contains species-specific AMR determinant information.
  
  Currently there are ARDaP databases available for:
  <i>Pseudomonas aeruginosa</i> `--species Pseudomonas_aeruginosa`
  <i>Burkholderia pseudomallei</i> `--species Burkholderia_pseudomallei` 
  
  For example: \
  `nextflow run dsarov/ardap --species Pseudomonas_aeruginosa`

If you don't want to constantly use the flags for different species, this setting can be changed in the `nextflow.config` file.

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

## Inclusion of Assembled Genomes

ARDaP can optionally include assembled genomes in the workflow using the `--assemblies` flag. To do so, please include all genome assemblies in an "assemblies" subdirectory of the main analysis directory. These files will need to be in FASTA format with the .fasta extension. ARDaP will automatically scan for the subdirectory "assemblies" and include all files identified with a .fasta extension. Synthetic reads will be synthesised using ART and included in all downstream analysis.

### Database Creation

ARDaP's creators have thus far developed and validated a custom database of AMR variants for *Burkholderia pseudomallei*, and the construction of a *Pseudomonas aeruginosa*-specific AMR database is in progress; however, ARDaP is capable of detecting and predicting AMR determinants in any bacterial species of interest. To add additional species requires a database of all known AMR determinants acquired from a) horizontal gene gain (through incorporation and improved annotation of the CARD database) and b) chromosomal mutations such as single nucleotide polymorphisms (SNPs), insertion-deletions (indels) and copy-number variations (CNVs). This task first requires a thorough review of the literature, followed by manual cataloguing and verification of individual resistance determinants that specify not only what class, but what specific antibiotic/s are affected by the presence of an AMR variant. Development of such detailed databases can be laborious and time consuming, and certainly require regular updates as new AMR variants are published in the literature, but this activity is essential for truly comprehensive AMR detection. 

The species-specific databases are incorporated into ARDaP using SQLite. The ARDaP software looks for information in specific tables of the  database, and the structure and names of columns in these tables must not be modified when creating the custom database; if they are, ARDaP will be unable to properly detect and annotate the AMR information in a given strain. 

The following sections outline, with an example, what components of the database they can customise to tailor the database for their bacterial species of interest. The ARDaP tables include: 
-	**A table specifying the clinically-relevant antibiotics for the bacterial species of interest.** Required columns include: Antibiotic, abbreviation, drug class, drug family
-	**A Coverage table** (differences in genome coverage for conferring AMR). Required columns include:Gene, Locus tag, chromosome, start coordinates, end coordinates, upregulation or loss, antibiotic affected, known combination, comments
-	**A table for the genome-wide association study (GWAS) used in the predictive component of ARDaP.** Note that incorporation of this table requires a large amount of genomes, with accompanying AMR phenotypic data from sensitive and resistant strains from the bacterial species of interest. Depending on the target pathogen, this table may not be workable, for example, too few genomes were available for a GWAS to be undertaken in the *B. pseudomallei* module of ARDaP, but there are enough public genomes with accompanying resistance profiles for GWAS to be tested in the *P. aeruginosa* module. Required columns include: GWAS ID, genomic coordinate, reference base, mutation type, specific ‘antibiotic’ resistant p-value and specific ‘antibiotic’ intermediate resistance p-value (note: these resistant and intermediate p-values need to be included for every individual antibiotic)
-	**A table of mutational variants including SNPs and indels for conferring AMR**. Required columns include: Gene name, variant annotation, alternative variant annotation, antibiotic affected, known combination, comments 

** 1.	Structure of a table in SQLite** 

The first tab of the SQLite database allows the user to create the ‘Structure’ of the table, adding columns and information, in this example about the clinically-relevant antibiotics for the bacterial species of interest (Figure 1). This example includes a column string of the antibiotic name (primary key), the antibiotic abbreviation, drug class and drug family that the antibiotic belongs to. Ensure to commit changes when new additions are made. 

![](https://raw.githubusercontent.com/demadden/ARDaP/master/Structure%20tab%20explained.png)

**Figure 1:**  Structure antibiotics table in SQLite database

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
