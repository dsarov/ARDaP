#!/bin/bash
#PBS -o logs/AbR_"$seq".txt
#$ -S /bin/bash
#$ -cwd



############################################################################
# 
#
############################################################################
#### Variables required seq ref org strain seq_path annotate pairing tech window ####

# TODO
# convert GWAS to variable interrogation of SQLite database


#source variables
echo -e "sourcing variables\n"

source "$SCRIPTPATH"/ARDaP.config
source "$SCRIPTPATH"/GATK.config

##GWAS cutoff value
cutoff=$(echo "0.0000001" | bc)

RESISTANCE_DB="$SCRIPTPATH"/Databases/"$variant_genome"/"$variant_genome".db 
CARD_DB="$SCRIPTPATH"/Databases/"$variant_genome"/"$variant_genome"_CARD.db

if [ ! -s "$RESISTANCE_DB" ]; then
  echo "Couldn't find the main database for $variant_genome"
  exit 1
fi

if [ ! -s "$CARD_DB" ]; then
  echo "Couldn't find the CARD database for $variant_genome"
  exit 1
fi

if [ ! "$PBS_O_WORKDIR" ]
    then
        PBS_O_WORKDIR="$seq_path"
fi

cd "$PBS_O_WORKDIR"

log_eval()
{
  cd "$1"
  echo -e "\nIn $1\n"
  echo "Running: $2"

  #eval "$2"
  eval "time $2"
  status=$?
  
  if [ ! $status == 0 ]; then
    echo "Previous command returned error: $status"
    exit 1
  fi
}




echo -e "Preparing input files\n"


#TODO
# need to check if a patient metadata file has been supplied. If no metadatafile has been supplied then make dummy file with appropriate strain ID

if [ ! -s "$seq_path"/patientMetaData.csv ]; then #test for initial file provided by user if none then create dummy file
	echo -e "ID,Barcode,LName,FName,DOB,Location,sampType,sampID,sampDate,sampSource,sampSeq,reportLab,reportDate,comments,organism,requestor,requestorContact,lineageNum,lineageName" > "$seq_path"/"$seq"/unique/patientMetaData.csv
	echo -e "$seq,BARCODE,Jones,Douglas,1890-01-01,Oxford,Sputum,ABDH615D!,1916-12-25; 15:33,Pulmonary,MGIT Cultured Isolate,Oxford,1917-01-03,No words needed,Doppelganglius Bob,Dr. Requestor Name,req_contact@genome.com,2.2.1,East-Asian Beijing" >> "$seq_path"/"$seq"/unique/patientMetaData.csv
else
	echo -e "TO DO: include test for specific strain\nIf strain not found create dummy, if found copy line to unique dir\n"
fi

if [ ! -d "$seq_path"/"$seq"/unique/data ]; then
	mkdir "$seq_path"/"$seq"/unique/data
fi

