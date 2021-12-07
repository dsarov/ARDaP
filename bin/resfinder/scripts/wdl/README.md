# Quick guide to running ResFinder with Cromwell

### Disclaimer
Support is not offered for running Cromwell and no files in this directory is
guaranteed to work. These files were uploaded as inspiration. Please do not
report issues relating to this directory.

## Prepare input files

Two input files are needed:

1. input_data.tsv
2. input.json

Templates can be found in the ResFinder directory scripts/wdl.

### input_data.tsv
Tab separated file. Should contain columns in the following order:

1. Absolute path to fasta/fastq file 1
2. Absolute path to fastq file 2 (Can be empty, but must exist)
3. Species
4. Type of data, must be one of: assembly, paired

Each row should contain a single sample.

#### Species
If species cannot be provided put "other" (cases sensitive).

#### Type of data

* assembly: Fasta file containing contigs from a de novo assembly.
* paired: Couple of fastq files containing read data for foward and reverse
reads.
* single: **Not implemented** Read data from single-end sequencing.


#### Example
```

/home/projects/cge/apps/resfinder/resfinder/tests/data/test_isolate_01_1.fq	/home/projects/cge/apps/resfinder/resfinder/tests/data/test_isolate_01_2.fq	Escherichia	coli	paired
/home/projects/cge/apps/resfinder/resfinder/tests/data/test_isolate_05_1.fq	/home/projects/cge/apps/resfinder/resfinder/tests/data/test_isolate_05_2.fq	Escherichia	coli	paired
/home/projects/cge/apps/resfinder/resfinder/tests/data/test_isolate_09a_1.fq	/home/projects/cge/apps/resfinder/resfinder/tests/data/test_isolate_09a_2.fq	Escherichia	coli	paired
/home/projects/cge/apps/resfinder/resfinder/tests/data/test_isolate_09b_1.fq	/home/projects/cge/apps/resfinder/resfinder/tests/data/test_isolate_09b_2.fq	Escherichia	coli	paired
/home/projects/cge/apps/resfinder/resfinder/tests/data/test_isolate_01.fa		Escherichia	coli	assembly
/home/projects/cge/apps/resfinder/resfinder/tests/data/test_isolate_02.fa		Escherichia	coli	assembly
/home/projects/cge/apps/resfinder/resfinder/tests/data/test_isolate_03.fa		Escherichia	coli	assembly
/home/projects/cge/apps/resfinder/resfinder/tests/data/test_isolate_05.fa		Escherichia	coli	assembly
/home/projects/cge/apps/resfinder/resfinder/tests/data/test_isolate_09a.fa		Escherichia	coli	assembly
/home/projects/cge/apps/resfinder/resfinder/tests/data/test_isolate_09b.fa		Escherichia	coli	assembly

```

### input.json
JSON formatted file containing input and output information.

The file should consist of a single dict/hash/map with the following keys:

* Resistance.inputSamplesFile: Absolute path to input_data.tsv
* Resistance.outputDir: Absolute path to output directory.
* Resistance.geneCov: Fraction of gene coverage needed for resistance gene hits.
* Resistance.geneID: Fraction of nucleotide identity needed in resistance gene
hits.
* Resistance.pointCov: Fraction of gene coverage needed for point mutation gene
hits.
* Resistance.pointID: Fraction of nucleotide identity needed in point mutation gene
hits.

If running on Computerome and are using the input.json template, you probably
won't need to change the following:

* Resistance.python: Path to python3 interpreter.
* Resistance.kma: Path to kma application.
* Resistance.blastn: Path to blastn application.
* Resistance.resfinder: Path to run_resfinder.py.
* Resistance.resDB: Path to ResFinder database.
* Resistance.pointDB: Path to PointFinder database

The values should be the absolute path to the input_data.tsv and the desired
output directory, respectively.

#### Example

```json

{
  "Resistance.inputSamplesFile": "/home/projects/cge/people/rkmo/delme/res_input.tsv",
  "Resistance.outputDir": "/home/projects/cge/people/rkmo/delme/",
  "Resistance.geneCov": 0.6,
  "Resistance.geneID": 0.8,
  "Resistance.pointCov": 0.6,
  "Resistance.pointID": 0.8,
  "Resistance.python": "python3",
  "Resistance.kma": "/home/projects/cge/apps/resfinder/resfinder/cge/kma/kma",
  "Resistance.blastn": "blastn",
  "Resistance.resfinder": "/home/projects/cge/apps/resfinder/resfinder/run_resfinder.py",
  "Resistance.resDB": "/home/projects/cge/apps/resfinder/resfinder/db_resfinder",
  "Resistance.pointDB": "/home/projects/cge/apps/resfinder/resfinder/db_pointfinder"
}

```

## Run Cromwell

Cromwell needs JAVA to run. Load a valid JAVA module, for example:

```bash

module load openjdk/16

```

A Cromwell call looks like this:

```bash

java -Dconfig.file=<CONF> -jar <CROMWELL> run <WDL> --inputs <JSON>

```

### <CONF> and <CROMWELL>
Computerome specific.

* <CONF>: Path to Computerome configuration for Cromwell. You need to change
this if you are not running Cromwell on Computerome. Computerome path:
/home/projects/cge/apps/resfinder/resfinder/scripts/wdl/computerome.conf

* <CROMWELL>: Path to Cronwell jar file in Computerome:
/services/tools/cromwell/50/cromwell-50.jar

### <WDL>
ResFinder specific.

* <WDL>: Path to wdl file that specifies how to run ResFinder. Path to
resfinder.wdl on Computerome:
/home/projects/cge/apps/resfinder/resfinder/scripts/wdl/resfinder.wdl

### <JSON>
User/Run specific

Path to input.json. Specifies all the parameters for ResFinder (See above).

### Run example

```bash

java -Dconfig.file=/home/projects/cge/apps/resfinder/resfinder/scripts/wdl/computerome.conf -jar /services/tools/cromwell/50/cromwell-50.jar run /home/projects/cge/apps/resfinder/resfinder/scripts/wdl/resfinder.wdl --inputs /home/projects/cge/apps/resfinder/resfinder/scripts/wdl/input.json

```

### Post run

All ResFinder output will be located in the provided output directory.

In the directory where you execute Cromwell the following two directories will
also be created:

* cromwell-executions
* cromwell-workflow-logs

They contain logging information and cached results.
