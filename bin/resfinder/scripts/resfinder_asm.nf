#!/usr/bin/env nextflow

python3 = "python3"
resfinder = "/home/projects/cge/apps/resfinder/resfinder/run_resfinder.py"

params.input = './*.fa'
// params.indir = './'
// params.ext = '.fa'
params.outdir = '.'
params.species = 'other'

println("Search pattern: $params.input")

infile_ch = Channel
              .fromPath("$params.input", followLinks: true)
              .map{ file -> tuple(file.baseName, file) }

process resfinder{

    cpus 1
    time '30m'
    memory '1 GB'
    clusterOptions '-V -W group_list=cge -A cge'
    executor "PBS"

    input:
    set sampleID, file(datasetFile) from infile_ch

    output:
    stdout result

    """
    set +u
    module unload mgmapper metabat fastqc
    module unload ncbi-blast perl
    source /home/projects/cge/apps/env/rf4_env/bin/activate
    module load perl
    module load ncbi-blast/2.8.1+
    if [ $params.species = 'other' ]
    then
        $python3 $resfinder -acq -ifa $datasetFile -o '$params.outdir/$sampleID' -s '$params.species'
    else
        $python3 $resfinder -acq -ifa $datasetFile -o '$params.outdir/$sampleID' -s '$params.species' --point
    fi
    """
}

/*
result.subscribe {
    println it
}
*/
