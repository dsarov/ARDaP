#!/bin/bash

seq=$1
RESISTANCE_DB=$2


#This variable restricts resfinder matches to "3" which means 100% nucleotide identity across the entire length of the gene. Set to "2" to reduce stringency 
stringency=3

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

cp drug.table.txt drug.table.txt.backup

#format Resfinder output for report
while read line; do
  echo "$line" > resfinder_query_string.txt
  Antibiotic=$(awk -F "," '{print $2}' resfinder_query_string.txt)
  abbrev=$(awk -F "," '{print $3}' resfinder_query_string.txt)
  echo "Antibiotic = $Antibiotic"
  echo "abbrev=$abbrev"
  awk -F "\t" -v Ab="${Antibiotic}" 'BEGIN{IGNORECASE=1} $1==Ab' "${seq}"_resfinder.txt > resfinder_tmp.txt
  gene=$(awk -F "\t" '{ print $5 }' resfinder_tmp.txt)
  #apply resfinder stringency filter
  #awk -v stringency="${stringency}" -F "\t" '$4==stringency' resfinder_tmp.txt > resfinder_tmp2.txt
 
  #look for resistance
  awk -F "\t" '$3 ~ "Resistant" { exit 1 } ' resfinder_tmp.txt &> /dev/null
  status=$?
  #echo $status  
  if [ "$status" == 1 ]; then  #Resistant strain
    echo "Found resistance to ${Antibiotic} for ${seq}"
    echo -e "Resfinder|$gene||${abbrev}r|100" >> "${seq}"_resfinder_report.txt #If the resistance mechanism is found then report 100% for resfinder AMR
  else
    echo "Strain appears sensitive to $Antibiotic"
  fi
done < drug.table.txt.backup


cat "${seq}".AbR_output_snp_indel.txt "${seq}".AbR_output_del_dup.txt "${seq}"_resfinder_report.txt | tee AbR_output.txt AbR_output.final.txt


#Deduplicate any repetition in the resistance list
awk -F"|" '!seen[$1,$2,$3,$4,$5]++' AbR_output.final.txt > AbR_output.temp
mv AbR_output.temp AbR_output.final.txt

#Deduplicate any repetition in the resistance list
awk -F"|" '!seen[$1,$2,$3,$4,$5]++' AbR_output.txt > AbR_output.temp
mv AbR_output.temp AbR_output.txt

#TO DO -  replace with awk pattern matching is case users want to add custom drug classes

