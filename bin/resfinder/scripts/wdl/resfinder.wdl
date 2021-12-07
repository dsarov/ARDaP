workflow Resistance {
    File inputSamplesFile
    Array[Array[File]] inputSamples = read_tsv(inputSamplesFile)

    String outputDir
    Float geneCov
    Float geneID
    Float pointCov
    Float pointID
    String python
    String kma
    String blastn
    String resfinder
    String resDB
    String pointDB

    scatter (sample in inputSamples) {
        call ResFinder {
            input: inputSample=sample,
                outputRoot=outputDir,
                geneCov=geneCov,
                geneID=geneID,
                pointCov=pointCov,
                pointID=pointID,
                python=python,
                kma=kma,
                blastn=blastn,
                resfinder=resfinder,
                resDB=resDB,
                pointDB=pointDB
        }
    }
}

task ResFinder {

    Array[String] inputSample
    Float geneCov
    Float geneID
    Float pointCov
    Float pointID
    String python
    String kma
    String blastn
    String resfinder
    String resDB
    String pointDB

    String inputPath1 = inputSample[0]
    String inputPath2 = inputSample[1]
    String species = inputSample[2]
    String inputType = inputSample[3]

    String outputRoot
    String filename = basename(inputPath1)
    String out_dir_name = "${outputRoot}/${filename}.rf_out"

    command {

        set +u
        module unload mgmapper metabat fastqc
        module unload ncbi-blast perl
        source /home/projects/cge/apps/env/rf4_env/bin/activate
        module load perl
        module load ncbi-blast/2.8.1+

        mkdir ${out_dir_name}

        inputArgs=""
        pointArgs=""

        if [ "${species}" = "other" ] && [ "${inputType}" = "paired" ]
        then
            inputArgs+="-ifq ${inputPath1} ${inputPath2}"
        elif [ "${inputType}" = "paired" ]
        then
            inputArgs+="-ifq ${inputPath1} ${inputPath2}"
            pointArgs+="--point --db_path_point ${pointDB} --min_cov_point ${pointCov} --threshold_point ${pointID}"
        elif [ "${species}" = "other"] && [ "${inputType}" = "assembly" ]
        then
            inputArgs+="-ifa ${inputPath1}"
        elif [ "${inputType}" = "assembly" ]
        then
            inputArgs+="-ifa ${inputPath1}"
            pointArgs+="--point --db_path_point ${pointDB} --min_cov_point ${pointCov} --threshold_point ${pointID}"
        fi

        ${python} ${resfinder} \
            $inputArgs \
            --blastPath ${blastn} \
            --kmaPath ${kma} \
            --species "${species}" \
            --db_path_res ${resDB} \
            --acquired \
            --acq_overlap 30 \
            --min_cov ${geneCov} \
            --threshold ${geneID} \
            -o ${out_dir_name} \
            $pointArgs
    }
    output {
        File rf_out = "${out_dir_name}/std_format_under_development.json"
    }
    runtime {
        walltime: "1:00:00"
        cpu: 2
        memory: "4 GB"
        queue: "cge"
    }
}
