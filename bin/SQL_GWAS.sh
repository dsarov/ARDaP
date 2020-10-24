#!/bin/bash


#File inputs
seq=$1
RESISTANCE_DB=$2

echo -e "Creating SQL SELECT statements\n"

#statements for GWAS component
	STATEMENT_SNPS_GWAS () {

	COUNTER=1
	while read line; do 

	location=$(echo "$line" | awk '{print $1}')
	#echo $gene
	variant=$(echo "$line" | awk '{print $2 }')
	#echo $variant

	cat << _EOF_ >  GWAS_SNP_report_$COUNTER
SELECT *
FROM
	GWAS
WHERE
		GWAS.Genomic_coord = '$location'
		AND GWAS.Mutation_type = 'SNP'	
		AND GWAS.Reference_base != '$variant';
		
_EOF_

	COUNTER=$((COUNTER+1))
	done < ${seq}.annotated.snp.effects
	}


	STATEMENT_INDELS_GWAS () {

	COUNTER=1
	while read line; do 
	location=$(echo $line | awk '{print $1}')
	#echo $gene
	variant=$(echo $line | awk '{print $2 }')
	#echo $variant

cat << _EOF_ >  GWAS_indel_report_$COUNTER
SELECT *
FROM
	GWAS
WHERE
	GWAS.Genomic_coord = '$location'
	AND GWAS.Mutation_type = 'indel'	
	AND GWAS.Reference_base != '$variant';
		
_EOF_

	COUNTER=$((COUNTER+1))

	done < ${seq}.annotated.indel.effects

	}

echo -e "Creating SNP GWAS statements\n"
date
STATEMENT_SNPS_GWAS 
echo -e "Creating indel GWAS statements\n"
date
STATEMENT_INDELS_GWAS

cat << _EOF_ > GWAS.header.tmp
.headers ON
SELECT *
FROM GWAS
LIMIT 1;
_EOF_



"$SQLITE" "$RESISTANCE_DB" < GWAS.header.tmp | head -n1 > AbR_GWAS_output.header
echo -e "Running queries to generate AbR_GWAS_report.txt\n"
for f in GWAS*; do "$SQLITE" "$RESISTANCE_DB" < "$f" >> AbR_GWAS_output.txt; done

awk -v cutoff="$cutoff" -F"|" '{ 
	for (i=5;i<=NF;i++) if ($i < cutoff && $i > 0) {
	print $0; break; }
	}' < AbR_GWAS_output.txt | sort -V -k1,1 > AbR_GWAS_output.txt.tmp


mv AbR_GWAS_output.txt.tmp AbR_GWAS_output.txt  
cat AbR_GWAS_output.header AbR_GWAS_output.txt > AbR_GWAS_output.txt.tmp
mv AbR_GWAS_output.txt.tmp AbR_GWAS_output.txt 

##annotate
tail -n +2 AbR_GWAS_output.txt > AbR_GWAS_output.annot
awk -F"|" '$4=="indel" {print $2 }' AbR_GWAS_output.annot | sed -r 's/(.*)_/\1\t/' >  AbR_GWAS_output.annot.indels
awk -F"|" '$4=="SNP" {print $2 }' AbR_GWAS_output.annot | sed -r 's/(.*)_/\1\t/' > AbR_GWAS_output.annot.SNP
	#for each line, grep through annotated SNPs, print relevant line and then paste back with GWAS



awk -F"|" '$4=="SNP"' AbR_GWAS_output.annot > AbR_GWAS_output.annot.SNP.temp1

while read line; do  grep -w "$line" "$seq".snps.PASS.vcf.annotated | awk '{if (match($0,"ANN=")){print substr($0,RSTART)} else print ""}' | awk -F"|" '{print $2,$3,$4,$5,$11}' >> AbR_GWAS_output.annot.SNP.temp2;  done < AbR_GWAS_output.annot.SNP


paste AbR_GWAS_output.annot.SNP.temp1 AbR_GWAS_output.annot.SNP.temp2 > AbR_GWAS_output.annot.SNP.temp3
echo -e "Variant_type\tImpact\tGene_name\tGene_Id\tMutation" > header.tmp
paste AbR_GWAS_output.header header.tmp > AbR_GWAS_output.header.mutations
cat  AbR_GWAS_output.header.mutations AbR_GWAS_output.annot.SNP.temp3 > AbR_GWAS_output.SNPs


awk -F"|" '$4=="indel"' AbR_GWAS_output.annot > AbR_GWAS_output.annot.indels.temp1
while read line; do  grep -w "$line" "$seq".indels.PASS.vcf.annotated | awk '{if (match($0,"ANN=")){print substr($0,RSTART)} else print ""}' | awk -F"|" '{print $2,$3,$4,$5,$11}' >> AbR_GWAS_output.annot.indels.temp2;  done < AbR_GWAS_output.annot.indels

paste AbR_GWAS_output.annot.indels.temp1 AbR_GWAS_output.annot.indels.temp2 > AbR_GWAS_output.annot.indels.temp3
cat  AbR_GWAS_output.header.mutations AbR_GWAS_output.annot.indels.temp3 > AbR_GWAS_output.indels