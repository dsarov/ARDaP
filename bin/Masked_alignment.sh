#!/bin/bash

cpus=$1
echo "task.cpus=$cpus"

forward=$2
echo "forward=$forward"

reverse=$3
echo "reverse=$reverse"

id=$4
echo "id=$id"

#baseDir for snpEff
baseDir=$5
echo "baseDir=$baseDir"

#annotation genome for snpeff
snpeff=$6
echo "snpEff=$snpeff"

#create interval list
cat << _EOF_ > interval.coverage.query.txt
SELECT 
	Coverage.Gene
FROM 
	Coverage
_EOF_

cat << _EOF_ > interval.query.txt
SELECT 
	Variants_SNP_indel.Gene_name
FROM 
	Variants_SNP_indel
_EOF_

sqlite3 ${baseDir}/Databases/${snpeff}/${snpeff}.db < interval.query.txt > gene.list
sqlite3 ${baseDir}/Databases/${snpeff}/${snpeff}.db < interval.coverage.query.txt > gene.list2
  
cat gene.list gene.list2 interval.coverage.query.txt > gene.list.tmp
mv gene.list.tmp gene.list 

#create interval file

uniq gene.list > gene.list.tmp
mv gene.list.tmp gene.list
snpEff genes2bed ${snpeff} -dataDir ${baseDir}/resources/snpeff -f gene.list > intervals.list
sed -i 's/\t/:/' intervals.list
sed -i 's/\t/-/' intervals.list
awk '{print $1}' intervals.list | tail -n+2 > intervals.list.tmp
mv intervals.list.tmp intervals.list

#bedtools maskfasta -fi ref.fasta -bed intervals.list -fo ref.intervals

#mv ref.intervals ref.fasta

bwa mem -R '@RG\tID:${params.org}\tSM:${id}\tPL:ILLUMINA' -a -t $cpus ref ${forward} ${reverse} > ${id}.sam
samtools view -h -b -@ 1 -q 1 -o ${id}.bam_tmp ${id}.sam
samtools sort -@ 1 -o ${id}.bam ${id}.bam_tmp
samtools index ${id}.bam
rm ${id}.sam ${id}.bam_tmp