#!/bin/bash

#TODO
# need to check if a patient metadata file has been supplied. If no metadatafile has been supplied then make dummy file with appropriate strain ID

if [ ! -s "$seq_path"/patientMetaData.csv ]; then #test for initial file provided by user if none then create dummy file
	echo "Couldn't find patient metadata, creating default template"
	echo -e "ID,Barcode,LName,FName,DOB,Location,sampType,sampID,sampDate,sampSource,sampSeq,reportLab,reportDate,comments,organism,requestor,requestorContact,lineageNum,lineageName" > "$seq_path"/"$seq"/unique/patientMetaData.csv
	date=$(date +"%F")
	echo -e "$seq,BARCODE,Smith,James,1/01/1990,Darwin,Blood,$seq,$date,Blood,Cultured isolate,RDH,$date,No words needed,Burkholderia pseudomallei,Dr. Requestor Name,req_contact@genome.com,XX,NA" >> "$seq_path"/"$seq"/unique/patientMetaData.csv
else
	echo -e "Found patientMetaData.csv"
	echo -e "Importing isolate data"
	echo -e "ID,Barcode,LName,FName,DOB,Location,sampType,sampID,sampDate,sampSource,sampSeq,reportLab,reportDate,comments,organism,requestor,requestorContact,lineageNum,lineageName" > "$seq_path"/"$seq"/unique/patientMetaData.csv
	date=$(date +"%F")
	echo -e "Looking for specific strain in the metadata file"
	grep -w "$seq" "$seq_path"/patientMetaData.csv
	status=$?
    if [ $status == 0 ]; then
      echo "Found strain information"
	  grep -w "$seq" "$seq_path"/patientMetaData.csv >> "$seq_path"/"$seq"/unique/patientMetaData.csv
	else
      echo "Couldn't find strain data, reverting to default"
      echo -e "$seq,BARCODE,Smith,James,1/01/1990,Darwin,Blood,$seq,$date,Blood,Cultured isolate,RDH,$date,No words needed,Burkholderia pseudomallei,Dr. Requestor Name,req_contact@genome.com,XX,NA" >> "$seq_path"/"$seq"/unique/patientMetaData.csv	  
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

"$SQLITE" "$RESISTANCE_DB" < Drug.table >> drug.table.txt

}

Report_structure

i=1
while read f; do 
	grep -w "$f" "$seq_path"/"$seq"/unique/AbR_output.txt > "$seq_path"/"$seq"/unique/"$f".output
	grep -w "$f"i "$seq_path"/"$seq"/unique/AbR_output.txt > "$seq_path"/"$seq"/unique/"$f"i.output
	if [ -s "$seq_path"/"$seq"/unique/CARD/CARD_no_ignore.txt ]; then
		grep -w "$f" "$seq_path"/"$seq"/unique/CARD/CARD_primary_output.txt >> "$seq_path"/"$seq"/unique/"$f".output
		grep -w "$f"i "$seq_path"/"$seq"/unique/CARD/CARD_primary_output.txt >> "$seq_path"/"$seq"/unique/"$f"i.output
	fi
	grep -w "$f" "$seq_path"/"$seq"/unique/"$f".output &> /dev/null #looks for full resistance
	status=$?
	if [[ "$status" -eq 0 ]]; then
		echo "found mechanism for $f resistance"
		length=$(wc -l "$seq_path"/"$seq"/unique/"$f".output | awk '{print $1}' )
		if [[ "$length" -gt 1 ]]; then
			echo "found multiple mechanisms for $f resistance"
			sed -i "${i}s/.*/&,Resistant,Multiple mechanisms/" "$seq_path"/"$seq"/unique/drug.table.txt
			i=$((i+1))
		else
			echo "found single mechanism for $f resistance" 
			mech=$(awk -F "|" '{ print $2,$3 }' "$seq_path"/"$seq"/unique/"$f".output) #Prints gene name (column 2 from SQL query) and mutation (col 3
			sed -i "${i}s/.*/&,Resistant,${mech}/" "$seq_path"/"$seq"/unique/drug.table.txt
			i=$((i+1))
		fi
	else
		echo "no mechanism identified for $f resistance, looking for intermediate resistance"
		grep -w "${f}"i "$seq_path"/"$seq"/unique/"$f"i.output &> /dev/null
		status=$?
		if [[ "$status" -eq 0 ]]; then
			echo "found intermediate resistance mechanism for $f"
			length=$(wc -l "$seq_path"/"$seq"/unique/"$f"i.output | awk '{print $1}' )
			if [[ "$length" -gt 1 ]]; then
				echo "found multiple mechanisms for intermediate $f resistance"
				sed -i "${i}s/.*/&,Intermediate,Multiple mechanisms/" "$seq_path"/"$seq"/unique/drug.table.txt
				i=$((i+1))
			else
				echo "found single mechanism for intermediate $f resistance" 
				mech=$(awk -F "|" '{ print $2,$3 }' "$seq_path"/"$seq"/unique/"$f"i.output) #Prints gene name (column 2 from SQL query) and mutation (col 3
				sed -i "${i}s/.*/&,Intermediate,${mech}/" "$seq_path"/"$seq"/unique/drug.table.txt
				i=$((i+1))
			fi
		else
			echo "no intermediate resistance found"
			sed -i "${i}s/.*/&,Sensitive,No resistance detected/" "$seq_path"/"$seq"/unique/drug.table.txt
			i=$((i+1))
		fi
	fi
