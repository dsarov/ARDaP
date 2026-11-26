#!/bin/bash

#variables?

baseDir=$1
forward=$2
reverse=$3
id=$4


# reverse is NONE for single-end reads (--SE), so only the one file is given to ResFinder
if [ "${reverse}" = "NONE" ] || [ -z "${reverse}" ]; then
  reads="${forward}"
else
  reads="${forward} ${reverse}"
fi

python3 ${baseDir}/bin/resfinder/run_resfinder.py -ifq ${reads} -acq -db_res ${baseDir}/Databases/Resfinder_general

mv pheno_table.txt ${id}_resfinder.txt