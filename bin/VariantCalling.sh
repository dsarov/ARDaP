#!/bin/bash


#Input files
#set id, file(perbase), file(depth) from coverageData

#Set variables
#strain id
id=$1
echo "id=$id"

#reference genome
reference=$2
echo "reference=$reference"

#baseDir for snpEff
baseDir=$3
echo "baseDir=$baseDir"

#annotation genome for snpeff
snpeff=$4
echo "snpEff=$snpeff"

fast=$5
echo "fast = $fast"


#import GATK filtering parameters
source ${baseDir}/configs/gatk_source.config

# threads for the GATK PairHMM step
cpus=${6:-1}
echo "cpus = $cpus"

# interval list built once per run by the MakeIntervals process
intervals=$7
echo "intervals = $intervals"

# HaplotypeCaller can be split into chunks that run at the same time (see below).
# hc_chunks = how many to ask for, mem_gb = memory of this job in GB
hc_chunks=${8:-1}
mem_gb=${9:-4}
case "$hc_chunks" in ''|*[!0-9]*) hc_chunks=1;; esac
case "$mem_gb" in ''|*[!0-9]*) mem_gb=4;; esac

# elapsed-time markers (they appear in the task log) so slow steps are easy to find
step () { echo "[timer] $1 at ${SECONDS}s"; }

# delly (inversions only) needs just the BAM, so it runs in the background while
# HaplotypeCaller and the filtering below run. Its results are used after the wait.
run_delly () {
delly call -t INV -q 5 -o ${id}.delly.bcf -g ${reference} ${id}.dedup.bam || echo "WARNING: delly call failed" >&2
bcftools view ${id}.delly.bcf > ${id}.delly.vcf
grep "#" ${id}.delly.vcf > delly.header
grep "<INV>" ${id}.delly.vcf > ${id}.delly.inv.vcf
grep -v "LowQual" ${id}.delly.inv.vcf > ${id}.delly.inv.vcf.tmp
cat delly.header ${id}.delly.inv.vcf.tmp > ${id}.delly.inv.vcf

snpEff eff -no-downstream -no-intergenic -ud 100 -v -dataDir ${baseDir}/resources/snpeff ${snpeff} ${id}.delly.inv.vcf > ${id}.delly.inv.annotated.vcf

if [ -s ${id}.delly.inv.vcf.tmp ]; then
  bcftools query -f '%CHROM %POS[\t%GT\t%GL]\n' ${id}.delly.inv.vcf > likelihoods.delly
  while read line; do
    echo "$line" > line.desc;
    awk '{print $4}' line.desc > geno.likelihoods;
    genotype_RR=$(awk -F"," '{print $1}' geno.likelihoods);
    genotype_RA=$(awk -F"," '{print $2}' geno.likelihoods);
    genotype_AA=$(awk -F"," '{print $3}' geno.likelihoods);
    genotype=$(awk '{print $3}' line.desc);
    if [ "$genotype" == "0/1"  ]; then
      if [ "$genotype_RR" == 0 ]; then
      echo "Genotype ignored";
      fi;
    if [ "$genotype_AA" == 0 ]; then
      echo "Genotype included";
      chromosome=$(awk '{print $1}' line.desc);
      location=$(awk '{print $2}' line.desc);
      echo -e "$chromosome\t$location" >> filtered.inversions;
    fi;
    if [ "$genotype_RA" == 0 ]; then
      alt_ref_check=0;
      alt_ref_check=$(awk -v a="$genotype_RR" -v b="$genotype_AA" 'BEGIN {if (a < b) {print "1" }}');
      if [ "$alt_ref_check" == 1 ]; then
        echo "calculating log likelihood";
        log_genotype_AA=$(awk -v a="$genotype_AA" 'BEGIN {print (10^a)}');
        log_genotype_RA=$(awk -v a="$genotype_RA" 'BEGIN {print (10^a)}');
        log_genotype_RR=$(awk -v a="$genotype_RR" 'BEGIN {print (10^a)}');
        sum_AA_RR=$(awk -v a="$log_genotype_AA" -v b="$log_genotype_RR" 'BEGIN {print (a+b)}' );
        likelihood_ratio=$(awk -v a="$log_genotype_RA" -v b="$sum_AA_RR" 'BEGIN {print (a/b)}');
        echo -e "$log_genotype_AA\t$log_genotype_RA\t$log_genotype_RR" >> likelihood.ratios.2
        echo -e "$likelihood_ratio\n" >> likelihood.ratios.2
        likelihood_ratio_test=$(awk -v a="$likelihood_ratio" 'BEGIN {if (a < 100000) {print "1" }}')
        if [ "$likelihood_ratio_test" == 1 ]; then
          echo "changing genotype to 1/1";
          chromosome=$(awk '{print $1}' line.desc);
          location=$(awk '{print $2}' line.desc);
          echo -e "$chromosome\t$location" >> filtered.inversions;
        else
          echo "Ignoring variant due to poor quality"
        fi;
	  else
	    echo "Ignoring variant due to likely reference allele"
      fi;
    fi;
  fi;
  if [ "$genotype" == "1/1"  ]; then
    echo "Genotype included";
    chromosome=$(awk '{print $1}' line.desc);
    location=$(awk '{print $2}' line.desc);
    echo -e "$chromosome\t$location" >> filtered.inversions;
  fi;
  done < likelihoods.delly
fi;
}
run_delly > delly.log 2>&1 &
delly_pid=$!

