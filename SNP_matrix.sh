#!/bin/bash
#$ -S /bin/bash
#PBS -o logs/SNP_matrix.txt
#$ -cwd

#########################################################################
# The following script will convert SNP and/or indel calls into a nexus file and create a preliminary tree with Paup
# Additionally, the SNPs and/or indels are annotated with SnpEff
#
# Version 1.0
# Written by D. Sarovich
# dsarovich@usc.edu.au
#
#########################################################################

#source variables
source "$SCRIPTPATH"/ARDaP.config

if [ ! $PBS_O_WORKDIR ]
    then
        PBS_O_WORKDIR="$seq_path"
fi
 
cd $PBS_O_WORKDIR

log_eval()
{
  cd $1
  echo -e "\nIn $1\n"
  echo "Running: $2"
  eval "$2"
  status=$?

  if [ ! $status == 0 ]; then
    echo "Previous command returned error: $status"
    exit 1
  fi
}

if [ ! -s $PBS_O_WORKDIR/Phylo/out/out.vcf.table ]; then
  log_eval $PBS_O_WORKDIR/Phylo/out "$GATK VariantsToTable -V $PBS_O_WORKDIR/Phylo/out/out.filtered.vcf -F CHROM -F POS -F REF -F ALT -F TYPE -GF GT -O $PBS_O_WORKDIR/Phylo/out/out.vcf.table"
  log_eval $PBS_O_WORKDIR/Phylo/out "$GATK VariantsToTable -V $PBS_O_WORKDIR/Phylo/out/out.vcf -F CHROM -F POS -F REF -F ALT -F TYPE -GF GT -O $PBS_O_WORKDIR/Phylo/out/out.vcf.table.all"
  else 
    echo -e "out.vcf.table has already been created\n\n"
fi

###########################################################################
# Creates the SNP matrix for PAUP
############################################################################

if [ ! -s $PBS_O_WORKDIR/Outputs/Comparative/Ortho_SNP_matrix.nex ]; then
    cd $PBS_O_WORKDIR/Phylo/out/		
	grep 'SNP' out.vcf.table | grep -v ',' |grep -v '*' |grep -v '\.' > out.vcf.table.snps.clean
	taxa=$(cut -f3,6- out.vcf.table | head -n1 | sed 's/.GT//g') 
    ntaxa=$(awk '{print NF-4; exit }' out.vcf.table)
	nchar=$(cat out.vcf.table.snps.clean | wc -l)
	awk '{print $1,$2}' out.vcf.table.snps.clean | sed 's/ /_/g' > snp.location
	cut -f3,6- out.vcf.table.snps.clean >grid.nucleotide
	grid=$(paste snp.location grid.nucleotide)
	echo -e "\n#nexus\nbegin data;\ndimensions ntax=$ntaxa nchar=$nchar;\nformat symbols=\"AGCT\" gap=. transpose;\ntaxlabels $taxa;\nmatrix\n$grid\n;\nend;" > Ortho_SNP_matrix.nex
	cp $PBS_O_WORKDIR/Phylo/out/Ortho_SNP_matrix.nex $PBS_O_WORKDIR/Outputs/Comparative/Ortho_SNP_matrix.nex
fi

##run paup to create tree

if [ ! -s $PBS_O_WORKDIR/Outputs/Comparative/MP_phylogeny.tre -a "$ntaxa" -gt 4 ]; then
#PAUP block to be inserted into nexus file
cat <<_EOF_ > $PBS_O_WORKDIR/Phylo/out/tmpnex
begin paup;
Set AllowPunct=Yes;
lset nthreads=2;
hsearch;
savetrees from=1 to=1 brlens=yes;
_EOF_
  cat $PBS_O_WORKDIR/Outputs/Comparative/Ortho_SNP_matrix.nex $PBS_O_WORKDIR/Phylo/out/tmpnex > $PBS_O_WORKDIR/Phylo/out/run.nex
  $PAUP -n $PBS_O_WORKDIR/Phylo/out/run.nex >& $PBS_O_WORKDIR/logs/paup_log.txt
  mv $PBS_O_WORKDIR/Phylo/out/Ortho_SNP_matrix.tre $PBS_O_WORKDIR/Outputs/Comparative/MP_phylogeny.tre