i=1
while read f; do 
	awk -F"|" -v f="$f" '$4~ f"r"' AbR_output.txt > "$f"r.output
	awk -F"|" -v f="$f" '$4~ f"i"' AbR_output.txt > "$f"i.output
	awk -F"|" -v f="$f" '$4~ f"s"' AbR_output.txt > "$f"s.output
	#awk -F"|" -v f="$f" '$4~ f"r"' "${seq}"_resfinder_report.txt >> "$f"r.output #already included above
	#awk -F"|" -v f="$f" '$4~ f"i"' "${seq}"_resfinder_report.txt >> "$f"i.output
	
	
	##calc level of resistance - messy code here. TO DO - neaten and reduce redundancy 
	
		awk -F"|" 'BEGIN { OFS = "\n" } {print $4,$5}' "$f"r.output | awk -F"," '{
    for (i=1; i<=NF; i++) {
        a[NR,i] = $i
        }
    }
    NF>p { p = NF }
    END {
      for(j=1; j<=p; j++) {
        str=a[1,j]
        for(i=2; i<=NR; i++){
            str=str"\t"a[i,j];
        }
        print str
       }
    }' | grep "$f" > "$f"r.level_calc
	
	awk -F"|" 'BEGIN { OFS = "\n" } {print $4,$5}' "$f"i.output | awk -F"," '{
    for (i=1; i<=NF; i++) {
        a[NR,i] = $i
        }
    }
    NF>p { p = NF }
    END {
      for(j=1; j<=p; j++) {
        str=a[1,j]
        for(i=2; i<=NR; i++){
            str=str"\t"a[i,j];
        }
        print str
       }
    }' | grep "$f" > "$f"i.level_calc
	
	awk -F"|" 'BEGIN { OFS = "\n" } {print $4,$5}' "$f"s.output | awk -F"," '{
    for (i=1; i<=NF; i++) {
        a[NR,i] = $i
        }
    }
    NF>p { p = NF }
    END {
      for(j=1; j<=p; j++) {
        str=a[1,j]
        for(i=2; i<=NR; i++){
            str=str"\t"a[i,j];
        }
        print str
       }
    }' | grep "$f" > "$f"s.level_calc
	
	cat "$f"{r,s,i}.level_calc > "$f".level_calc.tmp
	
	sum_resistance=$(awk '{ for(i=1; i<=NF; i++) { if($i ~ /^-?[0-9]+$/) { sum += $i } } } END { print sum }' "$f".level_calc.tmp)
	
	#echo "$sum_resistance"
	if [ ! -n "$sum_resistance" ]; then
	  sum_resistance=0
    fi
	
	grep -w "$f"r "$f"r.output &> /dev/null #looks for full resistance
	status=$?
	if [[ "$status" -eq 0 ]]; then 
		echo "found mechanism for $f resistance"
		length=$(wc -l "$f"r.output | awk '{print $1}' )
		if [[ "$length" -gt 1 ]]; then
			echo "found multiple determinants for $f resistance"
			sed -i "${i}s/.*/&,Resistant,${sum_resistance},Multiple determinants/" drug.table.txt
			i=$((i+1))
		else
			echo "found single mechanism for $f resistance" 
			mech=$(awk -F "|" '{ print $1,$2,$3 }' "$f"r.output) #Prints gene name (column 2 from SQL query) and mutation (col 3
			sed -i "${i}s/.*/&,Resistant,${sum_resistance},${mech}/" drug.table.txt
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
				echo "found multiple determinants for intermediate $f resistance"
				sed -i "${i}s/.*/&,Intermediate,${sum_resistance},Multiple determinants/" drug.table.txt
				i=$((i+1))
			else
				echo "found single mechanism for intermediate $f resistance" 
				mech=$(awk -F "|" '{ print $1,$2,$3 }' "$f"i.output) #Prints gene name (column 2 from SQL query) and mutation (col 3
				sed -i "${i}s/.*/&,Intermediate,${sum_resistance},${mech}/" drug.table.txt
				i=$((i+1))
			fi
		else
			echo "no intermediate resistance found"
			sed -i "${i}s/.*/&,Sensitive,${sum_resistance},No resistance detected/" drug.table.txt
			i=$((i+1))
		fi
	fi
done < <(grep -E "First-line|first-line" drug.table.txt.backup | awk -F "," '{ print $3 }') #Three letter abbreviation of antibiotic