# Number of HaplotypeCaller runs at the same time. Every run needs about 1.5 GB (JVM heap plus
# native memory) and at least one CPU, so the number is capped by the job's CPUs and memory.
nchunks=$hc_chunks
[ "$nchunks" -gt "$cpus" ] && nchunks=$cpus
max_by_mem=$(( (mem_gb - 1) * 2 / 3 ))
[ "$nchunks" -gt "$max_by_mem" ] && nchunks=$max_by_mem
[ "$nchunks" -lt 1 ] && nchunks=1
echo "HaplotypeCaller chunks = $nchunks (asked for $hc_chunks, cpus $cpus, memory ${mem_gb} GB)"

if [ "$fast" == "true" ] && [ ! -s "$intervals" ]; then
  echo "ERROR: fast mode needs an interval list but '$intervals' is missing or empty" >&2
  exit 1
fi

if [ "$nchunks" -le 1 ]; then
  if [ "$fast" == "true" ]; then
    gatk HaplotypeCaller -R ${reference} --ploidy 1 --native-pair-hmm-threads $cpus --I ${id}.dedup.bam -O ${id}.raw.snps.indels.vcf -L ${intervals} --interval-padding 200
  else
    gatk HaplotypeCaller -R ${reference} --ploidy 1 --native-pair-hmm-threads $cpus --I ${id}.dedup.bam -O ${id}.raw.snps.indels.vcf
  fi
else
  rm -f chunk_*.list hc_chunk_*
  if [ "$fast" == "true" ]; then
    # The regions GATK would walk with --interval-padding 200: each interval padded, then
    # overlapping or touching ones merged. Regions are independent of each other, so handing
    # whole regions to different chunks gives the same calls as one run.
    awk -F'\t' 'NR==FNR {len[$1]=$2; ord[$1]=NR; next}
      $0=="" {next}
      { split($0,a,":"); split(a[2],b,"-"); c=a[1]
        if (!(c in len)) { print "WARNING: interval on unknown contig " c " skipped" > "/dev/stderr"; next }
        s=b[1]-200; e=b[2]+200; if (s<1) s=1; if (e>len[c]) e=len[c]
        print ord[c] "\t" c "\t" s "\t" e }' ${reference}.fai ${intervals} \
      | sort -k1,1n -k3,3n \
      | awk -F'\t' -v OFS='\t' '{ if (c==$2 && $3<=e+1) { if ($4>e) e=$4 } else { if (c!="") print c,s,e; c=$2; s=$3; e=$4 } }
          END { if (c!="") print c,s,e }' > hc_segments.txt
    split_inside=0
  else
    # whole genome: every contig, cut into equal pieces at chunk boundaries
    awk -F'\t' -v OFS='\t' '{print $1,1,$2}' ${reference}.fai > hc_segments.txt
    split_inside=1
  fi
  awk -F'\t' -v n=$nchunks -v split_inside=$split_inside '
    { c[NR]=$1; s[NR]=$2; e[NR]=$3; total+=$3-$2+1 }
    END {
      target=total/n; k=1; filled=0
      for (i=1; i<=NR; i++) {
        cs=s[i]
        while (1) {
          len=e[i]-cs+1
          room=int(target*k+0.5)-filled
          if (k==n || !split_inside || len<=room) {
            print c[i] ":" cs "-" e[i] > ("chunk_" k ".list"); filled+=len
            if (!split_inside) while (k<n && filled>=target*k) k++
            break
          }
          if (room<1) { k++; continue }
          print c[i] ":" cs "-" (cs+room-1) > ("chunk_" k ".list")
          filled+=room; cs+=room; k++
        }
      }
    }' hc_segments.txt

  threads=$(( cpus / nchunks )); [ "$threads" -lt 1 ] && threads=1
  heap_mb=$(( (mem_gb - 1) * 1024 / nchunks - 512 )); [ "$heap_mb" -lt 768 ] && heap_mb=768
  echo "HaplotypeCaller: $nchunks chunks, $threads PairHMM thread(s) and a ${heap_mb} MB heap each"
  pids=(); merge_args=()
  for i in $(seq 1 $nchunks); do
    [ -s chunk_$i.list ] || continue
    gatk --java-options "-Xmx${heap_mb}m" HaplotypeCaller -R ${reference} --ploidy 1 --native-pair-hmm-threads $threads --I ${id}.dedup.bam -O hc_chunk_$i.vcf -L chunk_$i.list > hc_chunk_$i.log 2>&1 &
    pids+=($!)
    merge_args+=(-I hc_chunk_$i.vcf)
  done
  hc_failed=0
  for pid in "${pids[@]}"; do wait $pid || hc_failed=1; done
  cat hc_chunk_*.log
  if [ "$hc_failed" -ne 0 ]; then
    echo "ERROR: a HaplotypeCaller chunk failed, see the log above" >&2
    exit 1
  fi
  gatk MergeVcfs "${merge_args[@]}" -O ${id}.raw.snps.indels.vcf || { echo "ERROR: MergeVcfs failed" >&2; exit 1; }