fi

###############################################
##
## These steps will take the merged SNP outputs, annotate them and reformat the data into a tab delimited txt file for importation into excel
## output from these steps should be a tab delimited file
##
## Annotation of SNPs using snpEff
##
##################################################

if [ ! -s $PBS_O_WORKDIR/Output/Comparative/All_SNPs_indels_annotated.txt -a "$annotate" == yes ]; then
    if [ ! -d $PBS_O_WORKDIR/Phylo/annotated ]; then
	    mkdir $PBS_O_WORKDIR/Phylo/annotated
	fi
	cp $PBS_O_WORKDIR/Phylo/out/out.vcf $PBS_O_WORKDIR/Phylo/annotated/out.vcf
	cp $PBS_O_WORKDIR/Phylo/out/out.vcf.table.all $PBS_O_WORKDIR/Phylo/annotated/out.vcf.table.all
	cd $PBS_O_WORKDIR/Phylo/annotated
	
	#SnpEff version control. Versions post 4.1 use a slightly different format for variants
	
	SnpEff_version=`($JAVA $SET_VAR $SNPEFF -h 2>&1 | head -n1 |awk '{ print $4 }' | awk '{print substr($1,0,3)}' | bc)`
	if [ "$(echo $SnpEff_version '>=' 4.1 | bc -l)" -eq 1 ]; then
		
		echo -e "Version of snpEff is 4.1 or greater\n"
		echo -e "Version of SnpEff is $SnpEff_version"
		log_eval $PBS_O_WORKDIR/Phylo/annotated "$JAVA $SET_VAR $SNPEFF eff -no-downstream -no-intergenic -ud 100 -formatEff -v $variant_genome $PBS_O_WORKDIR/Phylo/annotated/out.vcf > $PBS_O_WORKDIR/Phylo/annotated/out.annotated.vcf"
	else
		echo -e "Version of snpEff is less than 4.1\n"
		log_eval $PBS_O_WORKDIR/Phylo/annotated "$JAVA $SET_VAR $SNPEFF eff -no-downstream -no-intergenic -ud 100 -v $variant_genome $PBS_O_WORKDIR/Phylo/annotated/out.vcf > $PBS_O_WORKDIR/Phylo/annotated/out.annotated.vcf"
	fi	
		
	rm snpEff_genes.txt
	rm snpEff_summary.html
		
	#remove headers from annotated vcf and out.vcf
	grep -v '#' out.annotated.vcf > out.annotated.vcf.headerless
	#grep -v '#' out.vcf > out.vcf.headerless
	awk '{
      if (match($0,"EFF=")){print substr($0,RSTART)}
     else
     print ""
     }' out.annotated.vcf.headerless > effects

	sed -i 's/EFF=//' effects
	sed -i 's/(/ /g' effects
	sed -i 's/|/ /g' effects
	sed -i 's/UPSTREAM MODIFIER /UPSTREAM MODIFIER - /g' effects
	cut -d " " -f -8 effects > effects.mrg
	sed -i 's/ /\t/g' effects.mrg
	rm effects
    
	tail -n+2 out.vcf.table.all > out.vcf.table.all.headerless
	paste out.vcf.table.all.headerless effects.mrg > out.vcf.headerless.plus.effects
	head -n1 out.vcf.table.all | sed 's/.GT//g' > header.left
	echo -e "Effect\tImpact\tFunctional_Class\tCodon_change\tProtein_and_nucleotide_change\tAmino_Acid_Length\tGene_name\tBiotype" > header.right
	paste header.left header.right > header
	cat header out.vcf.headerless.plus.effects > All_SNPs_indels_annotated.txt
	
	mv All_SNPs_indels_annotated.txt $PBS_O_WORKDIR/Outputs/Comparative/All_SNPs_indels_annotated.txt
	