cp "$SCRIPTPATH"/Reports/data/*.png "$seq_path"/"$seq"/unique/data

if [ "$mixtures" = no ]; then
	ANNOTATED_SNPS="$seq_path"/"$seq"/unique/annotated/"$seq".snps.PASS.vcf.annotated
	ANNOTATED_INDELS="$seq_path"/"$seq"/unique/annotated/"$seq".indels.PASS.vcf.annotated
	if [ ! -s "$ANNOTATED_SNPS" ]; then
		echo "Cannot find $ANNOTATED_SNPS. This script will now exit."
		exit 1
	else
		echo "Found $ANNOTATED_SNPS"
	fi  
	if [ ! -s "$ANNOTATED_INDELS" ]; then
		echo "Cannot find $ANNOTATED_INDELS. This script will now exit."
		exit 1
	 else
		echo "Found $ANNOTATED_INDELS"
	fi 
fi
if [ "$mixtures" = yes ]; then
	ANNOTATED_ALL="$seq_path"/"$seq"/unique/annotated/"${seq}".ALL.annotated.mixed.vcf
	if [ ! -s "$ANNOTATED_ALL" ]; then
		echo "Cannot find $ANNOTATED_ALL. This script will now exit."
		exit 1
	else
		echo "Found $ANNOTATED_ALL"
	fi 
fi
###############################################################################
#
#    Format annotated SNP and indel files for database interrogation
#
###############################################################################
if [ "$mixtures" = yes ]; then
	if [ ! -s "$seq_path"/"$seq"/unique/annotated/annotated.ALL.effects ]; then
		cd "$seq_path"/"$seq"/unique/annotated/
		awk '{
		  if (match($0,"ANN=")){print substr($0,RSTART)}
		 }' "$seq_path"/"$seq"/unique/annotated/"${seq}".ALL.annotated.mixed.vcf > "$seq_path"/"$seq"/unique/annotated/ALL.effects.tmp
	  
		awk -F "|" '{ print $4,$10,$11,$15 }' "$seq_path"/"$seq"/unique/annotated/ALL.effects.tmp | sed 's/c\.//' | sed 's/p\.//' | sed 's/n\.//'> "$seq_path"/"$seq"/unique/annotated/annotated.ALL.effects.tmp #todo: check if column 15 is ever reported in ANN
        grep -E "#|ANN=" "$seq_path"/"$seq"/unique/annotated/"$seq".ALL.annotated.mixed.vcf > "$seq_path"/"$seq"/unique/annotated/ALL.annotated.subset.vcf
        log_eval "$seq_path"/"$seq"/unique/annotated "$GATK VariantsToTable -V ${seq_path}/${seq}/unique/annotated/ALL.annotated.subset.vcf -F CHROM -F POS -F REF -F ALT -F TYPE -GF GT -GF AD -GF DP -O ${seq_path}/${seq}/unique/annotated/ALL.genotypes.subset.table.vcf"
        tail -n +2 "$seq_path"/"$seq"/unique/annotated/ALL.genotypes.subset.table.vcf | awk '{ print $5,$6,$7,$8 }' > "$seq_path"/"$seq"/unique/annotated/ALL.genotypes.subset.table.vcf.headerless
		paste "$seq_path"/"$seq"/unique/annotated/annotated.ALL.effects.tmp "$seq_path"/"$seq"/unique/annotated/ALL.genotypes.subset.table.vcf.headerless > "$seq_path"/"$seq"/unique/annotated/annotated.ALL.effects
		
		if [ "$GWAS" == "yes" ]; then
			awk '{ print $1"_"$2, $5 }' "${seq}".ALL.PASS.vcf.annotated  | grep -v '#' > annotated.ALL.GWAS
		fi 
	  
		echo "Identifying high consequence mutations"
		
		grep '|HIGH|' "$seq_path"/"$seq"/unique/annotated/"${seq}".ALL.annotated.mixed.vcf > "$seq_path"/"$seq"/unique/annotated/"${seq}".ALL.func.lost
		awk '{
		  if (match($0,"ANN=")){print substr($0,RSTART)}
		 }' "$seq_path"/"$seq"/unique/annotated/"${seq}".ALL.func.lost > "$seq_path"/"$seq"/unique/annotated/"${seq}".ALL.func.lost.annotations
		awk -F "|" '{ print $4,$10,$11,$15 }' "$seq_path"/"$seq"/unique/annotated/"${seq}".ALL.func.lost.annotations | sed 's/c\.//' | sed 's/p\.//' | sed 's/n\.//'> "$seq_path"/"$seq"/unique/annotated/"${seq}".ALL.func.lost.annotations.tmp
		grep -E "#|\|HIGH\|" "$seq_path"/"$seq"/unique/annotated/"$seq".ALL.annotated.mixed.vcf > "$seq_path"/"$seq"/unique/annotated/ALL.annotated.func.lost.vcf
        log_eval "$seq_path"/"$seq"/unique/annotated "$GATK VariantsToTable -V ${seq_path}/${seq}/unique/annotated/ALL.annotated.func.lost.vcf -F CHROM -F POS -F REF -F ALT -F TYPE -GF GT -GF AD -GF DP -O ${seq_path}/${seq}/unique/annotated/ALL.annotated.func.lost.table"
		tail -n +2 "$seq_path"/"$seq"/unique/annotated/ALL.annotated.func.lost.table | awk '{ print $5,$6,$7,$8 }' > "$seq_path"/"$seq"/unique/annotated/ALL.annotated.func.lost.table.headerless
		paste "${seq}".ALL.func.lost.annotations.tmp "$seq_path"/"$seq"/unique/annotated/ALL.annotated.func.lost.table.headerless > "$seq_path"/"$seq"/unique/annotated/Function_lost_list.txt
	fi
	
	#create deletion and duplication summary files from pindel
	if [ ! -s "$seq_path"/"$seq"/unique/deletion_summary_mix.txt ]; then
		grep -v '#' "$seq_path"/"$seq"/unique/pindel.out_D.vcf | awk -v OFS="\t" '{ print $1,$2 }' > "$seq_path"/"$seq"/unique/start.coords.list
		grep -v '#' "$seq_path"/"$seq"/unique/pindel.out_D.vcf | gawk 'match($0, /END=([0-9]+);/,arr){ print arr[1]}' > "$seq_path"/"$seq"/unique/end.coords.list
		#messy parsing of vcf here
		grep -v '#' "$seq_path"/"$seq"/unique/pindel.out_D.vcf | awk '{ print $10 }' | awk -F":" '{print $2 }' | awk -F"," '{ print $2 }' > "$seq_path"/"$seq"/unique/mutant_depth.D
		grep -v '#' "$seq_path"/"$seq"/unique/pindel.out_D.vcf | awk '{ print $10 }' | awk -F":" '{print $2 }' | awk -F"," '{ print $1+$2 }' > "$seq_path"/"$seq"/unique/depth.D
		paste "$seq_path"/"$seq"/unique/start.coords.list "$seq_path"/"$seq"/unique/end.coords.list "$seq_path"/"$seq"/unique/mutant_depth.D "$seq_path"/"$seq"/unique/depth.D > "$seq_path"/"$seq"/unique/deletion_summary_mix.txt
	fi
	if [ ! -s "$seq_path"/"$seq"/unique/duplication_summary_mix.txt ]; then
		grep -v '#' "$seq_path"/"$seq"/unique/pindel.out_TD.vcf | awk '{ print $1,$2 }' > "$seq_path"/"$seq"/unique/start.coords.list
		grep -v '#' "$seq_path"/"$seq"/unique/pindel.out_TD.vcf | gawk 'match($0, /END=([0-9]+);/,arr){ print arr[1]}' > "$seq_path"/"$seq"/unique/end.coords.list
		grep -v '#' "$seq_path"/"$seq"/unique/pindel.out_TD.vcf | awk '{ print $10 }' | awk -F":" '{print $2 }' | awk -F"," '{ print $2 }' > "$seq_path"/"$seq"/unique/mutant_depth.TD
		grep -v '#' "$seq_path"/"$seq"/unique/pindel.out_TD.vcf | awk '{ print $10 }' | awk -F":" '{print $2 }' | awk -F"," '{ print $1+$2 }' > "$seq_path"/"$seq"/unique/depth.TD
		paste "$seq_path"/"$seq"/unique/start.coords.list "$seq_path"/"$seq"/unique/end.coords.list "$seq_path"/"$seq"/unique/mutant_depth.TD "$seq_path"/"$seq"/unique/depth.TD > "$seq_path"/"$seq"/unique/duplication_summary_mix.txt	
	fi
fi

if [ "$mixtures" = no ]; then
	if [ ! -s "$seq_path"/"$seq"/unique/annotated/annotated.snp.effects -o ! -s "$seq_path"/"$seq"/unique/annotated/annotated.indel.effects ]; then
		cd "$seq_path"/"$seq"/unique/annotated/
		  
		### indels  ###
		awk '{
			if (match($0,"ANN=")){print substr($0,RSTART)}
			}' "${seq}".indels.PASS.vcf.annotated > indel.effects.tmp
		  
		awk -F "|" '{ print $4,$10,$11,$15 }' indel.effects.tmp | sed 's/c\.//' | sed 's/p\.//' | sed 's/n\.//'> annotated.indel.effects
		if [ "$GWAS" == "yes" ]; then
			awk '{ print $1"_"$2, $5 }' "${seq}".indels.PASS.vcf.annotated  | grep -v '#' > annotated.indels.GWAS
		fi 
		  
		  ### SNPs ###
		awk '{
			if (match($0,"ANN=")){print substr($0,RSTART)}
			}' "${seq}".snps.PASS.vcf.annotated > snp.effects.tmp
		awk -F "|" '{ print $4,$10,$11,$15 }' snp.effects.tmp | sed 's/c\.//' | sed 's/p\.//' | sed 's/n\.//' > annotated.snp.effects
		  
		if [ "$GWAS" == "yes" ]; then
			awk '{ print $1"_"$2, $5 }' "${seq}".snps.PASS.vcf.annotated  | grep -v '#' > annotated.snps.GWAS
		fi

		echo "Identifying high consequence mutations"
		  
		grep 'HIGH' "$seq_path"/"$seq"/unique/annotated/snp.effects.tmp  | awk -F"|" '{ print $4,$11 }' >> "$seq_path"/"$seq"/unique/annotated/Function_lost_list.txt
		grep 'HIGH' "$seq_path"/"$seq"/unique/annotated/indel.effects.tmp | awk -F"|" '{ print $4,$11 }' >> "$seq_path"/"$seq"/unique/annotated/Function_lost_list.txt
		  
		sed -i 's/p\.//' "$seq_path"/"$seq"/unique/annotated/Function_lost_list.txt
		if [ -s "$seq_path"/"$seq"/unique/annotated/snp.effects.tmp ]; then
			rm snp.effects.tmp
		fi
		if [ -s "$seq_path"/"$seq"/unique/annotated/indel.effects.tmp ]; then
			rm indel.effects.tmp
		fi
	fi
fi

if [ -s "$seq_path"/"$seq"/unique/annotated/Variant_ignore_Q.txt ]; then
  rm "$seq_path"/"$seq"/unique/annotated/Variant_ignore_Q.txt
fi

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



if [ ! -d "$seq_path"/"$seq"/unique/annotated/statements ]; then
	mkdir "$seq_path"/"$seq"/unique/annotated/statements
fi

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

declare -A SQL_loss_report_mix=()
STATEMENT_GENE_LOSS_COV_MIX () {
COUNTER=1
while read line; do 
chromosome=$(echo "$line" | awk '{print $1}')
q_start=$(echo "$line" | awk '{print $2}')
q_end=$(echo "$line" | awk '{print $3 }')
SQL_loss_report_mix[$COUNTER]=$(
cat << EOF
SELECT
    Coverage.Gene,
    Coverage.Locus_tag,
    Coverage.Upregulation_or_loss,
    Coverage.Antibiotic_affected,
    Coverage.Known_combination,
	Coverage.Comments
FROM
    Coverage
WHERE
    Coverage.Chromosome = '$chromosome'
    AND Coverage.Start_coords < '$q_end'
    AND Coverage.End_coords > '$q_start'
    AND Coverage.Upregulation_or_loss LIKE 'Loss';
EOF
)

COUNTER=$((COUNTER+1))
done < "$seq_path"/"$seq"/unique/deletion_summary_mix.txt
LOSS_COUNT="$COUNTER"
}

declare -A SQL_upregulation_report_mix=()
STATEMENT_UPREGULATION_MIX () {
COUNTER=1
while read line; do
  chromosome=$(echo "$line" | awk '{print $1}')
  q_start=$(echo "$line" | awk '{print $2}')
  q_end=$(echo "$line" | awk '{print $3 }')
SQL_upregulation_report_mix[$COUNTER]=$(
cat << EOF
SELECT
    Coverage.Gene,
    Coverage.Locus_tag,
    Coverage.Upregulation_or_loss,
    Coverage.Antibiotic_affected,
    Coverage.Known_combination,
	Coverage.Comments
FROM
    Coverage
WHERE
    Coverage.Chromosome = '$chromosome'
    AND Coverage.Start_coords > '$q_start'
    AND Coverage.End_coords < '$q_end'
    AND Coverage.Upregulation_or_loss LIKE 'Upregulation';
EOF
)

COUNTER=$((COUNTER+1))
done < "$seq_path"/"$seq"/unique/duplication_summary_mix.txt
UPREG_COUNT="$COUNTER"
}

declare -A SQL_loss_report=()
STATEMENT_GENE_LOSS_COV () {
COUNTER=1
while read line; do 
chromosome=$(echo "$line" | awk '{print $1}')
q_start=$(echo "$line" | awk '{print $2}')
q_end=$(echo "$line" | awk '{print $3 }')
SQL_loss_report[$COUNTER]=$(
cat << EOF
SELECT
    Coverage.Gene,
    Coverage.Locus_tag,
    Coverage.Upregulation_or_loss,
    Coverage.Antibiotic_affected,
    Coverage.Known_combination,
	Coverage.Comments
FROM
    Coverage
WHERE
    Coverage.Chromosome = '$chromosome'
    AND Coverage.Start_coords < '$q_end'
    AND Coverage.End_coords > '$q_start'
    AND Coverage.Upregulation_or_loss LIKE 'Loss';
EOF
)

COUNTER=$((COUNTER+1))
done < <(tail -n +2 "$seq_path"/"$seq"/unique/deletion_summary.txt)
LOSS_COUNT="$COUNTER"
}

declare -A SQL_upregulation_report=()
STATEMENT_UPREGULATION () {
COUNTER=1
while read line; do
  chromosome=$(echo "$line" | awk '{print $1}')
  q_start=$(echo "$line" | awk '{print $2}')
  q_end=$(echo "$line" | awk '{print $3 }')
SQL_upregulation_report[$COUNTER]=$(
cat << EOF
SELECT
    Coverage.Gene,
    Coverage.Locus_tag,
    Coverage.Upregulation_or_loss,
    Coverage.Antibiotic_affected,
    Coverage.Known_combination,
	Coverage.Comments
FROM
    Coverage
WHERE
    Coverage.Chromosome = '$chromosome'
    AND Coverage.Start_coords > '$q_start'
    AND Coverage.End_coords < '$q_end'
    AND Coverage.Upregulation_or_loss LIKE 'Upregulation';
EOF
)

COUNTER=$((COUNTER+1))
done < <(tail -n +2 "$seq_path"/"$seq"/unique/duplication_summary.txt)
UPREG_COUNT="$COUNTER"
}

declare -A SQL_loss_func=()
STATEMENT_GENE_LOSS_FUNC () {
COUNTER=1
while read line; do 
gene=$(echo "$line" | awk '{print $1}')
#variant=$(echo $line | awk '{print $2 }')
SQL_loss_func[$COUNTER]=$(
cat << EOF
SELECT
    Coverage.Gene,
    Coverage.Locus_tag,
    Coverage.Upregulation_or_loss,
    Coverage.Antibiotic_affected,
    Coverage.Known_combination,
	Coverage.Comments
FROM
    Coverage
WHERE
    Coverage.Gene = '$gene';
EOF
)

COUNTER=$((COUNTER+1))
done < "$seq_path"/"$seq"/unique/annotated/Function_lost_list.txt
LOSS_FUNC_COUNT="$COUNTER"
}



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

if [ "$mixtures" = no ]; then
	echo -e "Creating loss statements\n"
	STATEMENT_GENE_LOSS_COV
	echo -e "Creating upregulation statements\n"
	STATEMENT_UPREGULATION
fi
if [ "$mixtures" = yes ]; then
	echo "Creating loss statements for mixtures"
	STATEMENT_GENE_LOSS_COV_MIX
	echo -e "Creating upregulation statements\n"
	STATEMENT_UPREGULATION_MIX
fi

#statement is identical with/without mixtures
STATEMENT_GENE_LOSS_FUNC 

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
	if [ "$mixtures" = no ]; then
		echo "Running duplication detection queries"
		for (( i=1; i<"$UPREG_COUNT"; i++ )); do $SQLITE "$RESISTANCE_DB" "${SQL_upregulation_report[$i]}" >> "$seq_path"/"$seq"/unique/AbR_output.txt; done
		echo "done"
		echo "Running loss of coverage queries"
		for (( i=1; i<"$LOSS_COUNT"; i++ )); do $SQLITE "$RESISTANCE_DB" "${SQL_loss_report[$i]}" >> "$seq_path"/"$seq"/unique/AbR_output.txt; done
		echo "done"
		echo "Running detection of functional loss queries"
		for (( i=1; i<"$LOSS_FUNC_COUNT"; i++ )); do $SQLITE "$RESISTANCE_DB" "${SQL_loss_func[$i]}" >> "$seq_path"/"$seq"/unique/AbR_output.txt; done
		echo "done"
	fi
	if [ "$mixtures" = yes ]; then
		if [ -s "$seq_path"/"$seq"/unique/output.temp ]; then
			rm "$seq_path"/"$seq"/unique/output.temp
		fi
		echo "Running duplication detection queries"
		#todo include upregulation and gene loss in mixture analysis
		for (( i=1; i<"$UPREG_COUNT"; i++ )); do 
			$SQLITE "$RESISTANCE_DB" "${SQL_upregulation_report_mix[$i]}" | tee "$seq_path"/"$seq"/unique/output.temp >> "$seq_path"/"$seq"/unique/AbR_output.txt
			if [ -s "$seq_path"/"$seq"/unique/output.temp ]; then
				echo "Found upregulation mechanism. Determining mixture percent"
				depth=$(awk -v i="$i" 'FNR==i' "$seq_path"/"$seq"/unique/duplication_summary_mix.txt | awk '{ print $5 }' )
				echo "$depth"
				mutant_depth=$(awk -v i="$i" 'FNR==i' "$seq_path"/"$seq"/unique/duplication_summary_mix.txt | awk '{ print $4 }' )
				echo "$mutant_depth"
				mixture_percent=$(echo "scale=2; $mutant_depth/$depth*100" | bc -l)
				echo "$mixture_percent"
				mixture_percent="$mixture_percent"%
				sed -i '$ d' "$seq_path"/"$seq"/unique/AbR_output.txt
				echo "$mixture_percent" | paste "$seq_path"/"$seq"/unique/output.temp - >> "$seq_path"/"$seq"/unique/AbR_output.txt
			fi
		done
		echo "done"
		echo "Running loss of coverage queries"
		for (( i=1; i<"$LOSS_COUNT"; i++ )); do 
			$SQLITE "$RESISTANCE_DB" "${SQL_loss_report_mix[$i]}" | tee "$seq_path"/"$seq"/unique/output.temp >> "$seq_path"/"$seq"/unique/AbR_output.txt
			if [ -s "$seq_path"/"$seq"/unique/output.temp ]; then
				echo "Found deletion mechanism. Determining mixture percent"
				echo "Mechanism on line $i"
				depth=$(awk -v i="$i" 'FNR==i' "$seq_path"/"$seq"/unique/deletion_summary_mix.txt | awk '{ print $5 }' )
				echo "$depth"
				mutant_depth=$(awk -v i="$i" 'FNR==i' "$seq_path"/"$seq"/unique/deletion_summary_mix.txt | awk '{ print $4 }' )
				echo "$mutant_depth"
				mixture_percent=$(echo "scale=2; $mutant_depth/$depth*100" | bc -l)
				echo "$mixture_percent"
				mixture_percent="$mixture_percent"%
				sed -i '$ d' "$seq_path"/"$seq"/unique/AbR_output.txt
				echo "$mixture_percent" | paste "$seq_path"/"$seq"/unique/output.temp - >> "$seq_path"/"$seq"/unique/AbR_output.txt
			fi
		done
		echo "done"
		echo -e "Looking for loss of function mutations and potential mixtures"
		for (( i=1; i<"$LOSS_FUNC_COUNT"; i++ )); do
			$SQLITE "$RESISTANCE_DB" "${SQL_loss_func[$i]}" | tee "$seq_path"/"$seq"/unique/output.temp >> "$seq_path"/"$seq"/unique/AbR_output.txt
			if [ -s "$seq_path"/"$seq"/unique/output.temp ]; then
				depth=$(awk -v i="$i" 'FNR==i' "$seq_path"/"$seq"/unique/annotated/Function_lost_list.txt | awk '{ print $7 }' )
				mutant_depth=$(awk -v i="$i" 'FNR==i' "$seq_path"/"$seq"/unique/annotated/Function_lost_list.txt | awk '{ print $6 }' | awk -F"," '{ print $2 }' )
				mixture_percent=$(echo "scale=2; $mutant_depth/$depth*100" | bc -l)
				mixture_percent="$mixture_percent"%
				sed -i '$ d' "$seq_path"/"$seq"/unique/AbR_output.txt
				echo "$mixture_percent" | paste "$seq_path"/"$seq"/unique/output.temp - >> "$seq_path"/"$seq"/unique/AbR_output.txt
			fi
		done
		echo "done"
	fi	
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

if [ "$mixtures" = no ]; then
	if [ -s "$seq_path"/"$seq"/unique/annotated/annotated.snp.effects.subset ]; then
		rm "$seq_path"/"$seq"/unique/annotated/annotated.snp.effects.subset
	fi
	if [ -s "$seq_path"/"$seq"/unique/annotated/annotated.indel.effects.subset ]; then
		rm "$seq_path"/"$seq"/unique/annotated/annotated.indel.effects.subset
	fi
	while read f; do 
	  grep "$f" "$seq_path"/"$seq"/unique/annotated/annotated.snp.effects >> "$seq_path"/"$seq"/unique/annotated/annotated.snp.effects.subset
	done < "$seq_path"/"$seq"/unique/SNP_gene_list.txt
	while read f; do 
	  grep "$f" "$seq_path"/"$seq"/unique/annotated/annotated.indel.effects >> "$seq_path"/"$seq"/unique/annotated/annotated.indel.effects.subset
	done < "$seq_path"/"$seq"/unique/SNP_gene_list.txt
	
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
	done < "$seq_path"/"$seq"/unique/annotated/annotated.snp.effects.subset
	SNP_COUNT="$COUNTER"
	}

	declare -A SQL_indel_report=()
	STATEMENT_INDELS () {
	COUNTER=1
	while read line; do 
	gene=$(echo "$line" | awk '{print $1}')
	#echo $gene
	variant=$(echo "$line" | awk '{print $3 }')
	#echo $variant
	SQL_indel_report[$COUNTER]=$(
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
	AND Variants_SNP_indel.Variant_annotation = '$variant';
EOF
	)
		
	COUNTER=$((COUNTER+1))
	done < "$seq_path"/"$seq"/unique/annotated/annotated.indel.effects.subset
	INDEL_COUNT="$COUNTER"
	}

fi

if [ "$mixtures" = yes ]; then
	while read f; do 
	  grep "$f" "$seq_path"/"$seq"/unique/annotated/annotated.ALL.effects >> "$seq_path"/"$seq"/unique/annotated/annotated.ALL.effects.subset
	done < "$seq_path"/"$seq"/unique/SNP_gene_list.txt

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
	done < "$seq_path"/"$seq"/unique/annotated/annotated.ALL.effects.subset
	SNP_COUNT="$COUNTER"
	}
fi

	#run functions
echo -e "Creating SNP statements\n"
STATEMENT_SNPS

if [ "$mixtures" = yes ]; then
	if [ -s "$seq_path"/"$seq"/unique/output.temp ]; then
		rm "$seq_path"/"$seq"/unique/output.temp
	fi
	for (( i=1; i<"$SNP_COUNT"; i++ )); do 
		"$SQLITE" "$RESISTANCE_DB" "${SQL_SNP_report[$i]}" | tee "$seq_path"/"$seq"/unique/output.temp >> "$seq_path"/"$seq"/unique/AbR_output.txt
		if [ -s "$seq_path"/"$seq"/unique/output.temp ]; then
			#copy the mixture information that was just found to the output
			echo "Format out command here"
			depth=$(awk -v i="$i" 'FNR==i' "$seq_path"/"$seq"/unique/annotated/annotated.ALL.effects.subset | awk '{ print $7 }' )
			mutant_depth=$(awk -v i="$i" 'FNR==i' "$seq_path"/"$seq"/unique/annotated/annotated.ALL.effects.subset | awk '{ print $6 }' | awk -F"," '{ print $2 }' )
			mixture_percent=$(echo "scale=2; $mutant_depth/$depth*100" | bc -l)
			mixture_percent="$mixture_percent"%
			sed -i '$ d' "$seq_path"/"$seq"/unique/AbR_output.txt
			echo "$mixture_percent" | paste "$seq_path"/"$seq"/unique/output.temp - >> "$seq_path"/"$seq"/unique/AbR_output.txt
		fi
	done
fi

if [ "$mixtures" = no ]; then
	echo "Running SNP detection queries"
	for (( i=1; i<"$SNP_COUNT"; i++ )); do "$SQLITE" "$RESISTANCE_DB" "${SQL_SNP_report[$i]}" >> "$seq_path"/"$seq"/unique/AbR_output.txt; done
	echo "done"
	echo "Creating indel statements"
	STATEMENT_INDELS
	echo -e "Running indel detection queries"
	for (( i=1; i<"$INDEL_COUNT"; i++ )); do "$SQLITE" "$RESISTANCE_DB" "${SQL_indel_report[$i]}" >> "$seq_path"/"$seq"/unique/AbR_output.txt; done
	echo "done"
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