fi


step "HaplotypeCaller finished"
gatk SelectVariants -R ${reference} -V ${id}.raw.snps.indels.vcf -O ${id}.raw.snps.vcf -select-type SNP
gatk SelectVariants -R ${reference} -V ${id}.raw.snps.indels.vcf -O ${id}.raw.indels.vcf -select-type INDEL

step "SelectVariants finished"
gatk VariantFiltration -R ${reference} -O ${id}.filtered.snps.vcf -V ${id}.raw.snps.vcf \
-filter "MLEAF < ${MLEAF_SNP}" --filter-name "AFFilter" \
-filter "QD < ${QD_SNP}" --filter-name "QDFilter" \
-filter "MQ < ${MQ_SNP}" --filter-name "MQFilter" \
-filter "FS > ${FS_SNP}" --filter-name "FSFilter" \
-filter "QUAL < ${QUAL_SNP}" --filter-name "StandardFilters"

header=`grep -a -n "#CHROM" ${id}.filtered.snps.vcf | cut -d':' -f 1`
head -n $header ${id}.filtered.snps.vcf > snp_head
cat ${id}.filtered.snps.vcf | grep PASS | cat snp_head - > ${id}.PASS.snps.vcf

gatk VariantFiltration -R ${reference} -O ${id}.failed.snps.vcf -V ${id}.raw.snps.vcf \
-filter "MLEAF < ${MLEAF_SNP}" --filter-name "FAIL" \
-filter "QD < ${QD_SNP}" --filter-name "FAIL1" \
-filter "MQ < ${MQ_SNP}" --filter-name "FAIL2" \
-filter "FS > ${FS_SNP}" --filter-name "FAIL3" \
-filter "QUAL < ${QUAL_SNP}" --filter-name "FAIL5"

header=`grep -a -n "#CHROM" ${id}.failed.snps.vcf | cut -d':' -f 1`
head -n $header ${id}.failed.snps.vcf > snp_head
cat ${id}.failed.snps.vcf | grep FAIL | cat snp_head - > ${id}.FAIL.snps.vcf

gatk VariantFiltration -R ${reference} -O ${id}.filtered.indels.vcf -V ${id}.raw.indels.vcf \
-filter "MLEAF < ${MLEAF_INDEL}" --filter-name "AFFilter" \
-filter "QD < ${QD_INDEL}" --filter-name "QDFilter" \
-filter "FS > ${FS_INDEL}" --filter-name "FSFilter" \
-filter "QUAL < ${QUAL_INDEL}" --filter-name "QualFilter"

header=`grep -a -n "#CHROM" ${id}.filtered.indels.vcf | cut -d':' -f 1`
head -n $header ${id}.filtered.indels.vcf > snp_head
cat ${id}.filtered.indels.vcf | grep PASS | cat snp_head - > ${id}.PASS.indels.vcf

gatk VariantFiltration -R  ${reference} -O ${id}.failed.indels.vcf -V ${id}.raw.indels.vcf \
-filter "MLEAF < ${MLEAF_INDEL}" --filter-name "FAIL" \
-filter "MQ < ${MQ_INDEL}" --filter-name "FAIL1" \
-filter "QD < ${QD_INDEL}" --filter-name "FAIL2" \
-filter "FS > ${FS_INDEL}" --filter-name "FAIL3" \
-filter "QUAL < ${QUAL_INDEL}" --filter-name "FAIL5"