fi	
	
skip () {	
	
	### out.pos.mrg ###	
	awk '{print $1, $2}' out.annotated.vcf.headerless > out.pos.mrg
	#merge the chromosome name and chromosome location into a single field
	sed -i 's/ /_/' out.pos.mrg

	
	### bases.raw ####
	##parse out base information
	awk '{print $4, $5 }' out.vcf.headerless > bases.raw
	sed -i 's/,/ /g' bases.raw
	sed -i 's/$/ N N/' bases.raw
	cut -d " " -f -4 bases.raw > bases.raw.parsed
	sed -i 's/ /\t/g' bases.raw.parsed
		
		
	#-------------------------------------
	# print just the SNP/genomic information column 10 until the end
	cut -f 10- out.vcf.headerless > out.snps.raw

	awk '{for (i=1; i<=NF; i++) { $i=(substr($i, 1, 3))}; print $0 }' out.snps.raw > out.snps.clean
	##remove blank lines at end of out.snps.clean

	#replace SNP information i.e. 1/1, 1/2 etc with 0123 matrix
	
	awk ' { for (i=1; i<=NF; i++) 
		{if ($i == "1/1") $i=2; 
		 if ($i == "./.") $i="."; 
		 if ($i == "0/0") $i=0; 
		 if ($i == "0/1") $i="?"; 
		 if ($i == "2/2") $i="3"; 
		 if ($i == "1/2") $i="?"; 
		 if ($i == "0/2") $i="?";
		 if ($i == "2/1") $i="?";
		 if ($i == "3/3") $i="4";
		 if ($i == "0/3") $i="?";
		 if ($i == "1/3") $i="?";
		 if ($i == "2/3") $i="?";
		 if ($i == "3/2") $i="?";	
		 if ($i == "3/1") $i="?"}}; 
		{print $0} ' out.snps.clean > out.matrix

	#add the reference SNP call to each line and remove spaces to create the 012.mrg for the final matrix
	sed -i -e 's/^/0 /' out.matrix
	sed 's/ //g' out.matrix > 012.mrg

	##convert to tab separated
	sed -i 's/ /\t/g' out.matrix
    # merge base calls and 012 matrix 
	
    paste -d "\t" bases.raw.parsed out.matrix > bases.tab
	
	#replace 012 matrix with base calls
	awk '  { for (i=4; i<=NF; i++) 
	       {if ($i == 0) $i=$1; 
		    if ($i == 2) $i=$2;
            if ($i == 3) $i=$3;			
			if ($i == 4) $i=$4 }}; {print $0} ' bases.tab > bases.tab.tmp
	
	## removes temp columns for final base call file
	cut -d " " -f 5- bases.tab.tmp > bases.mrg

	## paste all temp .mrg files into a headerless effects file
	paste -d " " out.pos.mrg bases.mrg 012.mrg effects.mrg > headerless.effects.mrg

	#creation of the header and merging of files

	echo -e "Location" >> location.mrg
	echo -e "Binary_code Effect Impact Functional_Class Codon_change Amino_Acid_change Amino_Acid_Length Gene_name Biotype" >> header.mrg
	paste -d " " location.mrg merge.012.indv.trans header.mrg > final.header.mrg
	cat final.header.mrg headerless.effects.mrg > All_SNPs_annotated.txt
	sed -i 's/ /\t/g' All_SNPs_annotated.txt
	
	cleanup () 
	{
	rm out.pos.mrg bases.mrg 012.mrg effects.mrg
	rm out.snps.raw out.snps.clean out.matrix bases.raw
	rm out.vcf.headerless out.annotated.vcf.headerless
	rm bases.tab.tmp #check bases.mrg.tmp here
	rm final.header.mrg header.mrg location.mrg headerless.effects.mrg
	rm out.vcf merge.012.indv.trans
	rm out.annotated.vcf
	}

	##run cleanup
	#cleanup
	
	}

echo "ARDaP has finished"

exit 0