while read f; do
	awk -F"|" -v f="$f" '$4~ f"s" ' AbR_output.txt > "$f"s.output 
	#awk -F"|" -v f="$f" '$4~ f"s" ' "${seq}"_resfinder_report.txt >> "$f"s.output
	
	##calc level of resistance - messy code here. TO DO - neaten and reduce redundancy 
	
	awk -F"|" 'BEGIN { OFS = "\n" } {print $4,$5}' "$f"r.output | awk -F"," '{
    for (i=1; i<=NF; i++) {
        a[NR,i] = $i
        }
    }
    NF>p { p = NF }
    END {
      for(j=1; j<=p; j++) {
        str=a[1,j]
        for(i=2; i<=NR; i++){
            str=str"\t"a[i,j];
        }
        print str
       }
    }' | grep "$f" > "$f"r.level_calc
	
	awk -F"|" 'BEGIN { OFS = "\n" } {print $4,$5}' "$f"i.output | awk -F"," '{
    for (i=1; i<=NF; i++) {
        a[NR,i] = $i
        }
    }
    NF>p { p = NF }
    END {
      for(j=1; j<=p; j++) {
        str=a[1,j]
        for(i=2; i<=NR; i++){
            str=str"\t"a[i,j];
        }
        print str
       }
    }' | grep "$f" > "$f"i.level_calc
	
	awk -F"|" 'BEGIN { OFS = "\n" } {print $4,$5}' "$f"s.output | awk -F"," '{
    for (i=1; i<=NF; i++) {
        a[NR,i] = $i
        }
    }
    NF>p { p = NF }
    END {
      for(j=1; j<=p; j++) {
        str=a[1,j]
        for(i=2; i<=NR; i++){
            str=str"\t"a[i,j];
        }
        print str
       }
    }' | grep "$f" > "$f"s.level_calc
	
	cat "$f"{r,s,i}.level_calc > "$f".level_calc.tmp
	
	sum_resistance=$(awk '{ for(i=1; i<=NF; i++) { if($i ~ /^-?[0-9]+$/) { sum += $i } } } END { print sum }' "$f".level_calc.tmp)
	#echo "$sum_resistance"
	if [ ! -n "$sum_resistance" ]; then
	  sum_resistance=0
    fi
	
	grep -w "$f"s "$f"s.output &> /dev/null
	status=$?
	if [[ "$status" -eq 0 ]]; then
		echo "found mechanism for $f sensitivity"
		length=$(wc -l "$f"s.output | awk '{print $1}' )
		if [[ "$length" -gt 1 ]]; then
			echo "found multiple determinants for $f sensitivity"
			#cat "$f"s.output >> drug.table.tertiary.txt
			sed -i "${i}s/.*/&,Sensitive,${sum_resistance},Multiple determinants/" drug.table.txt
			i=$((i+1))
		else
			echo "found single mechanism for $f sensitivity" 
			mech=$(awk -F "|" '{ print $1,$2,$3 }' "$f"s.output) #Prints gene name (column 2 from SQL query) and mutation (#col 3)
			sed -i "${i}s/.*/&,Sensitive,${sum_resistance},${mech}/" drug.table.txt
			#cat "$f"s.output >> drug.table.tertiary.txt
			i=$((i+1))
		fi
	else
		echo "no mechanism identified for $f sensitivity"
		sed -i "${i}s/.*/&,Resistant,${sum_resistance},No sensitivity detected/" drug.table.txt
		i=$((i+1))
	fi
done < <(grep -E "intrinsic|Intrinsic" drug.table.txt.backup | awk -F "," '{ print $3 }')

