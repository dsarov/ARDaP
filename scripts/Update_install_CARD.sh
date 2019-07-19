#!/bin/bash


#source variables file



INSTALL_PATH=$1

cd $INSTALL_PATH/Databases/CARD

wget https://card.mcmaster.ca/latest/data card-data.tar.bz2

tar xvjf card-data.tar.bz2


wget https://card.mcmaster.ca/latest/ontology

tar xvjf card-ontology.tar.bz2


if [ ! -s "$REF_INDEX_FILE" ]; then
    echo -e "Submitting qsub job for SAMtools reference indexing\n"
    cmd="$SAMTOOLS faidx ${seq_directory}/${ref}.fasta"
    qsub_id=$(qsub -N SAM_index -j $ERROR_OUTPUT -m $MAIL -M $ADDRESS -l ncpus=1,walltime=$WALL_T -v command="$cmd" "$SCRIPTPATH"/Header.pbs)
    echo -e "SAM_index\t$qsub_id" >> ref_index_ids.txt
  fi
  if [ ! -s "$REF_DICT" ]; then
    echo -e "Submitting qsub job for ${ref}.dict creation\n"
    cmd="$JAVA $SET_VAR $CREATEDICT R=${seq_directory}/${ref}.fasta O=$REF_DICT"
	qsub_id=`qsub -N PICARD_dict -j $ERROR_OUTPUT -m $MAIL -M $ADDRESS -l ncpus=1,walltime=$WALL_T -v command="$cmd" "$SCRIPTPATH"/Header.pbs`
	echo -e "PICARD_dict\t$qsub_id" >> ref_index_ids.txt
  fi
  if [ ! -s "$REF_BED" ]; then
    echo -e "Submitting qsub job for BED file construction with BEDTools\n"
	depend=$(depend_id ref_index_ids.txt);
    cmd="$BEDTOOLS makewindows -g $REF_INDEX_FILE -w $window > $REF_BED && $BEDTOOLS makewindows -g $REF_INDEX_FILE -w 90000000 > $ref.coverage.bed"
    qsub_id=`qsub -N BED_window -j $ERROR_OUTPUT -m $MAIL -M $ADDRESS -l ncpus=1,walltime=$WALL_T "$depend" -v command="$cmd" "$SCRIPTPATH"/Header.pbs`
    echo -e "BED_window\t$qsub_id" >> ref_index_ids.txt	
  fi