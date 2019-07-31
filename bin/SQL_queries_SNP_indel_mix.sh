#!/bin/bash


seq=$1
RESISTANCE_DB=$2 
#CARD_DB=$3

##GWAS cutoff value
#cutoff=$4


cat << _EOF_ >  Variant_ignore_Q.txt  
SELECT
Variants_SNP_indel.Gene_name,
Variants_SNP_indel.Variant_annotation
FROM
	Variants_SNP_indel
WHERE
	Variants_SNP_indel.Antibiotic_affected LIKE 'none';
_EOF_
  

sqlite3 "$RESISTANCE_DB" < Variant_ignore_Q.txt >> Variant_ignore.txt;

sed -i 's/|/ /g' Variant_ignore.txt 


while read f; do 
	grep -vw "$f" ${seq}.Function_lost_list.txt > ${seq}.Function_lost_list.txt.tmp
	mv ${seq}.Function_lost_list.txt.tmp ${seq}.Function_lost_list.txt
done < Variant_ignore.txt

#subset the SNP data based on interesting genes
SNP_DATA=$(
cat << EOF 
SELECT
    Variants_SNP_indel.Gene_name	
FROM 
    Variants_SNP_indel 
EOF
)

sqlite3 "$RESISTANCE_DB" "$SNP_DATA" > SNP_gene_list.txt
awk '!seen[$0]++' SNP_gene_list.txt > SNP_gene_list.txt.tmp
mv SNP_gene_list.txt.tmp SNP_gene_list.txt

while read f; do 
	grep "$f" ${seq}.annotated.ALL.effects >> ${seq}.annotated.ALL.effects.subset
done < SNP_gene_list.txt

declare -A SQL_SNP_report=()
STATEMENT_SNPS () {
COUNTER=1
while read line; do 
	gene=$(echo "$line" | awk '{print $1}')
	#echo $gene
	variant=$(echo "$line" | awk '{print $3}')
	variant2=$(echo "$line" | awk '{print $2}')
	#echo $variant
	SQL_SNP_report[$COUNTER]=$(
cat << EOF
SELECT 
	Variants_SNP_indel.Gene_name, 
	Variants_SNP_indel.Gene_name,
	Variants_SNP_indel.Variant_annotation, 
	Variants_SNP_indel.Antibiotic_affected, 
	Variants_SNP_indel.Comments 
FROM 
	Variants_SNP_indel 
WHERE 
	Variants_SNP_indel.Gene_name = '$gene' 
	AND Variants_SNP_indel.Variant_annotation = '$variant' 
	OR Variants_SNP_indel.Gene_name = '$gene' 
	AND Variants_SNP_indel.Variant_annotation = '$variant2';
EOF
	)

COUNTER=$((COUNTER+1))
done < ${seq}.annotated.ALL.effects.subset
SNP_COUNT="$COUNTER"
}

STATEMENT_SNPS

#echo "SNP_COUNT=$SNP_COUNT"

for (( i=1; i<"$SNP_COUNT"; i++ )); do 
	sqlite3 "$RESISTANCE_DB" "${SQL_SNP_report[$i]}" | tee output.temp >> ${seq}.AbR_output_snp_indel_mix.txt
		#copy the mixture information that was just found to the output
		echo "Format out command here"
		depth=$(awk -v i="$i" 'FNR==i' ${seq}.annotated.ALL.effects.subset | awk '{ print $7 }' )
		mutant_depth=$(awk -v i="$i" 'FNR==i' ${seq}.annotated.ALL.effects.subset | awk '{ print $6 }' | awk -F"," '{ print $2 }' )
		mixture_percent=$(echo "scale=2; $mutant_depth/$depth*100" | bc -l)
		mixture_percent="$mixture_percent"%
		sed -i '$ d' AbR_output.txt
		echo "$mixture_percent" | paste output.temp - >> ${seq}.AbR_output_snp_indel_mix.txt
done

#if [ ! -s ${seq}.AbR_output_snp_indel_mix.txt ]; then
	#echo "ARDaP found no snps or indels that cause antibiotic resistance" >> ${seq}.AbR_output_snp_indel_mix.txt
#fi

exit 0
