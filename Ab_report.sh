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

cp "$SCRIPTPATH"/Reports/data/*.png "$seq_path"/"$seq"/unique/data



###############################################################################
#
#    Format annotated SNP and indel files for database interrogation
#
###############################################################################


cat << _EOF_ >  "$seq_path"/"$seq"/unique/annotated/Variant_ignore_Q.txt  
SELECT
Variants_SNP_indel.Gene_name,
Variants_SNP_indel.Variant_annotation
FROM
	Variants_SNP_indel
WHERE
	Variants_SNP_indel.Antibiotic_affected LIKE 'none';
_EOF_
  

"$SQLITE" "$RESISTANCE_DB" < "$seq_path"/"$seq"/unique/annotated/Variant_ignore_Q.txt >> "$seq_path"/"$seq"/unique/annotated/Variant_ignore.txt;

sed -i 's/|/ /g' "$seq_path"/"$seq"/unique/annotated/Variant_ignore.txt 


while read f; do 
	grep -vw "$f" "$seq_path"/"$seq"/unique/annotated/Function_lost_list.txt > "$seq_path"/"$seq"/unique/annotated/Function_lost_list.txt.tmp
	mv "$seq_path"/"$seq"/unique/annotated/Function_lost_list.txt.tmp "$seq_path"/"$seq"/unique/annotated/Function_lost_list.txt
done < "$seq_path"/"$seq"/unique/annotated/Variant_ignore.txt

 ##############################################################################
##                                                                          ##  
##                                                                          ##
##             Creation of SELECT statements for database interrogation     ##
##                                                                          ##
##                                                                          ##
##############################################################################

echo -e "Creating SQL SELECT statements\n"

if [ "$GWAS" == "yes" ]; then
#statements for GWAS component
	STATEMENT_SNPS_GWAS () {

	COUNTER=1
	while read line; do 

	location=$(echo "$line" | awk '{print $1}')
	#echo $gene
	variant=$(echo "$line" | awk '{print $2 }')
	#echo $variant
	 
	cat << _EOF_ >  "$seq_path"/"$seq"/unique/annotated/statements/GWAS_SNP_report_$COUNTER
SELECT *
FROM
	GWAS
WHERE
		GWAS.Genomic_coord = '$location'
		AND GWAS.Mutation_type = 'SNP'	
		AND GWAS.Reference_base != '$variant';
		
_EOF_

	COUNTER=$((COUNTER+1))
	done < "$seq_path"/"$seq"/unique/annotated/annotated.snps.GWAS
	}


	STATEMENT_INDELS_GWAS () {

	COUNTER=1
	while read line; do 
	location=$(echo $line | awk '{print $1}')
	#echo $gene
	variant=$(echo $line | awk '{print $2 }')
	#echo $variant
 
cat << _EOF_ >  "$seq_path"/"$seq"/unique/annotated/statements/GWAS_indel_report_$COUNTER
SELECT *
FROM
	GWAS
WHERE
	GWAS.Genomic_coord = '$location'
	AND GWAS.Mutation_type = 'indel'	
	AND GWAS.Reference_base != '$variant';
		
_EOF_

	COUNTER=$((COUNTER+1))

	done < "$seq_path"/"$seq"/unique/annotated/annotated.indels.GWAS

	}

fi










Report_structure () {

cat << _EOF_ >  "$seq_path"/Outputs/Drug.table
.separator ","
SELECT Antibiotics."Drug_class",
Antibiotics.Antibiotic,
Antibiotics."Abbreviation"
FROM Antibiotics
ORDER BY Antibiotics."Drug_class"
_EOF_

"$SQLITE" "$RESISTANCE_DB" < "$seq_path"/Outputs/Drug.table >> "$seq_path"/"$seq"/unique/drug.table.txt

}



#create drug table and cleanup previous runs
if [ -s "$seq_path"/"$seq"/unique/drug.table.txt ]; then
  rm "$seq_path"/"$seq"/unique/drug.table.txt
fi

Report_structure

cp "$seq_path"/"$seq"/unique/drug.table.txt "$seq_path"/"$seq"/unique/drug.table.txt.backup






if [ "$GWAS" == "yes" ]; then
  echo -e "Creating SNP GWAS statements\n"
  date
  STATEMENT_SNPS_GWAS 
  echo -e "Creating indel GWAS statements\n"
  date
  STATEMENT_INDELS_GWAS
fi

if [ -s "$seq_path"/"$seq"/unique/AbR_output.txt ]; then
  echo "Cleaning up from previous run"
  rm "$seq_path"/"$seq"/unique/AbR_output.txt
  #also cleanup outputs from previous runs in case of DB update
  rm "$seq_path"/"$seq"/unique/*.output
fi

if [ -s "$seq_path"/"$seq"/unique/AbR_GWAS_output.txt ]; then
  rm "$seq_path"/"$seq"/unique/AbR_GWAS_output.txt
fi

if [ ! -s  "$seq_path"/"$seq"/unique/AbR_output.txt ]; then
	echo -e "Running queries to generate AbR_report.txt\n"
	
	
fi



#TODO encode a minimum mapping quality check and terminate the program if found.




#Process SNPs

#subset the SNP data based on interesting genes
SNP_DATA=$(
cat << EOF 
SELECT
    Variants_SNP_indel.Gene_name	
FROM 
    Variants_SNP_indel 
EOF
)

$SQLITE "$RESISTANCE_DB" "$SNP_DATA" > "$seq_path"/"$seq"/unique/SNP_gene_list.txt
awk '!seen[$0]++' "$seq_path"/"$seq"/unique/SNP_gene_list.txt > "$seq_path"/"$seq"/unique/SNP_gene_list.txt.tmp
mv "$seq_path"/"$seq"/unique/SNP_gene_list.txt.tmp "$seq_path"/"$seq"/unique/SNP_gene_list.txt


if [ "$GWAS" == "yes" ]; then
cat << _EOF_ > "$seq_path"/"$seq"/unique/GWAS.header.tmp
.headers ON
SELECT *
FROM GWAS
LIMIT 1;
_EOF_


	if [ ! -s "$seq_path"/"$seq"/unique/AbR_GWAS_output.txt ]; then
		"$SQLITE" "$RESISTANCE_DB" < "$seq_path"/"$seq"/unique/GWAS.header.tmp | head -n1 > "$seq_path"/"$seq"/unique/AbR_GWAS_output.header
		echo -e "Running queries to generate AbR_GWAS_report.txt\n"
		for f in "$seq_path"/"$seq"/unique/annotated/statements/GWAS*; do "$SQLITE" "$RESISTANCE_DB" < "$f" >> "$seq_path"/"$seq"/unique/AbR_GWAS_output.txt; done
	else
		echo "Found GWAS output"
	fi


	#filter and clean-up

	awk -v cutoff="$cutoff" -F"|" '{ 
	  for (i=5;i<=NF;i++) if ($i < cutoff && $i > 0) {
	  print $0; break; }
	  }' < "$seq_path"/"$seq"/unique/AbR_GWAS_output.txt | sort -V -k1,1 > "$seq_path"/"$seq"/unique/AbR_GWAS_output.txt.tmp

	mv "$seq_path"/"$seq"/unique/AbR_GWAS_output.txt.tmp "$seq_path"/"$seq"/unique/AbR_GWAS_output.txt  
	cat "$seq_path"/"$seq"/unique/AbR_GWAS_output.header "$seq_path"/"$seq"/unique/AbR_GWAS_output.txt > "$seq_path"/"$seq"/unique/AbR_GWAS_output.txt.tmp
	mv "$seq_path"/"$seq"/unique/AbR_GWAS_output.txt.tmp "$seq_path"/"$seq"/unique/AbR_GWAS_output.txt 

	##annotate
	tail -n +2 "$seq_path"/"$seq"/unique/AbR_GWAS_output.txt > "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot
	awk -F"|" '$4=="indel" {print $2 }' "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot | sed -r 's/(.*)_/\1\t/' >  "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot.indels
	awk -F"|" '$4=="SNP" {print $2 }' "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot | sed -r 's/(.*)_/\1\t/' > "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot.SNP
	#for each line, grep through annotated SNPs, print relevant line and then paste back with GWAS



	awk -F"|" '$4=="SNP"' "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot > "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot.SNP.temp1

	while read line; do  grep -w "$line" "$seq_path"/"$seq"/unique/annotated/"$seq".snps.PASS.vcf.annotated | awk '{if (match($0,"ANN=")){print substr($0,RSTART)} else print ""}' | awk -F"|" '{print $2,$3,$4,$5,$11}' >> "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot.SNP.temp2;  done < "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot.SNP


	paste "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot.SNP.temp1 "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot.SNP.temp2 > "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot.SNP.temp3
	echo -e "Variant_type\tImpact\tGene_name\tGene_Id\tMutation" > "$seq_path"/"$seq"/unique/header.tmp
	paste "$seq_path"/"$seq"/unique/AbR_GWAS_output.header "$seq_path"/"$seq"/unique/header.tmp > "$seq_path"/"$seq"/unique/AbR_GWAS_output.header.mutations
	cat  "$seq_path"/"$seq"/unique/AbR_GWAS_output.header.mutations "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot.SNP.temp3 > "$seq_path"/"$seq"/unique/AbR_GWAS_output.SNPs


	awk -F"|" '$4=="indel"' "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot > "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot.indels.temp1
	while read line; do  grep -w "$line" "$seq_path"/"$seq"/unique/annotated/"$seq".indels.PASS.vcf.annotated | awk '{if (match($0,"ANN=")){print substr($0,RSTART)} else print ""}' | awk -F"|" '{print $2,$3,$4,$5,$11}' >> "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot.indels.temp2;  done < "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot.indels

	paste "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot.indels.temp1 "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot.indels.temp2 > "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot.indels.temp3
	cat  "$seq_path"/"$seq"/unique/AbR_GWAS_output.header.mutations "$seq_path"/"$seq"/unique/AbR_GWAS_output.annot.indels.temp3 > "$seq_path"/"$seq"/unique/AbR_GWAS_output.indels
fi

##CARD database queries
#subset on column 7, which is coverage stat (0 to 1). Filter based on 0.98 and 0.95

awk '{ if ( $7 > 0.97) print $0 }' "$seq_path"/Outputs/CARD/"$seq".bedcov > "$seq_path"/"$seq"/unique/CARD/"$seq"_98p.bedcov
awk '{ if ( $7 < 0.98 && $7 > 0.94 ) print $0 }' "$seq_path"/Outputs/CARD/"$seq".bedcov > "$seq_path"/"$seq"/unique/CARD/"$seq"_95p_to_98p.bedcov

#for each line in the bedcov files, lookup the aro database and report 2nd and third term

if [ -s "$seq_path"/"$seq"/unique/CARD/"$seq"_98p.genes ]; then
  rm "$seq_path"/"$seq"/unique/CARD/"$seq"_98p.genes
fi

if [ -s "$seq_path"/"$seq"/unique/CARD/"$seq"_95p_to_98p.genes ]; then
  rm "$seq_path"/"$seq"/unique/CARD/"$seq"_95p_to_98p.genes
fi

#TODO CARD database needs to be relational here?

awk -F "|" ' { print $5 } ' "$seq_path"/"$seq"/unique/CARD/"$seq"_98p.bedcov | while read f; do grep -w "$f" "$SCRIPTPATH"/Databases/CARD/aro.csv >> "$seq_path"/"$seq"/unique/CARD/"$seq"_98p.genes; done
 
awk -F "|" ' { print $5 } ' "$seq_path"/"$seq"/unique/CARD/"$seq"_95p_to_98p.bedcov | while read f; do grep -w "$f" "$SCRIPTPATH"/Databases/CARD/aro.csv >> "$seq_path"/"$seq"/unique/CARD/"$seq"_95p_to_98p.genes; done

#test to see if CARD genes are in ignore list
CARD_IGNORE () {
COUNTER=1
while read line; do 
  ARO=$(echo "$line" | awk '{print $1}' | sed 's/ARO://g' )
  
cat << _EOF_ >  "$seq_path"/"$seq"/unique/CARD/CARD_ignore_$COUNTER

SELECT
    CARD_ignore.ARO_ID
FROM
    CARD_ignore
WHERE
    CARD_ignore.ARO_ID = '$ARO';
_EOF_
COUNTER=$((COUNTER+1))
done < "$seq_path"/"$seq"/unique/CARD/"$seq"_98p.genes
}

CARD_IGNORE

if [ -s "$seq_path"/"$seq"/unique/CARD/CARD_ignore_output.txt ]; then
  rm "$seq_path"/"$seq"/unique/CARD/CARD_ignore_output.txt
fi  
if [ -s "$seq_path"/"$seq"/unique/CARD/CARD_no_ignore.txt ]; then
  rm "$seq_path"/"$seq"/unique/CARD/CARD_no_ignore.txt
fi
if [ -s "$seq_path"/"$seq"/unique/CARD/CARD_primary_output.txt ]; then
  rm "$seq_path"/"$seq"/unique/CARD/CARD_primary_output.txt
fi  
  
for f in "$seq_path"/"$seq"/unique/CARD/CARD_ignore_*; do $SQLITE $CARD_DB < $f >> "$seq_path"/"$seq"/unique/CARD/CARD_ignore_output.txt; done

while read line; do
  ARO=$(echo $line | awk '{print $1}' | sed 's/ARO://g' )
  grep -w "$ARO" "$seq_path"/"$seq"/unique/CARD/CARD_ignore_output.txt
  status=$?
  if [ ! $status == 0 ]; then
    grep -w "$ARO" "$seq_path"/"$seq"/unique/CARD/"$seq"_98p.genes >> "$seq_path"/"$seq"/unique/CARD/CARD_no_ignore.txt
  fi
done < "$seq_path"/"$seq"/unique/CARD/"$seq"_98p.genes

if [ -s "$seq_path"/"$seq"/unique/CARD/CARD_no_ignore.txt ]; then
CARD_PRIMARY () {
COUNTER=1
while read line; do 
  ARO=$(echo $line | awk '{print $1}' | sed 's/ARO://g' )
  
cat << _EOF_ >  "$seq_path"/"$seq"/unique/CARD/CARD_Primary_$COUNTER

SELECT
    CARD_Primary.ARO_ID,
	CARD_Primary.GeneName,
	CARD_Primary.Antibiotic_affected,
	CARD_Primary.GenusSpecies,
	CARD_Primary.Description
FROM
    CARD_Primary
WHERE
    CARD_Primary.ARO_ID = '$ARO';
_EOF_

COUNTER=$((COUNTER+1))
done < "$seq_path"/"$seq"/unique/CARD/CARD_no_ignore.txt
}

CARD_PRIMARY

for f in "$seq_path"/"$seq"/unique/CARD/CARD_Primary_*; do $SQLITE $CARD_DB < $f >> "$seq_path"/"$seq"/unique/CARD/CARD_primary_output.txt; done

fi

## the below code prints the abbreviated drug name from the drug table and retrieves this line from the AbR_output.txt
## 
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


exit 0