header=`grep -a -n "#CHROM" ${id}.failed.indels.vcf | cut -d':' -f 1`
head -n $header ${id}.failed.indels.vcf > indel_head
cat ${id}.failed.indels.vcf | grep FAIL | cat indel_head - > ${id}.FAIL.indels.vcf

step "SNP and indel filtering finished"
snpEff eff -nodownload -no-downstream -no-intergenic -ud 100 -v -dataDir ${baseDir}/resources/snpeff ${snpeff} ${id}.PASS.snps.vcf > ${id}.PASS.snps.annotated.vcf

snpEff eff -nodownload -no-downstream -no-intergenic -ud 100 -v -dataDir ${baseDir}/resources/snpeff ${snpeff} ${id}.PASS.indels.vcf > ${id}.PASS.indels.annotated.vcf

step "snpEff annotation finished"
echo "Calculating duplication and deletion events"

echo -e "Chromosome\tStart\tEnd\tInterval" > tmp.header
zcat output.per-base.bed.gz | awk '$4 ~ /^0/ { print $1,$2,$3,$3-$2 }' > del.summary.tmp
cat tmp.header del.summary.tmp > ${id}.deletion_summary.txt

covdep=$(head -n 1 ${id}.depth.txt)
DUP_CUTOFF=$(echo $covdep*3 | bc)
echo "dup cutoff is $DUP_CUTOFF"

zcat output.per-base.bed.gz | awk -v DUP_CUTOFF="$DUP_CUTOFF" '$4 >= DUP_CUTOFF { print $1,$2,$3,$3-$2 }' > dup.summary.tmp

i=$(head -n1 dup.summary.tmp | awk '{ print $2 }')
k=$(tail -n1 dup.summary.tmp | awk '{ print $3 }')
chr=$(head -n1 dup.summary.tmp | awk '{ print $1 }')

awk -v i="$i" -v k="$k" -v chr="$chr" 'BEGIN {printf "chromosome " chr " start " i " "; j=i} {if (i==$2 || i==$2-1 || i==$2-2 ) {
i=$3;
}
else {
  print "end "i " interval " i-j;
  j=$2;
  i=$3;
  printf "chromosome " $1 " start "j " ";
}} END {print "end "k " interval "k-j}' < dup.summary.tmp > dup.summary.tmp1

sed -i 's/chromosome\|start \|end \|interval //g' dup.summary.tmp1
echo -e "Chromosome\tStart\tEnd\tInterval" > dup.summary.tmp.header
cat dup.summary.tmp.header dup.summary.tmp1 > ${id}.duplication_summary.txt

awk '{
  if (match($0,"ANN=")){print substr($0,RSTART)}
  }' ${id}.PASS.indels.annotated.vcf > indel.effects.tmp

awk -F "|" '{ print $4,$10,$11,$15 }' indel.effects.tmp | sed 's/c\.//' | sed 's/p\.//' | sed 's/n\.//'> ${id}.annotated.indel.effects

awk '{
  if (match($0,"ANN=")){print substr($0,RSTART)}
  }' ${id}.PASS.snps.annotated.vcf > snp.effects.tmp
awk -F "|" '{ print $4,$10,$11,$15 }' snp.effects.tmp | sed 's/c\.//' | sed 's/p\.//' | sed 's/n\.//' > ${id}.annotated.snp.effects

step "coverage and effect summaries finished"
echo 'Identifying high consequence mutations'

grep 'HIGH' snp.effects.tmp  | awk -F"|" '{ print $4,$11 }' >> ${id}.Function_lost_list.txt
grep 'HIGH' indel.effects.tmp | awk -F"|" '{ print $4,$11 }' >> ${id}.Function_lost_list.txt

sed -i 's/p\.//' ${id}.Function_lost_list.txt

# --- collect the delly branch that has been running in the background
wait $delly_pid || echo "WARNING: the delly branch exited with an error, see delly.log" >&2
cat delly.log
step "delly branch collected"

if [ -s filtered.inversions ]; then
  while read line; do grep -w "$line" ${id}.delly.inv.annotated.vcf >> ${id}.delly.inv.annotated.vcf.tmp ; done < filtered.inversions
  cat delly.header ${id}.delly.inv.annotated.vcf.tmp > ${id}.delly.inv.annotated.vcf
  awk -F"|" '/HIGH/ {f=NR} f&&NR-1==f' RS="|" ${id}.delly.inv.annotated.vcf > delly.tmp
  sed -i '/^\s*$/d' delly.tmp
  cat delly.tmp ${id}.Function_lost_list.txt > ${id}.Function_lost_list.txt.tmp
  mv ${id}.Function_lost_list.txt.tmp ${id}.Function_lost_list.txt
fi;
step "VariantCalling.sh finished"