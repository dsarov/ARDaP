#!/bin/bash

seq=$1
RESISTANCE_DB=$2

if [ ! -s patientMetaData.csv ]; then #test for initial file provided by user if none then create dummy file
	echo "Couldn't find patient metadata, creating default template"
	echo -e "ID,Barcode,LName,FName,DOB,Location,sampType,sampID,sampDate,sampSource,sampSeq,reportLab,reportDate,comments,organism,requestor,requestorContact,lineageNum,lineageName" > patientMetaData.csv
	date=$(date +"%F")
	echo -e "$seq,BARCODE,Smith,James,1/01/1990,Darwin,Blood,$seq,$date,Blood,Cultured isolate,RDH,$date,No words needed,Burkholderia pseudomallei,Dr. Requestor Name,req_contact@genome.com,XX,NA" >> patientMetaData.csv
else
	echo -e "Found patientMetaData.csv"
	echo -e "Importing isolate data"
	echo -e "ID,Barcode,LName,FName,DOB,Location,sampType,sampID,sampDate,sampSource,sampSeq,reportLab,reportDate,comments,organism,requestor,requestorContact,lineageNum,lineageName" > patientMetaData.csv
	date=$(date +"%F")
	echo -e "Looking for specific strain in the metadata file"
	grep -w "$seq" patientMetaData.csv
	status=$?
    if [ $status == 0 ]; then
      echo "Found strain information"
	  grep -w "$seq" patientMetaData.csv >> patientMetaData.csv
	else
      echo "Couldn't find strain data, reverting to default"
      echo -e "$seq,BARCODE,Smith,James,1/01/1990,Darwin,Blood,$seq,$date,Blood,Cultured isolate,RDH,$date,No words needed,Burkholderia pseudomallei,Dr. Requestor Name,req_contact@genome.com,XX,NA" >> patientMetaData.csv	  
    fi  
fi

Report_structure () {

cat << _EOF_ >  Drug.table
.separator ","
SELECT Antibiotics."Drug_class",
Antibiotics.Antibiotic,
Antibiotics."Abbreviation"
FROM Antibiotics
ORDER BY Antibiotics."Drug_class"
_EOF_

sqlite3 "$RESISTANCE_DB" < Drug.table >> drug.table.txt

}

Report_structure
cat *.txt | tee AbR_output.txt AbR_output.final.txt
cp drug.table.txt drug.table.txt.backup


i=1
while read f; do 
	grep -w "$f" AbR_output.txt > "$f".output
	grep -w "$f"i unique/AbR_output.txt > "$f"i.output
	grep -w "$f" ${seq}.CARD_primary_output.txt >> "$f".output
	grep -w "$f"i ${seq}.CARD_primary_output.txt >> "$f"i.output
	grep -w "$f" "$f".output &> /dev/null #looks for full resistance
	status=$?
	if [[ "$status" -eq 0 ]]; then
		echo "found mechanism for $f resistance"
		length=$(wc -l "$f".output | awk '{print $1}' )
		if [[ "$length" -gt 1 ]]; then
			echo "found multiple mechanisms for $f resistance"
			sed -i "${i}s/.*/&,Resistant,Multiple mechanisms/" drug.table.txt
			i=$((i+1))
		else
			echo "found single mechanism for $f resistance" 
			mech=$(awk -F "|" '{ print $2,$3 }' "$f".output) #Prints gene name (column 2 from SQL query) and mutation (col 3
			sed -i "${i}s/.*/&,Resistant,${mech}/" drug.table.txt
			i=$((i+1))
		fi
	else
		echo "no mechanism identified for $f resistance, looking for intermediate resistance"
		grep -w "${f}"i "$f"i.output &> /dev/null
		status=$?
		if [[ "$status" -eq 0 ]]; then
			echo "found intermediate resistance mechanism for $f"
			length=$(wc -l "$f"i.output | awk '{print $1}' )
			if [[ "$length" -gt 1 ]]; then
				echo "found multiple mechanisms for intermediate $f resistance"
				sed -i "${i}s/.*/&,Intermediate,Multiple mechanisms/" drug.table.txt
				i=$((i+1))
			else
				echo "found single mechanism for intermediate $f resistance" 
				mech=$(awk -F "|" '{ print $2,$3 }' "$f"i.output) #Prints gene name (column 2 from SQL query) and mutation (col 3
				sed -i "${i}s/.*/&,Intermediate,${mech}/" drug.table.txt
				i=$((i+1))
			fi
		else
			echo "no intermediate resistance found"
			sed -i "${i}s/.*/&,Sensitive,No resistance detected/" drug.table.txt
			i=$((i+1))
		fi
	fi
done < <(grep -E "Second-line|First-line|second-line|first-line" drug.table.txt.backup | awk -F "," '{ print $3 }') 

while read f; do
	grep -w "$f"s AbR_output.txt > "$f"s.output
	grep -w "$f"s ${seq}.CARD_primary_output.txt >> "$f"s.output
	grep -w "$f"s "$f"s.output &> /dev/null
	status=$?
	if [[ "$status" -eq 0 ]]; then
		echo "found mechanism for $f"
		length=$(wc -l "$f"s.output | awk '{print $1}' )
		if [[ "$length" -gt 1 ]]; then
			echo "found multiple mechanisms for $f sensitivity"
			sed -i "${i}s/.*/&,Sensitive,Multiple mechanisms identified/" drug.table.txt
			i=$((i+1))
		else
			echo "found single mechanism for $f sensitivity" 
			mech=$(awk -F "|" '{ print $2,$3 }' "$f"s.output) #Prints gene name (column 2 from SQL query) and mutation (#col 3
			sed -i "${i}s/.*/&,Sensitive,${mech}/" drug.table.txt
			i=$((i+1))
		fi
	else
		echo "no mechanism identified for $f"
		sed -i "${i}s/.*/&,Resistant,No sensitivity detected/" drug.table.txt
		i=$((i+1))
	fi
done < <(grep -E "tertiary|Tertiary" drug.table.txt.backup | awk -F "," '{ print $3 }')

# create patientDrugSusceptibilityData.csv
# ID refers to individual strains
awk '!seen[$0]++' AbR_output.final.txt > AbR_output.temp
mv AbR_output.temp AbR_output.final.txt
sed -i "s/^/$seq,/" drug.table.txt
awk -v FS="," -v OFS="," '{print $1,$2,$3,$5,$6 }' drug.table.txt > drug.table.txt.tmp
mv drug.table.txt.tmp drug.table.txt
sed -i '1 i\ID,Class,Drug,Status,Details' drug.table.txt 
cp drug.table.txt patientDrugSusceptibilityData.csv

if [ -s AbR_output.final.txt ]; then
	cp AbR_output.final.txt "$seq"_AbR_output.final.txt
fi

exit 0


#Command to run Rscript to generate reports
Report.R --no-save --no-restore --args SCRIPTPATH=${baseDir} strain=${id} output_path=./

if [ ! -s "$seq_path"/Outputs/Abr_reports/"$seq"_strain.pdf ]; then
  mv "$seq_path"/"$seq"/unique/*.pdf "$seq_path"/Outputs/AbR_reports/
fi

if [ -s "$seq_path"/Outputs/Abr_reports/"$seq"_strain.pdf ]; then
	echo "Found final report. Cleaning up"
	rm "$seq_path"/"$seq"/unique/*.output
	rm "$seq_path"/"$seq"/unique/AbR_output.txt
	rm "$seq_path"/"$seq"/unique/snp.data
fi