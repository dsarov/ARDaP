#!/bin/bash

seq=$1
RESISTANCE_DB=$2

echo -e "Importing isolate data"
#echo -e "ID,Barcode,LName,FName,DOB,Location,sampType,sampID,sampDate,sampSource,sampSeq,reportLab,reportDate,comments,organism,requestor,requestorContact,lineageNum,lineageName" > patientMetaData.csv
date=$(date +"%F")
echo -e "Looking for specific strain in the metadata file"
grep -w "$seq" patientMetaData.csv
status=$?
if [ $status == 0 ]; then
    echo "Found strain information"
	head -n1 patientMetaData.csv >> patientMetaData_"$seq".csv
	grep -w "$seq" patientMetaData.csv >> patientMetaData_"$seq".csv
else
    echo "Couldn't find strain specific data in file, reverting to default"
	head -n1 patientMetaData.csv >> patientMetaData_"$seq".csv
    echo -e "$seq,BARCODE,Smith,James,1/01/1990,Darwin,Blood,$seq,$date,Blood,Cultured isolate,RDH,$date,No words needed,Burkholderia pseudomallei,Dr. Requestor Name,req_contact@genome.com,XX,NA" >> patientMetaData_"$seq".csv	  
fi  

mv patientMetaData_"$seq".csv patientMetaData.csv

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
cat ${seq}.*.txt | tee AbR_output.txt AbR_output.final.txt
cp drug.table.txt drug.table.txt.backup


i=1
while read f; do 
	grep -w "$f" AbR_output.txt > "$f".output
	grep -w "$f"i AbR_output.txt > "$f"i.output
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


#Screening for tertiary antibiotics
#These antibiotics are not included in the reports but are flagged in the .txt outputs
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
			cat "$f"s.output >> drug.table.tertiary.txt
			i=$((i+1))
		else
			echo "found single mechanism for $f sensitivity" 
			mech=$(awk -F "|" '{ print $2,$3 }' "$f"s.output) #Prints gene name (column 2 from SQL query) and mutation (#col 3
			cat "$f"s.output >> drug.table.tertiary.txt
			i=$((i+1))
		fi
	else
		echo "no mechanism identified for $f"
		sed -i "${i}s/.*/&,Resistant,No sensitivity detected/" drug.table.tertiary.txt
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
	cp AbR_output.final.txt "$seq".AbR_output.final.txt
fi

exit 0
