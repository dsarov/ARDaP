#!/bin/bash


##This script is run as part of the SPANDx pipeline as of version 3.1



##input sample names
PBS_O_WORKDIR=$PWD


sequences_tmp=(`find $PWD/*_1_sequence.fastq.gz -printf "%f "`)
sequences=("${sequences_tmp[@]/_1_sequence.fastq.gz/}")
n="${#sequences[@]}"

TAB="$(printf '\t')"

cat << _EOF_ > SNP_summary_header

Reference=$ref
Total number of genomes analysed=$n
Genome Name${TAB}Antibiotic Resistance?
_EOF_

if [ -s Outputs/AbR_reports/Three_or_more.summary ]; then
	rm Outputs/AbR_reports/Three_or_more.summary Outputs/Three_or_more.summary
fi
if [ -s Outputs/AbR_reports/One_to_two.summary ]; then
	rm Outputs/AbR_reports/One_to_two.summary Outputs/One_to_two.summary
fi
if [ -s Outputs/AbR_reports/Species_failure.summary ]; then
	rm Outputs/AbR_reports/Species_failure.summary Outputs/Species_failure.summary
fi
if [ -s Outputs/AbR_reports/Sensitive_list.summary ]; then
	rm Outputs/AbR_reports/Sensitive_list.summary Outputs/Sensitive_list.summary
fi
if [ -s Outputs/AbR_reports/Failure_list.summary ]; then
	rm Outputs/AbR_reports/Failure_list.summary Outputs/Failure_list.summary
fi


for (( i=0; i<n; i++ )); do
echo "looking for ${sequences[$i]}"
  if [ ! -s Outputs/AbR_reports/"${sequences[$i]}"_AbR_output.final.txt -a ! -s Outputs/AbR_reports/"${sequences[$i]}"_strain.pdf ]; then
	#strain failure
	echo -e "${sequences[$i]}\tFailure" >> Outputs/AbR_reports/Failure_list.summary
  elif [ ! -s Outputs/AbR_reports/"${sequences[$i]}"_AbR_output.final.txt -a -s Outputs/AbR_reports/"${sequences[$i]}"_strain.pdf ]; then
  	echo -e "${sequences[$i]}\tNo resistance identified" >> Outputs/AbR_reports/Sensitive_list.summary
  elif [ -s Outputs/AbR_reports/"${sequences[$i]}"_AbR_output.final.txt ]; then

	grep -v 'None' Outputs/AbR_reports/"${sequences[$i]}"_AbR_output.final.txt > Outputs/AbR_reports/"${sequences[$i]}"_AbR_output.final.txt.tmp
	
	grep 'Speciation' Outputs/AbR_reports/"${sequences[$i]}"_AbR_output.final.txt.tmp  &> /dev/null
	status=$?
	if [ "$status" == 0 ]; then
		#found species failure
		paste <(echo "${sequences[$i]}") Outputs/AbR_reports/"${sequences[$i]}"_AbR_output.final.txt.tmp >> Outputs/AbR_reports/Species_failure.summary
	else
		unset no_of_mechs
		no_of_mechs=$(wc -l Outputs/AbR_reports/${sequences[$i]}_AbR_output.final.txt.tmp | awk '{print $1'} )
		if [ "$no_of_mechs" == 0 ]; then
			echo -e "${sequences[$i]}\tNo resistance identified" >> Outputs/AbR_reports/Sensitive_list.summary
		fi	
		if [ "$no_of_mechs" == 1 -o "$no_of_mechs" == 2  ]; then
			paste <(echo "${sequences[$i]}") Outputs/AbR_reports/"${sequences[$i]}"_AbR_output.final.txt.tmp >> Outputs/AbR_reports/One_to_two.summary
			echo  >> Outputs/AbR_reports/One_to_two.summary
		fi
		if [ "$no_of_mechs" -gt 2 ]; then
			paste <(echo "${sequences[$i]}") Outputs/AbR_reports/"${sequences[$i]}"_AbR_output.final.txt.tmp >> Outputs/AbR_reports/Three_or_more.summary
			echo >> Outputs/AbR_reports/Three_or_more.summary
		fi
    fi
  fi
  
done  
if [ -s Outputs/AbR_reports/Three_or_more.summary ]; then
	cp Outputs/AbR_reports/Three_or_more.summary Outputs/Three_or_more.summary
fi
if [ -s Outputs/AbR_reports/One_to_two.summary ]; then
	cp Outputs/AbR_reports/One_to_two.summary Outputs/One_to_two.summary
fi
if [ -s Outputs/AbR_reports/Species_failure.summary ]; then
	cp Outputs/AbR_reports/Species_failure.summary Outputs/Species_failure.summary
fi
if [ -s Outputs/AbR_reports/Sensitive_list.summary ]; then
	cp Outputs/AbR_reports/Sensitive_list.summary Outputs/Sensitive_list.summary
fi
if [ -s Outputs/AbR_reports/Failure_list.summary ]; then
	cp Outputs/AbR_reports/Failure_list.summary Outputs/Failure_list.summary
fi



exit 0