done < <(grep -E "Second-line|First-line|second-line|first-line" "$seq_path"/"$seq"/unique/drug.table.txt.backup | awk -F "," '{ print $3 }') 

while read f; do
	grep -w "$f"s "$seq_path"/"$seq"/unique/AbR_output.txt > "$seq_path"/"$seq"/unique/"$f"s.output
	if [ -s "$seq_path"/"$seq"/unique/CARD/CARD_no_ignore.txt ]; then
		grep -w "$f"s "$seq_path"/"$seq"/unique/CARD/CARD_primary_output.txt >> "$seq_path"/"$seq"/unique/"$f"s.output
	fi
	grep -w "$f"s "$seq_path"/"$seq"/unique/"$f"s.output &> /dev/null
	status=$?
	if [[ "$status" -eq 0 ]]; then
		echo "found mechanism for $f"
		length=$(wc -l "$seq_path"/"$seq"/unique/"$f"s.output | awk '{print $1}' )
		if [[ "$length" -gt 1 ]]; then
			echo "found multiple mechanisms for $f sensitivity"
			sed -i "${i}s/.*/&,Sensitive,Multiple mechanisms identified/" "$seq_path"/"$seq"/unique/drug.table.txt
			i=$((i+1))
		else
			echo "found single mechanism for $f sensitivity" 
			mech=$(awk -F "|" '{ print $2,$3 }' "$seq_path"/"$seq"/unique/"$f"s.output) #Prints gene name (column 2 from SQL query) and mutation (#col 3
			sed -i "${i}s/.*/&,Sensitive,${mech}/" "$seq_path"/"$seq"/unique/drug.table.txt
			i=$((i+1))
		fi
	else
		echo "no mechanism identified for $f"
		sed -i "${i}s/.*/&,Resistant,No sensitivity detected/" "$seq_path"/"$seq"/unique/drug.table.txt
		i=$((i+1))
	fi
done < <(grep -E "tertiary|Tertiary" "$seq_path"/"$seq"/unique/drug.table.txt.backup | awk -F "," '{ print $3 }')

# create patientDrugSusceptibilityData.csv
# ID refers to individual strains
cat "$seq_path"/"$seq"/unique/CARD/CARD_primary_output.txt "$seq_path"/"$seq"/unique/AbR_output.txt > "$seq_path"/"$seq"/unique/AbR_output.final.txt
awk '!seen[$0]++' "$seq_path"/"$seq"/unique/AbR_output.final.txt > "$seq_path"/"$seq"/unique/AbR_output.temp
mv "$seq_path"/"$seq"/unique/AbR_output.temp "$seq_path"/"$seq"/unique/AbR_output.final.txt
sed -i "s/^/$seq,/" "$seq_path"/"$seq"/unique/drug.table.txt
awk -v FS="," -v OFS="," '{print $1,$2,$3,$5,$6 }' "$seq_path"/"$seq"/unique/drug.table.txt > "$seq_path"/"$seq"/unique/drug.table.txt.tmp
mv "$seq_path"/"$seq"/unique/drug.table.txt.tmp "$seq_path"/"$seq"/unique/drug.table.txt
sed -i '1 i\ID,Class,Drug,Status,Details' "$seq_path"/"$seq"/unique/drug.table.txt 
cp "$seq_path"/"$seq"/unique/drug.table.txt "$seq_path"/"$seq"/unique/patientDrugSusceptibilityData.csv

if [ -s "$seq_path"/"$seq"/unique/AbR_output.final.txt ]; then
	cp "$seq_path"/"$seq"/unique/AbR_output.final.txt "$seq_path"/Outputs/AbR_reports/"$seq"_AbR_output.final.txt
fi

#Command to run Rscript to generate reports
log_eval "$seq_path"/"$seq"/unique/ ""$SCRIPTPATH"/Report.R --no-save --no-restore --args SCRIPTPATH="$SCRIPTPATH" strain="$seq" output_path="$seq_path"" #Check multiple "" here

if [ ! -s "$seq_path"/Outputs/Abr_reports/"$seq"_strain.pdf ]; then
  mv "$seq_path"/"$seq"/unique/*.pdf "$seq_path"/Outputs/AbR_reports/
fi

if [ -s "$seq_path"/Outputs/Abr_reports/"$seq"_strain.pdf ]; then
	echo "Found final report. Cleaning up"
	rm "$seq_path"/"$seq"/unique/*.output
	rm "$seq_path"/"$seq"/unique/AbR_output.txt
	rm "$seq_path"/"$seq"/unique/snp.data
fi