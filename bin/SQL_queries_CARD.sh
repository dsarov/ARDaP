#!/bin/bash

seq=$1
CARD_DB=$2
baseDir=$3

#CARD database queries
#subset on column 7, which is coverage stat (0 to 1). Filter based on 0.98 and 0.95

awk '{ if ( $7 > 0.97) print $0 }' "$seq".card.bedcov > "$seq"_98p.bedcov
awk '{ if ( $7 < 0.98 && $7 > 0.94 ) print $0 }' "$seq".card.bedcov > "$seq"_95p_to_98p.bedcov

#for each line in the bedcov files, lookup the aro database and report 2nd and third term

awk -F "|" ' { print $5 } ' "$seq"_98p.bedcov | while read f; do grep -w "$f" "$baseDir"/Databases/CARD/aro.csv >> "$seq"_98p.genes; done
 
awk -F "|" ' { print $5 } ' "$seq"_95p_to_98p.bedcov | while read f; do grep -w "$f" "$baseDir"/Databases/CARD/aro.csv >> "$seq"_95p_to_98p.genes; done

#test to see if CARD genes are in ignore list
CARD_IGNORE () {
COUNTER=1
while read line; do 
  ARO=$(echo "$line" | awk '{print $1}' | sed 's/ARO://g' )
  
cat << _EOF_ >  CARD_ignore_$COUNTER

SELECT
    CARD_ignore.ARO_ID
FROM
    CARD_ignore
WHERE
    CARD_ignore.ARO_ID = '$ARO';
_EOF_
COUNTER=$((COUNTER+1))
done < "$seq"_98p.genes
}

CARD_IGNORE

for f in CARD_ignore_*; do sqlite3 "$CARD_DB" < $f >> CARD_ignore_output.txt; done

while read line; do
  ARO=$(echo "$line" | awk '{print $1}' | sed 's/ARO://g' )
  grep -w "$ARO" CARD_ignore_output.txt
  status=$?
  if [ ! $status == 0 ]; then
    grep -w "$ARO" "$seq"_98p.genes >> CARD_no_ignore.txt
  fi
done < "$seq"_98p.genes

touch ${seq}.CARD_primary_output.txt

if [ -s CARD_no_ignore.txt ]; then
CARD_PRIMARY () {
COUNTER=1
while read line; do 
  ARO=$(echo "$line" | awk '{print $1}' | sed 's/ARO://g' )
  
cat << _EOF_ >  CARD_Primary_$COUNTER

SELECT
    CARD_Primary.ARO_ID,
	CARD_Primary.GeneName,
	CARD_Primary.GenusSpecies,
	CARD_Primary.Antibiotic_affected,
	CARD_Primary.Description
FROM
    CARD_Primary
WHERE
    CARD_Primary.ARO_ID = '$ARO';
_EOF_

COUNTER=$((COUNTER+1))
done < CARD_no_ignore.txt
}

CARD_PRIMARY

for f in CARD_Primary_*; do sqlite3 "$CARD_DB" < $f >> ${seq}.CARD_primary_output.txt; done

fi

exit 0
