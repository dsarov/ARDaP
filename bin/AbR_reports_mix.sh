#!/bin/bash

seq=$1
RESISTANCE_DB=$2

# This variable restricts resfinder matches to "3" which means 100% nucleotide identity across the entire length of the gene.
stringency=3

echo -e "Importing isolate data"
date=$(date +"%F")
echo -e "Looking for specific strain in the metadata file"
if grep -q -w "$seq" patientMetaData.csv; then
    echo "Found strain information"
    head -n1 patientMetaData.csv > patientMetaData_"$seq".csv
    grep -w "$seq" patientMetaData.csv >> patientMetaData_"$seq".csv
else
    echo "Couldn't find strain specific data in file, reverting to default"
    head -n1 patientMetaData.csv > patientMetaData_"$seq".csv
    echo -e "$seq,BARCODE,Smith,James,1/01/1990,Shanghai,Blood,$seq,$date,Blood,Cultured isolate,unspecified,$date,No words needed,Burkholderia pseudomallei,Dr. Requestor Name,req_contact@genome.com,XX,NA" >> patientMetaData_"$seq".csv   
fi  

mv patientMetaData_"$seq".csv patientMetaData.csv

cat << _EOF_ > Drug.table
.separator ","
SELECT Antibiotics."Drug_class",
Antibiotics.Antibiotic,
Antibiotics."Abbreviation"
FROM Antibiotics
ORDER BY Antibiotics."Drug_class"
_EOF_

sqlite3 "$RESISTANCE_DB" < Drug.table > drug.table.txt
cp drug.table.txt drug.table.txt.backup

# === FORMAT RESFINDER OUTPUT ===
touch "${seq}_resfinder_report.txt"
while IFS=, read -r d_class Antibiotic abbrev; do
    # Strip any hidden DOS carriage returns or whitespace
    abbrev=$(echo "$abbrev" | tr -d '\r ')
    
    if awk -F "\t" -v Ab="${Antibiotic}" 'BEGIN{IGNORECASE=1} $1==Ab' "${seq}_resfinder.txt" > resfinder_tmp.txt; then
        gene=$(awk -F "\t" '{ print $5 }' resfinder_tmp.txt | head -n1)
        if awk -F "\t" '$3 ~ "Resistant" { found=1; exit } END { exit !found }' resfinder_tmp.txt; then
            echo "Found resistance to ${Antibiotic} for ${seq}"
            echo -e "Resfinder|$gene||${abbrev}r|100" >> "${seq}_resfinder_report.txt"
        else
            echo "Strain appears sensitive to $Antibiotic"
        fi
    fi
done < drug.table.txt.backup

# === COMPILE ALL RESISTANCE MARKERS (MIXED VARIANTS) ===
cat "${seq}.AbR_output_snp_indel_mix.txt" "${seq}.AbR_output_del_dup_mix.txt" "${seq}_resfinder_report.txt" 2>/dev/null > AbR_output.tmp
awk -F"|" '!seen[$1,$2,$3,$4,$5]++' AbR_output.tmp > AbR_output.txt
cp AbR_output.txt AbR_output.final.txt

# === PROCESS EACH DRUG ROBUSTLY ===
echo "ID,Class,Drug,Status,Level,Details" > patientDrugSusceptibilityData.csv

while IFS=, read -r d_class d_name d_abbrev; do
    # Clean hidden whitespace to prevent matching errors
    d_class=$(echo "$d_class" | tr -d '\r')
    d_abbrev=$(echo "$d_abbrev" | tr -d '\r ')
    
    # 1. Safely extract exact matches only (CT will no longer match CTX)
    awk -F"|" -v f="${d_abbrev}r" 'BEGIN{OFS="|"} {split($4, a, ","); for(x in a) if(a[x]==f) {print $0; break}}' AbR_output.txt > "${d_abbrev}r.output"
    awk -F"|" -v f="${d_abbrev}i" 'BEGIN{OFS="|"} {split($4, a, ","); for(x in a) if(a[x]==f) {print $0; break}}' AbR_output.txt > "${d_abbrev}i.output"
    awk -F"|" -v f="${d_abbrev}s" 'BEGIN{OFS="|"} {split($4, a, ","); for(x in a) if(a[x]==f) {print $0; break}}' AbR_output.txt > "${d_abbrev}s.output"

    # 2. Calculate Resistance Levels
    sum_resistance=0
    for type in r i s; do
        local_sum=$(awk -F"|" -v tgt="${d_abbrev}${type}" '{
            split($4, d, ","); split($5, s, ",");
            for(x in d) if(d[x]==tgt) print s[x]+0
        }' "${d_abbrev}${type}.output" | awk '{sum+=$1} END {print sum+0}')
        sum_resistance=$((sum_resistance + local_sum))
    done

    status="Sensitive"
    mech="No resistance detected"

    # 3. Apply Class-Specific Reporting Logic
    if [[ "${d_class,,}" == *"intrinsic"* ]]; then
        # Intrinsic: looks for sensitivity mechanism first
        if [ -s "${d_abbrev}s.output" ]; then
            len=$(wc -l < "${d_abbrev}s.output")
            status="Sensitive"
            if [ "$len" -gt 1 ]; then
                mech="Multiple determinants"
            else
                mech=$(awk -F"|" '{print $1,$2,$3}' "${d_abbrev}s.output" | tr ',' ' ')
            fi
            echo "found mechanism for $d_name sensitivity"
        else
            status="Resistant"
            mech="No sensitivity detected"
            echo "no mechanism identified for $d_name sensitivity"
        fi
    else
        # First/Second/Tertiary: looks for Resistance, then Intermediate
        if [ -s "${d_abbrev}r.output" ]; then
            len=$(wc -l < "${d_abbrev}r.output")
            status="Resistant"
            if [ "$len" -gt 1 ]; then
                mech="Multiple determinants"
            else
                mech=$(awk -F"|" '{print $1,$2,$3}' "${d_abbrev}r.output" | tr ',' ' ')
            fi
            echo "found mechanism for $d_name resistance"
            
        elif [ -s "${d_abbrev}i.output" ]; then
            len=$(wc -l < "${d_abbrev}i.output")
            status="Intermediate"
            if [ "$len" -gt 1 ]; then
                mech="Multiple determinants"
            else
                mech=$(awk -F"|" '{print $1,$2,$3}' "${d_abbrev}i.output" | tr ',' ' ')
            fi
            echo "found intermediate resistance mechanism for $d_name"
            
        else
            status="Sensitive"
            mech="No resistance detected"
            echo "no mechanism identified for $d_name resistance"
        fi
    fi

    # Append safely to final CSV output
    echo "${seq},${d_class},${d_name},${status},${sum_resistance},${mech}" >> patientDrugSusceptibilityData.csv

done < drug.table.txt.backup

# === QC & SPECIATION ===
echo "Looking for speciation markers"
if awk -F"|" 'BEGIN{IGNORECASE=1} $4 ~ "speciation"' AbR_output.txt > speciation.output; then
    if ! grep -iqw "speciation" speciation.output; then
        echo "Species specific marker is missing. Likely quality control issue"
        echo "Interpret AMR profile with caution"
    fi
fi

# Ensure final output files are prepped
cp patientDrugSusceptibilityData.csv drug.table.txt

if [ ! -s "${seq}.AbR_output.final.txt" ]; then
    if [ -s AbR_output.final.txt ]; then
        cp AbR_output.final.txt "${seq}.AbR_output.final.txt"
    else    
        echo "No antibiotic resistance identified in $seq" > "${seq}.AbR_output.final.txt"
    fi
fi

exit 0