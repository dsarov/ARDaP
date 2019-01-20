CARD Download README

Use or reproduction of these materials, in whole or in part, by any non-academic 
organization whether or not for non-commercial (including research) or commercial purposes
is prohibited, except with written permission of McMaster University. Commercial uses are
offered only pursuant to a written license and user fee. To obtain permission and begin 
the licensing process, see http://card.mcmaster.ca/about.

FASTA:

Nucleotide and corresponding protein FASTA downloads are available as separate files for 
each model type.  For example, the "protein homolog" model type contains sequences of
antimicrobial resistance genes that do not include mutation as a determinant of resistance
- these data are appropriate for BLAST analysis of metagenomic data or searches excluding 
secondary screening for resistance mutations. In contrast, the "protein variant" model 
includes reference wild type sequences used for mapping SNPs conferring antimicrobial 
resistance - without secondary mutation screening, analyses using these data will include 
false positives for antibiotic resistant gene variants or mutants.

MODELS:

The file "card.json" contains the complete data for all of CARD's AMR detection models, 
including reference sequences, SNP mapping data, model parameters, and ARO classification.
"card.json" is used by the Resistance Gene Identifier software.

INDEX FILES:

The file "aro_index.csv" contains a list of ARO tagging of GenBank accessions stored in 
CARD.

The file "aro_categories.csv" contains a list of ARO terms used to categorize all entries
in CARD and results via the RGI. These categories reflect AMR gene family, target drug 
class, and mechanism of resistance.

The file "aro_categories_index.csv" contains a list a GenBank accessions stored 
in CARD cross-referenced with the major categories within the ARO. These categories 
reflect AMR gene family, target drug class, and mechanism of resistance, so GenBank 
accessions may have more than one cross-reference. For more complex categorization of 
the data, use the full ARO available at http://card.mcmaster.ca/download.

The file "snps.txt" lists the SNPs associated with specific detection models.
