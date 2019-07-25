#!/bin/bash



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



if [ "$GWAS" == "yes" ]; then
  echo -e "Creating SNP GWAS statements\n"
  date
  STATEMENT_SNPS_GWAS 
  echo -e "Creating indel GWAS statements\n"
  date
  STATEMENT_INDELS_GWAS
fi


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