while read f; do 
	awk -F"|" -v f="$f" '$4~ f"r"' AbR_output.txt > "$f"r.output
	awk -F"|" -v f="$f" '$4~ f"i"' AbR_output.txt > "$f"i.output
	#awk -F"|" -v f="$f" '$4~ f"r"' "${seq}"_resfinder_report.txt >> "$f"r.output
	#awk -F"|" -v f="$f" '$4~ f"i"' "${seq}"_resfinder_report.txt >> "$f"i.output
	
		##calc level of resistance - messy code here. TO DO - neaten and reduce redundancy 
	
	awk -F"|" 'BEGIN { OFS = "\n" } {print $4,$5}' "$f"r.output | awk -F"," '{
    for (i=1; i<=NF; i++) {
        a[NR,i] = $i
        }
    }
    NF>p { p = NF }
    END {
      for(j=1; j<=p; j++) {
        str=a[1,j]
        for(i=2; i<=NR; i++){
            str=str"\t"a[i,j];
        }
        print str
       }
    }' | grep "$f" > "$f"r.level_calc
	
	awk -F"|" 'BEGIN { OFS = "\n" } {print $4,$5}' "$f"i.output | awk -F"," '{
    for (i=1; i<=NF; i++) {
        a[NR,i] = $i
        }
    }
    NF>p { p = NF }
    END {
      for(j=1; j<=p; j++) {
        str=a[1,j]
        for(i=2; i<=NR; i++){
            str=str"\t"a[i,j];
        }
        print str
       }
    }' | grep "$f" > "$f"i.level_calc
	
	awk -F"|" 'BEGIN { OFS = "\n" } {print $4,$5}' "$f"s.output | awk -F"," '{
    for (i=1; i<=NF; i++) {
        a[NR,i] = $i
        }
    }
    NF>p { p = NF }
    END {
      for(j=1; j<=p; j++) {
        str=a[1,j]
        for(i=2; i<=NR; i++){
            str=str"\t"a[i,j];
        }
        print str
       }
    }' | grep "$f" > "$f"s.level_calc
	
	cat "$f"{r,s,i}.level_calc > "$f".level_calc.tmp
	
	sum_resistance=$(awk '{ for(i=1; i<=NF; i++) { if($i ~ /^-?[0-9]+$/) { sum += $i } } } END { print sum }' "$f".level_calc.tmp)
	#echo "$sum_resistance"
	if [ ! -n "$sum_resistance" ]; then
	  sum_resistance=0
    fi
	
	grep -w "$f"r "$f"r.output &> /dev/null #looks for full resistance
	status=$?
	if [[ "$status" -eq 0 ]]; then
		echo "found mechanism for $f resistance"
		length=$(wc -l "$f"r.output | awk '{print $1}' )
		if [[ "$length" -gt 1 ]]; then
			echo "found multiple determinants for $f resistance"
			sed -i "${i}s/.*/&,Resistant,${sum_resistance},Multiple determinants/" drug.table.txt
			i=$((i+1))
		else
			echo "found single mechanism for $f resistance" 
			mech=$(awk -F "|" '{ print $1,$2,$3 }' "$f"r.output) #Prints gene name (column 2 from SQL query) and mutation (col 3
			sed -i "${i}s/.*/&,Resistant,${sum_resistance},${mech}/" drug.table.txt
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
				echo "found multiple determinants for intermediate $f resistance"
				sed -i "${i}s/.*/&,Intermediate,${sum_resistance},Multiple determinants/" drug.table.txt
				i=$((i+1))
			else
				echo "found single mechanism for intermediate $f resistance" 
				mech=$(awk -F "|" '{ print $1,$2,$3 }' "$f"i.output) #Prints gene name (column 2 from SQL query) and mutation (col 3
				sed -i "${i}s/.*/&,Intermediate,${sum_resistance},${mech}/" drug.table.txt
				i=$((i+1))
			fi
		else
			echo "no intermediate resistance found"
			sed -i "${i}s/.*/&,Sensitive,${sum_resistance},No resistance detected/" drug.table.txt
			i=$((i+1))
		fi
	fi
done < <(grep -E "Second-line|second-line" drug.table.txt.backup | awk -F "," '{ print $3 }') 

