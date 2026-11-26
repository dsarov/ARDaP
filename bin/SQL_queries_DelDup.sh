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
	Variants_SNP_indel.Antibiotic_affected LIKE '%none%';
_EOF_

sqlite3 "$RESISTANCE_DB" < Variant_ignore_Q.txt >> Variant_ignore.txt;

sed -i 's/|/ /g' Variant_ignore.txt 

while read f; do 
	grep -vw "$f" ${seq}.Function_lost_list.txt > ${seq}.Function_lost_list.txt.tmp
	mv ${seq}.Function_lost_list.txt.tmp ${seq}.Function_lost_list.txt
done < Variant_ignore.txt


# ---------------------------------------------------------------------------
# Database lookups.
# Before: one sqlite3 process per coverage interval / lost gene, plus several
# awk/cat processes per line just to build each statement.
# Now: ONE sqlite3 session with temporary tables and joins. Output order is
# unchanged: duplications, then losses of coverage, then functional losses; in
# file order, with matching rows in table order for each line.
# Comparisons use untyped temp-table columns, so SQLite applies the same type
# rules as it did for the old quoted string literals.
# ---------------------------------------------------------------------------
make_coord_inserts () {   # $1 = temp table, $2 = summary file (header line is skipped)
	tail -n +2 "$2" | while read line; do printf '%s\n' "$line"; done | awk -v T="$1" -v Q="'" '
	function quote(s) { gsub(Q, Q Q, s); return Q s Q }
	{ printf "INSERT INTO %s VALUES(%d,%s,%s,%s);\n", T, NR, quote($1), quote($2), quote($3) }'
}

make_gene_inserts () {    # $1 = temp table, $2 = Function_lost_list file
	while read line; do printf '%s\n' "$line"; done < "$2" | awk -v T="$1" -v Q="'" '
	function quote(s) { gsub(Q, Q Q, s); return Q s Q }
	{ printf "INSERT INTO %s VALUES(%d,%s);\n", T, NR, quote($1) }'
}

echo "Running duplication, loss of coverage and functional loss queries"
{
	echo "BEGIN;"
	echo "CREATE TEMP TABLE up_q(n, chrom, s, e);"
	echo "CREATE TEMP TABLE loss_q(n, chrom, s, e);"
	echo "CREATE TEMP TABLE func_q(n, gene);"
	if [ -e ${seq}.duplication_summary.txt ]; then make_coord_inserts up_q ${seq}.duplication_summary.txt; fi
	if [ -e ${seq}.deletion_summary.txt ]; then make_coord_inserts loss_q ${seq}.deletion_summary.txt; fi
	if [ -e ${seq}.Function_lost_list.txt ]; then make_gene_inserts func_q ${seq}.Function_lost_list.txt; fi
	echo "COMMIT;"
	cat << 'SQL'
SELECT c.Gene, c.Locus_tag, c.Upregulation_or_loss, c.Antibiotic_affected, c.Threshold, c.Comments
FROM up_q q JOIN Coverage c
  ON c.Chromosome = q.chrom AND c.Start_coords > q.s AND c.End_coords < q.e
 AND c.Upregulation_or_loss LIKE 'Upregulation'
ORDER BY q.n, c.rowid;
SELECT c.Gene, c.Locus_tag, c.Upregulation_or_loss, c.Antibiotic_affected, c.Threshold, c.Comments
FROM loss_q q JOIN Coverage c
  ON c.Chromosome = q.chrom AND c.Start_coords < q.e AND c.End_coords > q.s
 AND c.Upregulation_or_loss LIKE 'Loss'
ORDER BY q.n, c.rowid;
SELECT c.Gene, c.Locus_tag, c.Upregulation_or_loss, c.Antibiotic_affected, c.Threshold, c.Comments
FROM func_q q JOIN Coverage c
  ON c.Gene = q.gene AND c.Upregulation_or_loss LIKE 'loss'
ORDER BY q.n, c.rowid;
SQL
} > ${seq}.del_dup_lookup.sql

if ! sqlite3 -bail "$RESISTANCE_DB" < ${seq}.del_dup_lookup.sql >> ${seq}.AbR_output_del_dup.txt; then
	echo "ERROR: the deletion/duplication database lookup failed" >&2
	exit 1
fi
echo "done"

#if [ ! -s ${seq}.AbR_output_del_dep.txt ]; then
#	echo "ARDaP found no deletions or duplications that cause antibiotic resistance" >> ${seq}.AbR_output_del_dep.txt
#fi

exit 0
