#!/bin/bash

#variables?

baseDir=$1
forward=$2
reverse=$3
id=$4


python3 ${baseDir}/bin/resfinder/run_resfinder.py -ifq ${forward} ${reverse} -acq -db_res ${baseDir}/Databases/Resfinder_general

mv pheno_table.txt ${id}_resfinder.txt