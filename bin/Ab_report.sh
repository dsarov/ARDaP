#!/bin/bash



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








#create drug table and cleanup previous runs
if [ -s "$seq_path"/"$seq"/unique/drug.table.txt ]; then
  rm "$seq_path"/"$seq"/unique/drug.table.txt
fi



cp "$seq_path"/"$seq"/unique/drug.table.txt "$seq_path"/"$seq"/unique/drug.table.txt.backup






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




	#filter and clean-up

	

#

## the below code prints the abbreviated drug name from the drug table and retrieves this line from the AbR_output.txt
## 



exit 0