#Looking for resistance
while read f; do
	awk -F"|" -v f="$f" '$4~ f"r"' AbR_output.txt > "$f"r.output
	#awk -F"|" -v f="$f" '$4~ f"r"' "${seq}"_resfinder_report.txt >> "$f"r.output
	
		##calc level of resistance - messy code here. TO DO - neaten and reduce redundancy 
	
	awk -F"|" 'BEGIN { OFS = "\n" } {print $4,$5}' "$f"r.output | awk -F"," '{
    for (i=1; i<=NF; i++) {
        a[NR,i] = $i
        }
    }
    NF>p { p = NF }
    END {
      for(j=1; j<=p; j++) {
        str=a[1,j]
        for(i=2; i<=NR; i++){
            str=str"\t"a[i,j];
        }
        print str
       }
    }' | grep "$f" > "$f"r.level_calc
	
	awk -F"|" 'BEGIN { OFS = "\n" } {print $4,$5}' "$f"i.output | awk -F"," '{
    for (i=1; i<=NF; i++) {
        a[NR,i] = $i
        }
    }
    NF>p { p = NF }
    END {
      for(j=1; j<=p; j++) {
        str=a[1,j]
        for(i=2; i<=NR; i++){
            str=str"\t"a[i,j];
        }
        print str
       }
    }' | grep "$f" > "$f"i.level_calc
	
	awk -F"|" 'BEGIN { OFS = "\n" } {print $4,$5}' "$f"s.output | awk -F"," '{
    for (i=1; i<=NF; i++) {
        a[NR,i] = $i
        }
    }
    NF>p { p = NF }
    END {
      for(j=1; j<=p; j++) {
        str=a[1,j]
        for(i=2; i<=NR; i++){
            str=str"\t"a[i,j];
        }
        print str
       }
    }' | grep "$f" > "$f"s.level_calc
	
	cat "$f"{r,s,i}.level_calc > "$f".level_calc.tmp
	
	sum_resistance=$(awk '{ for(i=1; i<=NF; i++) { if($i ~ /^-?[0-9]+$/) { sum += $i } } } END { print sum }' "$f".level_calc.tmp)
	#echo "$sum_resistance"
	if [ ! -n "$sum_resistance" ]; then
	  sum_resistance=0
    fi
	
	grep -w "$f"r "$f"r.output &> /dev/null
	status=$?
	if [[ "$status" -eq 0 ]]; then
		echo "found mechanism for $f resistance"
		length=$(wc -l "$f"r.output | awk '{print $1}' )
		if [[ "$length" -gt 1 ]]; then
			echo "found multiple determinants for $f resistance"
			#cat "$f"s.output >> drug.table.tertiary.txt
			sed -i "${i}s/.*/&,Resistant,${sum_resistance},Multiple determinants/" drug.table.txt
			i=$((i+1))
		else
			echo "found single mechanism for $f resistance" 
			mech=$(awk -F "|" '{ print $1,$2,$3 }' "$f"r.output) #Prints gene name (column 2 from SQL query) and mutation (#col 3
			sed -i "${i}s/.*/&,Resistant,${sum_resistance},${mech}/" drug.table.txt
			#cat "$f"s.output >> drug.table.tertiary.txt
			i=$((i+1))
		fi
	else
		echo "no mechanism identified for $f resistance"
		sed -i "${i}s/.*/&,Sensitive,${sum_resistance},No resistance detected/" drug.table.txt
		i=$((i+1))
	fi
done < <(grep -E "tertiary|Tertiary" drug.table.txt.backup | awk -F "," '{ print $3 }')

#Looking for speciation and QC
echo "Looking for speciation markers"
awk -F"|" -v f="speciation" 'BEGIN{IGNORECASE=1} $4~ f' AbR_output.txt > speciation.output
grep -iw "speciation" speciation.output &> /dev/null
status=$?
if [[ "$status" -eq 0 ]]; then
	echo "Species specific marker is missing. Likely quality control issue" #TO DO This should go into final report
	echo "Interpret AMR profile with caution" #TO DO This should go into final report
fi	

# create patientDrugSusceptibilityData.csv
# ID refers to individual strains
sed -i "s/^/$seq,/" drug.table.txt
awk -v FS="," -v OFS="," '{print $1,$2,$3,$5,$6,$7 }' drug.table.txt > drug.table.txt.tmp

#debug line to check format
#cp drug.table.txt drug.table.txt.format_check

mv drug.table.txt.tmp drug.table.txt
sed -i '1 i\ID,Class,Drug,Status,Level,Details' drug.table.txt 
cp drug.table.txt patientDrugSusceptibilityData.csv

if [ -s AbR_output.final.txt ]; then
	cp AbR_output.final.txt "$seq".AbR_output.final.txt
else	
	echo "No antibiotic resistance identified in $seq" >> "$seq".AbR_output.final.txt
fi

exit 0
