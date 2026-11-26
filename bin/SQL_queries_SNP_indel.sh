#!/bin/bash


seq=$1
RESISTANCE_DB=$2 

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
	grep "$f" ${seq}.annotated.snp.effects >> ${seq}.annotated.snp.effects.subset
done < SNP_gene_list.txt
while read f; do 
	grep "$f" ${seq}.annotated.indel.effects >> ${seq}.annotated.indel.effects.subset
done < SNP_gene_list.txt


# ---------------------------------------------------------------------------
# Database lookups.
# Before: one sqlite3 process per variant, plus several awk/cat processes per
# variant just to build each statement (thousands of process launches).
# Now: ONE sqlite3 session. Every variant is loaded into a temporary table and
# matched with a join. Output order is unchanged: variants in file order, and
# for each variant the matching rows in table order.
# Lines go through 'read' first so whitespace/backslash handling is the same as
# the old 'while read line' loops.
# ---------------------------------------------------------------------------
make_inserts () {   # $1 = temp table, $2 = effects file, $3 = snp | indel
	while read line; do printf '%s\n' "$line"; done < "$2" | awk -v T="$1" -v M="$3" -v Q="'" '
	function quote(s) { gsub(Q, Q Q, s); return Q s Q }
	{
		v1 = $3
		v2 = (M == "snp") ? $2 : $3
		printf "INSERT INTO %s VALUES(%d,%s,%s,%s);\n", T, NR, quote($1), quote(v1), quote(v2)
	}'
}

echo "Running SNP and indel detection queries"
{
	echo "BEGIN;"
	echo "CREATE TEMP TABLE snp_q(n, gene, v1, v2);"
	echo "CREATE TEMP TABLE indel_q(n, gene, v1, v2);"
	if [ -s ${seq}.annotated.snp.effects.subset ]; then make_inserts snp_q ${seq}.annotated.snp.effects.subset snp; fi
	if [ -s ${seq}.annotated.indel.effects.subset ]; then make_inserts indel_q ${seq}.annotated.indel.effects.subset indel; fi
	echo "COMMIT;"
	cat << 'SQL'
SELECT d.Gene_name, d.Locus_tag, d.Variant_annotation, d.Antibiotic_affected, d.Threshold, d.Comments
FROM snp_q q JOIN Variants_SNP_indel d
  ON d.Gene_name = q.gene AND (d.Variant_annotation = q.v1 OR d.Variant_annotation = q.v2)
ORDER BY q.n, d.rowid;
SELECT d.Gene_name, d.Locus_tag, d.Variant_annotation, d.Antibiotic_affected, d.Threshold, d.Comments
FROM indel_q q JOIN Variants_SNP_indel d
  ON d.Gene_name = q.gene AND d.Variant_annotation = q.v1
ORDER BY q.n, d.rowid;
SQL
} > ${seq}.snp_indel_lookup.sql

if ! sqlite3 -bail "$RESISTANCE_DB" < ${seq}.snp_indel_lookup.sql >> ${seq}.AbR_output_snp_indel.txt; then
	echo "ERROR: the SNP/indel database lookup failed" >&2
	exit 1
fi
echo "done"

#if [ ! -s ${seq}.AbR_output_snp_indel.txt ]; then
#	echo "ARDaP found no snps or indels that cause antibiotic resistance" >> ${seq}.AbR_output_snp_indel.txt
#fi

exit 0
