#!/usr/bin/env python3
#
# Program: 	PointFinder-3.0
# Author: 	Camilla Hundahl Johnsen
#
# Dependencies: KMA or NCBI-blast together with BioPython.

import os
import re
import sys
import math
import argparse
import subprocess
import random

from cgecore.blaster import Blaster
from cgecore.cgefinder import CGEFinder
from .output.table import TableResults
from .phenotype2genotype.feature import ResMutation
from .phenotype2genotype.res_profile import PhenoDB


def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)


class GeneListError(Exception):
    """ Raise when a specified gene is not found within the gene list.
    """
    def __init__(self, message, *args):
        self.message = message
        # allow users initialize misc. arguments as any other builtin Error
        super(PanelNameError, self).__init__(message, *args)


class PointFinder(CGEFinder):

    def __init__(self, db_path, species, gene_list=None):
        """
        """
        self.species = species
        self.specie_path = db_path
        self.RNA_gene_list = []

        self.gene_list = PointFinder.get_file_content(
            self.specie_path + "/genes.txt")

        if os.path.isfile(self.specie_path + "/RNA_genes.txt"):
            self.RNA_gene_list = PointFinder.get_file_content(
                self.specie_path + "/RNA_genes.txt")

        # Creat user defined gene_list if given
        if(gene_list is not None):
            self.gene_list = get_user_defined_gene_list(gene_list)

        self.known_mutations, self.drug_genes, self.known_stop_codon = (
            self.get_db_mutations(self.specie_path + "/resistens-overview.txt",
                                  self.gene_list))

    def get_user_defined_gene_list(self, gene_list):
        genes_specified = []
        for gene in gene_list:
            # Check that the genes are valid
            if gene not in self.gene_list:
                raise(GeneListError(
                    "Input Error: Specified gene not recognised "
                    "(%s)\nChoose one or more of the following genes:"
                    "\n%s" % (gene, "\n".join(self.gene_list))))
            genes_specified.append(gene)
        # Change the gene_list to the user defined gene_list
        return genes_specified

    #DELETE
    def old_results_to_standard_output(self, result, software, version,
                                       run_date, run_cmd, id,
                                       unknown_mut=False, tableresults=None):
        """
        """
        std_results = TableResults(software, version, run_date, run_cmd, id)
        headers = [
            "template_name",
            "template_length",
            "aln_length",
            "aln_identity",
            "aln_gaps",
            "aln_template_string",
            "aln_query_string",
            "aln_homology_string",
            "query_id",
            "query_start_pos",
            "query_end_pos",
            "template_variant",
            "query_depth",
            "blast_eval",
            "blast_bitscore",
            "pval",
            "software_score",
            "mutation",
            "ref_codon",
            "alt_codon",
            "ref_aa",
            "alt_aa",
            "insertion",
            "deletion"
        ]
        for db_name, db in result.items():
            if(db_name == "excluded"):
                continue

            if(db == "No hit found"):
                continue

            ####Added to solve PointFinder####
            if(isinstance(db, str)):
                if db.startswith("Gene found with coverage"):
                    continue
            ####

            # Start writing output string (to HTML tab file)
            gene_name = PhenoDB.if_promoter_rename(db_name)

            # Find and save mis_matches in gene
            sbjct_start = db["sbjct_start"]
            sbjct_seq = db["sbjct_string"]
            qry_seq = db["query_string"]
            db["mis_matches"] = self.find_mismatches(gene=db_name,
                                                     sbjct_start=sbjct_start,
                                                     sbjct_seq=sbjct_seq,
                                                     qry_seq=qry_seq)

            known_muts = []
            unknown_muts = []
            if(len(db["mis_matches"]) > 0):
                known_muts, unknown_muts = self.get_mutations(
                    db_name, gene_name, db['mis_matches'], True, db)

            # No mutations found
            if(not (unknown_muts or known_muts)):
                continue

            std_results.add_table(db_name)
            std_db = std_results.long[db_name]
            std_db.add_headers(headers)
            std_db.lock_headers = True

            for mut in known_muts:
                unique_id = mut.unique_id
                std_db[unique_id] = {
                    "template_name": db_name,
                    "template_length": db["sbjct_length"],
                    "aln_length": db["HSP_length"],
                    "aln_identity": db["perc_ident"],
                    "aln_gaps": db["gaps"],
                    "aln_template_string": db["sbjct_string"],
                    "aln_query_string": db["query_string"],
                    "aln_homology_string": db["homo_string"],
                    "query_id": db["contig_name"],
                    "query_start_pos": mut.pos,
                    "query_end_pos": mut.end,
                    "query_depth": db.get("depth", "NA"),
                    "pval": db.get("p_value", "NA"),
                    "software_score": db["cal_score"],
                    "mutation": mut.mut_string_short,
                    "ref_codon": mut.ref_codon,
                    "alt_codon": mut.mut_codon,
                    "ref_aa": mut.ref_aa,
                    "alt_aa": mut.mut_aa,
                    "insertion": mut.insertion,
                    "deletion": mut.deletion
                }

        return std_results

    @staticmethod
    def get_db_names(db_root_path):
        out_lst = []
        for entry in os.scandir(db_root_path):
            if not entry.name.startswith('.') and entry.is_dir():
                out_lst.append(entry.name)
        return tuple(out_lst)

    def results_to_str(self, res_type, results, unknown_flag, min_cov,
                       perc_iden):
        # Initiate output stings with headers
        gene_list = ', '.join(self.gene_list)
        output_strings = [
            "Mutation\tNucleotide change\tAmino acid change\tResistance\tPMID",
            "Chromosomal point mutations - Results\nSpecies: %s\nGenes: %s\n"
            "Mapping methode: %s\n\n\nKnown Mutations\n" % (self.species, gene_list, res_type), ""
        ]
        # Get all drug names and add header of all drugs to prediction file
        drug_lst = [drug for drug in self.drug_genes.keys()]
        output_strings[2] = "\t".join(drug_lst) + "\n"

        # Define variables to write temporary output into
        total_unknown_str = ""
        unique_drug_list = []
        excluded_hits = {}

        if res_type == PointFinder.TYPE_BLAST:
            # Patch together partial sequence hits (BLASTER does not do this)
            # and removes dummy_hit_id
            GENES = self.find_best_seqs(results, min_cov)

        else:
            # TODO: Some databases are either genes or species,
            #       depending on the method applied (BLAST/KMA).
            GENES = results[self.species]

            # If not hits found insert genes not found
            if GENES == 'No hit found':
                GENES = {}

            # KMA only gives the genes found, however all genes should be
            # included
            for gene in self.gene_list:
                if gene not in GENES:
                    GENES[gene] = 'No hit found'

            # Included excluded
            GENES['excluded'] = results['excluded']

        for gene, hit in GENES.items():
            # Start writing output string (to HTML tab file)
            gene_name = gene  # Not perfeft can differ from specific mutation
            regex = r"promoter_size_(\d+)(?:bp)"
            promtr_gene_objt = re.search(regex, gene)

            if promtr_gene_objt:
                gene_name = gene.split("_")[0]

            output_strings[1] += "\n%s\n" % (gene_name)

            # Ignore excluded genes
            # TODO: Should all not found genes be moved to this dict?
            if gene == "excluded":
                continue

            # Write exclusion reason for genes not found
            if isinstance(GENES[gene], str):
                output_strings[1] += GENES[gene] + "\n"
                continue

            if hit['perc_ident'] < perc_iden and hit['perc_coverage'] < min_cov:
                GENES[gene] = ('Gene found with identity, %s, below minimum '
                               'identity threshold: %s. And with coverage, %s,'
                               ' below minimum coverage threshold: %s.'
                                % (hit['perc_ident'], perc_iden,
                                   hit['perc_coverage'], min_cov))
                output_strings[1] += GENES[gene] + "\n"
                continue

            if hit['perc_ident'] < perc_iden:
                GENES[gene] = ('Gene found with identity, %s, below minimum '
                               'identity threshold: %s' % (hit['perc_ident'],
                                                                   perc_iden))
                output_strings[1] += GENES[gene] + "\n"
                continue

            if hit['perc_coverage'] < min_cov:
                # Gene not found above given coverage
                GENES[gene] = ('Gene found with coverage, %s, below minimum '
                               'coverage threshold: %s' % (hit['perc_coverage'],
                                                                   min_cov))
                output_strings[1] += GENES[gene] + "\n"
                continue

            sbjct_start = hit['sbjct_start']
            sbjct_seq = hit['sbjct_string']
            qry_seq = hit['query_string']

            # Find and save mis_matches in gene
            hit['mis_matches'] = self.find_mismatches(gene, sbjct_start,
                                                      sbjct_seq, qry_seq)

            # Check if no mutations was found
            if len(hit['mis_matches']) < 1:
                output_strings[1] += ("No mutations found in {}\n"
                                      .format(gene_name))
            else:
                # Write mutations found to output file
                total_unknown_str += "\n%s\n" % (gene_name)

                str_tuple = self.mut2str(gene, gene_name, hit['mis_matches'],
                                         unknown_flag, hit)

                all_results = str_tuple[0]
                total_known = str_tuple[1]
                total_unknown = str_tuple[2]
                drug_list = str_tuple[3]

                # Add results to output strings
                if(all_results):
                    output_strings[0] += "\n" + all_results
                output_strings[1] += total_known + "\n"

                # Add unknown mutations the total results of
                # unknown mutations
                total_unknown_str += total_unknown + "\n"

                # Add drugs to druglist
                unique_drug_list += [drug.lower() for drug in drug_list]

        if unknown_flag is True:
            output_strings[1] += ("\n\nUnknown Mutations \n"
                                  + total_unknown_str)

        # Make Resistance Prediction output

        # Go throug all drugs in the database and see if prediction
        # can be called.
        pred_output = []
        for drug in drug_lst:
            drug = drug.lower()
            # Check if resistance to drug was found
            if drug in unique_drug_list:
                pred_output.append("1")
            else:
                # Check at all genes associated with the drug
                # resistance where found
                all_genes_found = True
                for gene in self.drug_genes[drug]:
                    if gene not in GENES:
                        all_genes_found = False

                if all_genes_found is False:
                    pred_output.append("?")
                else:
                    pred_output.append("0")

        output_strings[2] += "\t".join(pred_output) + "\n"

        return output_strings

    def write_results(self, out_path, result, res_type, unknown_flag, min_cov,
                      perc_iden):
       """
       """

       result_str = self.results_to_str(res_type=res_type,
                                        results=result,
                                        unknown_flag=unknown_flag,
                                        min_cov=min_cov,
                                        perc_iden=perc_iden)

       with open(out_path + "/PointFinder_results.txt", "w") as fh:
          fh.write(result_str[0])
       with open(out_path + "/PointFinder_table.txt", "w") as fh:
          fh.write(result_str[1])
       with open(out_path + "/PointFinder_prediction.txt", "w") as fh:
          fh.write(result_str[2])

    @staticmethod
    def discard_unwanted_results(results, wanted):
        """
            Takes a dict and a list of keys.
            Returns a dict containing only the keys from the list.
        """
        cleaned_results = dict()
        for key, val in results.items():
            if(key in wanted):
                cleaned_results[key] = val
        return cleaned_results

    def blast(self, inputfile, out_path, min_cov=0.6, threshold=0.9,
              blast="blastn", cut_off=True):
        """
        """
        blast_run = Blaster(inputfile=inputfile, databases=self.gene_list,
                            db_path=self.specie_path, out_path=out_path,
                            min_cov=min_cov, threshold=threshold, blast=blast,
                            cut_off=cut_off)

        self.blast_results = blast_run.results  # TODO Is this used?
        return blast_run

    @staticmethod
    def get_db_mutations(mut_db_path, gene_list):
        """
        This function opens the file resistenss-overview.txt, and reads
        the content into a dict of dicts. The dict will contain
        information about all known mutations given in the database.
        This dict is returned.
        """

        # Initiate variables
        known_mutations = dict()
        known_stop_codon = dict()
        drug_genes = dict()
        indelflag = False
        stopcodonflag = False

        # Go throug mutation file line by line

        with open(mut_db_path, "r") as fh:
            mutdb_file = fh.readlines()
        mutdb_file = [line.strip() for line in mutdb_file]

        for line in mutdb_file:
            # Ignore headers and check where the indel section starts
            if line.startswith("#"):
                if "indel" in line.lower():
                    indelflag = True
                elif "stop codon" in line.lower():
                    stopcodonflag = True
                else:
                    stopcodonflag = False
                continue

            mutation = [data.strip() for data in line.split("\t")]

            gene_ID = mutation[0]

            # Only consider mutations in genes found in the gene list
            if gene_ID in gene_list:
                gene_name = mutation[1]
                mut_pos = int(mutation[2])
                ref_codon = mutation[3]                     # Ref_nuc (1 or 3?)
                ref_aa = mutation[4]                        # Ref_codon
                alt_aa = mutation[5].split(",")             # Res_codon
                res_drug = mutation[6].replace("\t", " ")
                pmid = mutation[7].split(",")

                # Check if stop codons are predictive for resistance
                if stopcodonflag is True:
                    if gene_ID not in known_stop_codon:
                        known_stop_codon[gene_ID] = {"pos": [],
                                                     "drug": res_drug}
                    known_stop_codon[gene_ID]["pos"].append(mut_pos)

                # Add genes associated with drug resistance to drug_genes dict
                drug_lst = res_drug.split(",")
                drug_lst = [d.strip().lower() for d in drug_lst]
                for drug in drug_lst:
                    if drug not in drug_genes:
                        drug_genes[drug] = []
                    if gene_ID not in drug_genes[drug]:
                        drug_genes[drug].append(gene_ID)

                # Initiate empty dict to store relevant mutation information
                mut_info = dict()

                # Save need mutation info with pmid cooresponding to the amino
                # acid change
                for i in range(len(alt_aa)):
                    try:
                        mut_info[alt_aa[i]] = {"gene_name": gene_name,
                                               "drug": res_drug,
                                               "pmid": pmid[i]}
                    except IndexError:
                        mut_info[alt_aa[i]] = {"gene_name": gene_name,
                                               "drug": res_drug,
                                               "pmid": "-"}

                # Add all possible types of mutations to the dict
                if gene_ID not in known_mutations:
                    known_mutations[gene_ID] = {"sub": dict(), "ins": dict(),
                                                "del": dict()}
                # Check for the type of mutation
                if indelflag is False:
                    mutation_type = "sub"
                else:
                    mutation_type = ref_aa

                # Save mutations positions with required information given in
                # mut_info
                if mut_pos not in known_mutations[gene_ID][mutation_type]:
                    known_mutations[gene_ID][mutation_type][mut_pos] = dict()
                for amino in alt_aa:
                    if (amino in known_mutations[gene_ID][mutation_type]
                                                [mut_pos]):
                        stored_mut_info = (known_mutations[gene_ID]
                                                          [mutation_type]
                                                          [mut_pos][amino])
                        if stored_mut_info["drug"] != mut_info[amino]["drug"]:
                            stored_mut_info["drug"] += "," + (mut_info[amino]
                                                                      ["drug"])
                        if stored_mut_info["pmid"] != mut_info[amino]["pmid"]:
                            stored_mut_info["pmid"] += ";" + (mut_info[amino]
                                                                      ["pmid"])

                        (known_mutations[gene_ID][mutation_type]
                                        [mut_pos][amino]) = stored_mut_info
                    else:
                        (known_mutations[gene_ID][mutation_type]
                                        [mut_pos][amino]) = mut_info[amino]

        # Check that all genes in the gene list has known mutations
        for gene in gene_list:
            if gene not in known_mutations:
                known_mutations[gene] = {"sub": dict(), "ins": dict(),
                                         "del": dict()}
        return known_mutations, drug_genes, known_stop_codon

    def find_best_seqs(self, blast_results, min_cov):
        """
        This function finds gene sequences with the largest coverage based on
        the blast results. If more hits covering different sequences parts
        exists it concatinates partial gene hits into one hit.
        If different overlap sequences occurs they are saved in the list
        alternative_overlaps. The function returns a new results dict where
        each gene has an inner dict with hit information corresponding to
        the new concatinated hit. If no gene is found the value is a string
        with info of why the gene wasn't found.
        """

        GENES = dict()
        for gene, hits in blast_results.items():

            # Save all hits in the list 'hits_found'
            hits_found = []
            GENES[gene] = {}

            # Check for gene has any hits in blast results
            if gene == 'excluded':
                GENES[gene] = hits
                continue
            elif isinstance(hits, dict) and len(hits) > 0:
                GENES[gene]['found'] = 'partially'
                GENES[gene]['hits'] = hits
            else:
                # Gene not found! go to next gene
                GENES[gene] = 'No hit found'
                continue

            # Check coverage for each hit, patch together partial genes hits
            for hit_id, hit in hits.items():

                # Save hits start and end positions in subject, total subject
                # len, and subject and query sequences of each hit
                hits_found += [(hit['sbjct_start'], hit['sbjct_end'],
                                hit['sbjct_string'], hit['query_string'],
                                hit['sbjct_length'], hit['homo_string'],
                                hit_id)]

                # If coverage is 100% change found to yes
                hit_coverage = hit['perc_coverage']
                if hit_coverage == 1.0:
                    GENES[gene]['found'] = 'yes'

            # Sort positions found
            hits_found = sorted(hits_found, key=lambda x: x[0])

            # Find best hit by concatenating sequences if more hits exist

            # Get information from the first hit found
            all_start = hits_found[0][0]
            current_end = hits_found[0][1]
            final_sbjct = hits_found[0][2]
            final_qry = hits_found[0][3]
            sbjct_len = hits_found[0][4]
            final_homol = hits_found[0][5]
            first_hit_id = hits_found[0][6]

            alternative_overlaps = []
            contigs = [hit['contig_name']]
            scores = [str(hit['cal_score'])]

            # Check if more then one hit was found within the same gene
            for i in range(len(hits_found) - 1):

                # Save information from previous hit
                pre_block_start = hits_found[i][0]
                pre_block_end = hits_found[i][1]
                pre_sbjct = hits_found[i][2]
                pre_qry = hits_found[i][3]
                pre_homol = hits_found[i][5]
                pre_id = hits_found[i][6]

                # Save information from next hit
                next_block_start = hits_found[i + 1][0]
                next_block_end = hits_found[i + 1][1]
                next_sbjct = hits_found[i + 1][2]
                next_qry = hits_found[i + 1][3]
                next_homol = hits_found[i + 1][5]
                next_id = hits_found[i + 1][6]

                contigs.append(hits[next_id]['contig_name'])
                scores.append(str(hits[next_id]['cal_score']))

                # Check for overlapping sequences, collaps them and save
                # alternative overlaps if any
                if next_block_start <= current_end:

                    # Find overlap start and take gaps into account
                    pos_count = 0
                    overlap_pos = pre_block_start
                    for i in range(len(pre_sbjct)):

                        # Stop loop if overlap_start position is reached
                        if overlap_pos == next_block_start:
                            overlap_start = pos_count
                            break
                        if pre_sbjct[i] != "-":
                            overlap_pos += 1
                        pos_count += 1

                    # Find overlap len and add next sequence to final sequence
                    if len(pre_sbjct[overlap_start:]) > len(next_sbjct):
                        #  <--------->
                        #     <--->
                        overlap_len = len(next_sbjct)
                        overlap_end_pos = next_block_end
                    else:
                        #  <--------->
                        #        <--------->
                        overlap_len = len(pre_sbjct[overlap_start:])
                        overlap_end_pos = pre_block_end

                        # Update current end
                        current_end = next_block_end

                        # Use the entire previous sequence and add the last
                        # part of the next sequence
                        final_sbjct += next_sbjct[overlap_len:]
                        final_qry += next_qry[overlap_len:]
                        final_homol += next_homol[overlap_len:]

                    # Find query overlap sequences
                    pre_qry_overlap = pre_qry[overlap_start: (overlap_start
                                                              + overlap_len)]
                    next_qry_overlap = next_qry[:overlap_len]
                    sbjct_overlap = next_sbjct[:overlap_len]

                    # If alternative query overlap excist save it
                    if pre_qry_overlap != next_qry_overlap:
                        eprint("OVERLAP WARNING:")
                        eprint("{}\n{}"
                               .format(pre_qry_overlap, next_qry_overlap))

                        # Save alternative overlaps
                        alternative_overlaps += [(next_block_start,
                                                  overlap_end_pos,
                                                  sbjct_overlap,
                                                  next_qry_overlap)]

                elif next_block_start > current_end:
                    #  <------->
                    #              <------->
                    gap_size = next_block_start - current_end - 1
                    final_qry += "N" * gap_size
                    final_sbjct += "N" * gap_size
                    final_homol += "-" * gap_size
                    current_end = next_block_end
                    final_sbjct += next_sbjct
                    final_qry += next_qry
                    final_homol += next_homol

            # Calculate new coverage
            no_call = final_qry.upper().count("N")
            coverage = ((current_end - all_start + 1 - no_call)
                        / float(sbjct_len))

            # Calculate identity
            equal = 0
            not_equal = 0
            for i in range(len(final_qry)):
                if final_qry[i].upper() != "N":
                    if final_qry[i].upper() == final_sbjct[i].upper():
                        equal += 1
                    else:
                        not_equal += 1
            identity = equal / float(equal + not_equal)
            if coverage >= min_cov:
                GENES[gene]['perc_coverage'] = coverage
                GENES[gene]['perc_ident'] = identity
                GENES[gene]['sbjct_string'] = final_sbjct
                GENES[gene]['query_string'] = final_qry
                GENES[gene]['homo_string'] = final_homol
                GENES[gene]['contig_name'] = ", ".join(contigs)
                GENES[gene]['HSP_length'] = len(final_qry)
                GENES[gene]['sbjct_start'] = all_start
                GENES[gene]['sbjct_end'] = current_end
                GENES[gene]['sbjct_length'] = sbjct_len
                GENES[gene]['cal_score'] = ", ".join(scores)
                GENES[gene]['gaps'] = no_call
                GENES[gene]['alternative_overlaps'] = alternative_overlaps
                GENES[gene]['mis_matches'] = []

            else:
                # Gene not found above given coverage
                GENES[gene] = ('Gene found with coverage, %f, below '
                               'minimum coverage threshold: %s' % (coverage,
                                                                   min_cov))
        return GENES

    def find_mismatches(self, gene, sbjct_start, sbjct_seq, qry_seq):
        """
        This function finds mis matches between two sequeces. Depending
        on the the sequence type either the function
        find_codon_mismatches or find_nucleotid_mismatches are called,
        if the sequences contains both a promoter and a coding region
        both functions are called. The function can also call itself if
        alternative overlaps is give. All found mismatches are returned
        """

        # Initiate the mis_matches list that will store all found mis matcehs
        mis_matches = []

        # Find mis matches in RNA genes
        if gene in self.RNA_gene_list:
            mis_matches += PointFinder.find_nucleotid_mismatches(sbjct_start,
                                                                 sbjct_seq,
                                                                 qry_seq)
        else:
            # Check if the gene sequence is with a promoter
            regex = r"promoter_size_(\d+)(?:bp)"
            promtr_gene_objt = re.search(regex, gene)

            # Check for promoter sequences
            if promtr_gene_objt:
                # Get promoter length
                promtr_len = int(promtr_gene_objt.group(1))

                # Extract promoter sequence, while considering gaps
                # --------agt-->----
                #    ---->?
                if sbjct_start <= promtr_len:
                    # Find position in sbjct sequence where promoter ends
                    promtr_end = 0
                    nuc_count = sbjct_start - 1

                    for i in range(len(sbjct_seq)):
                        promtr_end += 1

                        if sbjct_seq[i] != "-":
                            nuc_count += 1

                        if nuc_count == promtr_len:
                            break

                    # Check if only a part of the promoter is found
                    # --------agt-->----
                    # ----
                    promtr_sbjct_start = -1
                    if nuc_count < promtr_len:
                        promtr_sbjct_start = nuc_count - promtr_len

                    # Get promoter part of subject and query
                    sbjct_promtr_seq = sbjct_seq[:promtr_end]
                    qry_promtr_seq = qry_seq[:promtr_end]

                    # For promoter part find nucleotide mis matches
                    mis_matches += PointFinder.find_nucleotid_mismatches(
                        promtr_sbjct_start, sbjct_promtr_seq, qry_promtr_seq,
                        promoter=True)

                    # Check if gene is also found
                    # --------agt-->----
                    #     -----------
                    if((sbjct_start + len(sbjct_seq.replace("-", "")))
                       > promtr_len):
                        sbjct_gene_seq = sbjct_seq[promtr_end:]
                        qry_gene_seq = qry_seq[promtr_end:]
                        sbjct_gene_start = 1

                        # Find mismatches in gene part
                        mis_matches += PointFinder.find_codon_mismatches(
                            sbjct_gene_start, sbjct_gene_seq, qry_gene_seq)

                # No promoter, only gene is found
                # --------agt-->----
                #            -----
                else:
                    sbjct_gene_start = sbjct_start - promtr_len

                    # Find mismatches in gene part
                    mis_matches += PointFinder.find_codon_mismatches(
                        sbjct_gene_start, sbjct_seq, qry_seq)

            else:
                # Find mismatches in gene
                mis_matches += PointFinder.find_codon_mismatches(
                    sbjct_start, sbjct_seq, qry_seq)

        return mis_matches

    @staticmethod
    def find_nucleotid_mismatches(sbjct_start, sbjct_seq, qry_seq,
                                  promoter=False):
        """
        This function takes two alligned sequence (subject and query),
        and the position on the subject where the alignment starts. The
        sequences are compared one nucleotide at a time. If mis matches
        are found they are saved. If a gap is found the function
        find_nuc_indel is called to find the entire indel and it is
        also saved into the list mis_matches. If promoter sequences are
        given as arguments, these are reversed the and the absolut
        value of the sequence position  used, but when mutations are
        saved the negative value and det reverse sequences are saved in
        mis_mathces.
        """

        # Initiate the mis_matches list that will store all found
        # mismatcehs
        mis_matches = []

        sbjct_start = abs(sbjct_start)
        seq_pos = sbjct_start

        # Set variables depending on promoter status
        factor = 1
        mut_prefix = "r."

        if promoter is True:
            factor = (-1)
            mut_prefix = "n."
            # Reverse promoter sequences
            sbjct_seq = sbjct_seq[::-1]
            qry_seq = qry_seq[::-1]

        # Go through sequences one nucleotide at a time
        shift = 0
        for index in range(sbjct_start - 1, len(sbjct_seq)):
            mut_name = mut_prefix
            mut = ""
            # Shift index according to gaps
            i = index + shift

            # If the end of the sequence is reached, stop
            if i == len(sbjct_seq):
                break

            sbjct_nuc = sbjct_seq[i]
            qry_nuc = qry_seq[i]

            # Check for mis matches
            if sbjct_nuc.upper() != qry_nuc.upper():

                # check for insertions and deletions
                if sbjct_nuc == "-" or qry_nuc == "-":
                    if sbjct_nuc == "-":
                        mut = "ins"
                        indel_start_pos = (seq_pos - 1) * factor
                        indel_end_pos = seq_pos * factor
                        indel = PointFinder.find_nuc_indel(sbjct_seq[i:],
                                                           qry_seq[i:])
                    else:
                        mut = "del"
                        indel_start_pos = seq_pos * factor
                        indel = PointFinder.find_nuc_indel(qry_seq[i:],
                                                           sbjct_seq[i:])
                        indel_end_pos = (seq_pos + len(indel) - 1) * factor
                        seq_pos += len(indel) - 1

                    # Shift the index to the end of the indel
                    shift += len(indel) - 1

                    # Write mutation name, depending on sequnce
                    if len(indel) == 1 and mut == "del":
                        mut_name += str(indel_start_pos) + mut + indel
                    else:
                        if promoter is True:
                            # Reverse the sequence and the start and
                            # end positions
                            indel = indel[::-1]
                            temp = indel_start_pos
                            indel_start_pos = indel_end_pos
                            indel_end_pos = temp

                        mut_name += (str(indel_start_pos) + "_"
                                     + str(indel_end_pos) + mut + indel)

                    mis_matches += [[mut, seq_pos * factor, seq_pos * factor,
                                    indel, mut_name, mut, indel]]

                # Check for substitutions mutations
                else:
                    mut = "sub"
                    mut_name += (str(seq_pos * factor) + sbjct_nuc + ">"
                                 + qry_nuc)

                    mis_matches += [[mut, seq_pos * factor, seq_pos * factor,
                                    qry_nuc, mut_name, sbjct_nuc, qry_nuc]]

            # Increment sequence position
            if mut != "ins":
                seq_pos += 1

        return mis_matches

    @staticmethod
    def find_nuc_indel(gapped_seq, indel_seq):
        """
        This function finds the entire indel missing in from a gapped
        sequence compared to the indel_seqeunce. It is assumes that the
        sequences start with the first position of the gap.
        """
        ref_indel = indel_seq[0]
        for j in range(1, len(gapped_seq)):
            if gapped_seq[j] == "-":
                ref_indel += indel_seq[j]
            else:
                break
        return ref_indel

    @staticmethod
    def aa(codon):
        """
        This function converts a codon to an amino acid. If the codon
        is not valid an error message is given, or else, the amino acid
        is returned.

        Potential future issue: If species are added that utilizes
                                alternative translation tables.
        """
        codon = codon.upper()
        aa = {"ATT": "I", "ATC": "I", "ATA": "I",
              "CTT": "L", "CTC": "L", "CTA": "L", "CTG": "L", "TTA": "L",
              "TTG": "L",
              "GTT": "V", "GTC": "V", "GTA": "V", "GTG": "V",
              "TTT": "F", "TTC": "F",
              "ATG": "M",
              "TGT": "C", "TGC": "C",
              "GCT": "A", "GCC": "A", "GCA": "A", "GCG": "A",
              "GGT": "G", "GGC": "G", "GGA": "G", "GGG": "G",
              "CCT": "P", "CCC": "P", "CCA": "P", "CCG": "P",
              "ACT": "T", "ACC": "T", "ACA": "T", "ACG": "T",
              "TCT": "S", "TCC": "S", "TCA": "S", "TCG": "S", "AGT": "S",
              "AGC": "S",
              "TAT": "Y", "TAC": "Y",
              "TGG": "W",
              "CAA": "Q", "CAG": "Q",
              "AAT": "N", "AAC": "N",
              "CAT": "H", "CAC": "H",
              "GAA": "E", "GAG": "E",
              "GAT": "D", "GAC": "D",
              "AAA": "K", "AAG": "K",
              "CGT": "R", "CGC": "R", "CGA": "R", "CGG": "R", "AGA": "R",
              "AGG": "R",
              "TAA": "*", "TAG": "*", "TGA": "*"}
        # Translate valid codon
        try:
            amino_a = aa[codon]
        except KeyError:
            amino_a = "?"
        return amino_a

    @staticmethod
    def get_codon(seq, codon_no, start_offset):
        """
        This function takes a sequece and a codon number and returns
        the codon found in the sequence at that position
        """
        seq = seq.replace("-", "")
        codon_start_pos = int(codon_no - 1) * 3 - start_offset
        codon = seq[codon_start_pos:codon_start_pos + 3]
        return codon

    @staticmethod
    def name_insertion(sbjct_seq, codon_no, sbjct_nucs, aa_alt, start_offset):
        """
        This function is used to name a insertion mutation based on the
        HGVS recommendation.
        """
        start_codon_no = codon_no - 1

        if len(sbjct_nucs) == 3:
            start_codon_no = codon_no

        start_codon = PointFinder.get_codon(sbjct_seq, start_codon_no,
                                            start_offset)
        end_codon = PointFinder.get_codon(sbjct_seq, codon_no, start_offset)
        pos_name = "p.%s%d_%s%dins%s" % (PointFinder.aa(start_codon),
                                         start_codon_no,
                                         PointFinder.aa(end_codon),
                                         codon_no, aa_alt)
        return pos_name

    @staticmethod
    def name_deletion(sbjct_seq, sbjct_rf_indel, sbjct_nucs, codon_no, aa_alt,
                      start_offset, mutation="del"):
        """
        This function is used to name a deletion mutation based on the
        HGVS recommendation. If combination of a deletion and an
        insertion is identified the argument 'mutation' is set to
        'delins' and the mutation name will indicate that the mutation
        is a delins mutation.
        """
        del_codon = PointFinder.get_codon(sbjct_seq, codon_no, start_offset)
        pos_name = "p.%s%d" % (PointFinder.aa(del_codon), codon_no)

        # This has been changed
        if len(sbjct_rf_indel) == 3 and mutation == "del":
            return pos_name + mutation

        end_codon_no = codon_no + math.ceil(len(sbjct_nucs) / 3) - 1
        end_codon = PointFinder.get_codon(sbjct_seq, end_codon_no,
                                          start_offset)
        pos_name += "_%s%d%s" % (PointFinder.aa(end_codon), end_codon_no,
                                 mutation)
        if mutation == "delins":
            pos_name += aa_alt
        return pos_name

    @staticmethod
    def name_indel_mutation(sbjct_seq, indel, sbjct_rf_indel, qry_rf_indel,
                            codon_no, mut, start_offset):
        """
        This function serves to name the individual mutations
        dependently on the type of the mutation.
        """
        # Get the subject and query sequences without gaps
        sbjct_nucs = sbjct_rf_indel.replace("-", "")
        qry_nucs = qry_rf_indel.replace("-", "")

        # Translate nucleotides to amino acids
        aa_ref = ""
        aa_alt = ""

        for i in range(0, len(sbjct_nucs), 3):
            aa_ref += PointFinder.aa(sbjct_nucs[i:i + 3])

        for i in range(0, len(qry_nucs), 3):
            aa_alt += PointFinder.aa(qry_nucs[i:i + 3])

        # Identify the gapped sequence
        if mut == "ins":
            gapped_seq = sbjct_rf_indel
        else:
            gapped_seq = qry_rf_indel

        gap_size = gapped_seq.count("-")

        # Write mutation names
        if gap_size < 3 and len(sbjct_nucs) == 3 and len(qry_nucs) == 3:
            # Write mutation name for substitution mutation
            mut_name = "p.%s%d%s" % (PointFinder.aa(sbjct_nucs), codon_no,
                                     PointFinder.aa(qry_nucs))
        elif len(gapped_seq) == gap_size:

            if mut == "ins":
                # Write mutation name for insertion mutation
                mut_name = PointFinder.name_insertion(sbjct_seq, codon_no,
                                                      sbjct_nucs, aa_alt,
                                                      start_offset)
                aa_ref = mut
            else:
                # Write mutation name for deletion mutation
                mut_name = PointFinder.name_deletion(sbjct_seq, sbjct_rf_indel,
                                                     sbjct_nucs, codon_no,
                                                     aa_alt, start_offset,
                                                     mutation="del")
                aa_alt = mut
        # Check for delins - mix of insertion and deletion
        else:
            # Write mutation name for a mixed insertion and deletion
            # mutation
            mut_name = PointFinder.name_deletion(sbjct_seq,
                                                 sbjct_rf_indel, sbjct_nucs,
                                                 codon_no, aa_alt,
                                                 start_offset,
                                                 mutation="delins")

        # Check for frameshift
        if gapped_seq.count("-") % 3 != 0:
            # Add the frameshift tag to mutation name
            mut_name += " - Frameshift"

        return mut_name, aa_ref, aa_alt

    @staticmethod
    def get_inframe_gap(seq, nucs_needed=3):
        """
        This funtion takes a sequnece starting with a gap or the
        complementary seqeuence to the gap, and the number of
        nucleotides that the seqeunce should contain in order to
        maintain the correct reading frame. The sequence is gone
        through and the number of non-gap characters are counted. When
        the number has reach the number of needed nucleotides the indel
        is returned. If the indel is a 'clean' insert or deletion that
        starts in the start of a codon and can be divided by 3, then
        only the gap is returned.
        """
        nuc_count = 0
        gap_indel = ""
        nucs = ""

        for i in range(len(seq)):
            # Check if the character is not a gap
            if seq[i] != "-":
                # Check if the indel is a 'clean'
                # i.e. if the insert or deletion starts at the first
                # nucleotide in the codon and can be divided by 3

                if(gap_indel.count("-") == len(gap_indel)
                   and gap_indel.count("-") >= 3 and len(gap_indel) != 0):
                    return gap_indel

                nuc_count += 1
            gap_indel += seq[i]

            # if the number of nucleotides in the indel equals the amount
            # needed for the indel, the indel is returned.
            if nuc_count == nucs_needed:
                return gap_indel

        # This will only happen if the gap is in the very end of a sequence
        return gap_indel

    @staticmethod
    def get_indels(sbjct_seq, qry_seq, start_pos):
        """
        This function uses regex to find inserts and deletions in
        sequences given as arguments. A list of these indels are
        returned. The list includes, type of mutations(ins/del),
        subject codon no of found mutation, subject sequence position,
        insert/deletions nucleotide sequence, and the affected qry
        codon no.
        """

        seqs = [sbjct_seq, qry_seq]
        indels = []
        gap_obj = re.compile(r"-+")
        for i in range(len(seqs)):
            for match in gap_obj.finditer(seqs[i]):
                pos = int(match.start())
                gap = match.group()

                # Find position of the mutation corresponding to the
                # subject sequence
                sbj_pos = len(sbjct_seq[:pos].replace("-", "")) + start_pos

                # Get indel sequence and the affected sequences in
                # sbjct and qry in the reading frame
                indel = seqs[abs(i - 1)][pos:pos + len(gap)]

                # Find codon number for mutation
                codon_no = int(math.ceil((sbj_pos) / 3))
                qry_pos = len(qry_seq[:pos].replace("-", "")) + start_pos
                qry_codon = int(math.ceil((qry_pos) / 3))

                if i == 0:
                    mut = "ins"
                else:
                    mut = "del"

                indels.append([mut, codon_no, sbj_pos, indel, qry_codon])

        # Sort indels based on codon position and sequence position
        indels = sorted(indels, key=lambda x: (x[1], x[2]))

        return indels

    @staticmethod
    def find_codon_mismatches(sbjct_start, sbjct_seq, qry_seq):
        """
        This function takes two alligned sequence (subject and query),
        and the position on the subject where the alignment starts. The
        sequences are compared codon by codon. If a mis matches is
        found it is saved in 'mis_matches'. If a gap is found the
        function get_inframe_gap is used to find the indel sequence and
        keep the sequence in the correct reading frame. The function
        translate_indel is used to name indel mutations and translate
        the indels to amino acids The function returns a list of tuples
        containing all needed informations about the mutation in order
        to look it up in the database dict known mutation and the with
        the output files the the user.
        """
        mis_matches = []

        # Find start pos of first codon in frame, i_start
        codon_offset = (sbjct_start - 1) % 3
        i_start = 0

        if codon_offset != 0:
            i_start = 3 - codon_offset

        sbjct_start = sbjct_start + i_start

        # Set sequences in frame
        sbjct_seq = sbjct_seq[i_start:]
        qry_seq = qry_seq[i_start:]

        # Find codon number of the first codon in the sequence, start
        # at 0
        codon_no = int((sbjct_start - 1) / 3)  # 1,2,3 start on 0

        # s_shift and q_shift are used when gaps appears
        q_shift = 0
        s_shift = 0
        mut_no = 0

        # Find inserts and deletions in sequence
        indel_no = 0
        indels = PointFinder.get_indels(sbjct_seq, qry_seq, sbjct_start)

        # Go through sequence and save mutations when found
        for index in range(0, len(sbjct_seq), 3):
            # Count codon number
            codon_no += 1

            # Shift index according to gaps
            s_i = index + s_shift
            q_i = index + q_shift

            # Get codons
            sbjct_codon = sbjct_seq[s_i:s_i + 3]
            qry_codon = qry_seq[q_i:q_i + 3]

            if(len(sbjct_seq[s_i:].replace("-", ""))
               + len(qry_codon[q_i:].replace("-", "")) < 6):
                break

            # Check for mutations
            if sbjct_codon.upper() != qry_codon.upper():

                # Check for codon insertions and deletions and
                # frameshift mutations
                if "-" in sbjct_codon or "-" in qry_codon:

                    # Get indel info
                    try:
                        indel_data = indels[indel_no]
                    except IndexError:
                        sys.exit("indel_data list is out of range, bug!")

                    mut = indel_data[0]
                    codon_no_indel = indel_data[1]
                    seq_pos = indel_data[2] + sbjct_start - 1
                    indel = indel_data[3]
                    indel_no += 1

                    # Get the affected sequence in frame for both for
                    # sbjct and qry
                    if mut == "ins":
                        sbjct_rf_indel = PointFinder.get_inframe_gap(
                            sbjct_seq[s_i:], 3)
                        qry_rf_indel = PointFinder.get_inframe_gap(
                            qry_seq[q_i:],
                            int(math.floor(len(sbjct_rf_indel) / 3) * 3))
                    else:
                        qry_rf_indel = PointFinder.get_inframe_gap(
                            qry_seq[q_i:], 3)
                        sbjct_rf_indel = PointFinder.get_inframe_gap(
                            sbjct_seq[s_i:],
                            int(math.floor(len(qry_rf_indel) / 3) * 3))

                    mut_name, aa_ref, aa_alt = PointFinder.name_indel_mutation(
                        sbjct_seq, indel, sbjct_rf_indel, qry_rf_indel,
                        codon_no, mut, sbjct_start - 1)

                    # Set index to the correct reading frame after the
                    # indel gap
                    shift_diff_before = abs(s_shift - q_shift)
                    s_shift += len(sbjct_rf_indel) - 3
                    q_shift += len(qry_rf_indel) - 3
                    shift_diff = abs(s_shift - q_shift)

                    if shift_diff_before != 0 and shift_diff % 3 == 0:

                        if s_shift > q_shift:
                            nucs_needed = (int((len(sbjct_rf_indel) / 3) * 3)
                                           + shift_diff)
                            pre_qry_indel = qry_rf_indel
                            qry_rf_indel = PointFinder.get_inframe_gap(
                                qry_seq[q_i:], nucs_needed)
                            q_shift += len(qry_rf_indel) - len(pre_qry_indel)

                        elif q_shift > s_shift:
                            nucs_needed = (int((len(qry_rf_indel) / 3) * 3)
                                           + shift_diff)
                            pre_sbjct_indel = sbjct_rf_indel
                            sbjct_rf_indel = PointFinder.get_inframe_gap(
                                sbjct_seq[s_i:], nucs_needed)
                            s_shift += (len(sbjct_rf_indel)
                                        - len(pre_sbjct_indel))

                        mut_name, aa_ref, aa_alt = (
                            PointFinder.name_indel_mutation(
                                sbjct_seq, indel, sbjct_rf_indel, qry_rf_indel,
                                codon_no, mut, sbjct_start - 1)
                        )
                        if "Frameshift" in mut_name:
                            mut_name = (mut_name.split("-")[0]
                                        + "- Frame restored")
                        if mut_name is "p.V940delins - Frame restored":
                            sys.exit()
                    mis_matches += [[mut, codon_no_indel, seq_pos, indel,
                                     mut_name, sbjct_rf_indel, qry_rf_indel,
                                     aa_ref, aa_alt]]

                    # Check if the next mutation in the indels list is
                    # in the current codon.
                    # Find the number of individul gaps in the
                    # evaluated sequence.
                    no_of_indels = (len(re.findall("\-\w", sbjct_rf_indel))
                                    + len(re.findall("\-\w", qry_rf_indel)))

                    if no_of_indels > 1:

                        for j in range(indel_no, indel_no + no_of_indels - 1):
                            try:
                                indel_data = indels[j]
                            except IndexError:
                                sys.exit("indel_data list is out of range, "
                                         "bug!")
                            mut = indel_data[0]
                            codon_no_indel = indel_data[1]
                            seq_pos = indel_data[2] + sbjct_start - 1
                            indel = indel_data[3]
                            indel_no += 1
                            mis_matches += [[mut, codon_no_indel, seq_pos,
                                             indel, mut_name, sbjct_rf_indel,
                                             qry_rf_indel, aa_ref, aa_alt]]

                    # Set codon number, and save nucleotides from out
                    # of frame mutations
                    if mut == "del":
                        codon_no += int((len(sbjct_rf_indel) - 3) / 3)
                    # If evaluated insert is only gaps codon_no should
                    # not increment
                    elif sbjct_rf_indel.count("-") == len(sbjct_rf_indel):
                        codon_no -= 1

                # Check of point mutations
                else:
                    mut = "sub"
                    aa_ref = PointFinder.aa(sbjct_codon)
                    aa_alt = PointFinder.aa(qry_codon)

                    if aa_ref != aa_alt:
                        # End search for mutation if a premature stop
                        # codon is found
                        mut_name = "p." + aa_ref + str(codon_no) + aa_alt

                        mis_matches += [[mut, codon_no, codon_no, aa_alt,
                                         mut_name, sbjct_codon, qry_codon,
                                         aa_ref, aa_alt]]
                # If a Premature stop codon occur report it an stop the
                # loop

                try:
                    if mis_matches[-1][-1] == "*":
                        mut_name += " - Premature stop codon"
                        mis_matches[-1][4] = (mis_matches[-1][4].split("-")[0]
                                              + " - Premature stop codon")
                        break
                except IndexError:
                    pass

        # Sort mutations on position
        mis_matches = sorted(mis_matches, key=lambda x: x[1])

        return mis_matches

    @staticmethod
    def mutstr2mutdict(m):
        out_dict = {}

        # Protein / Amino acid mutations
        # Ex.: "p.T83I"
        if(m.startswith("p.")):
            out_dict["nucleotide"] = False

            # Remove frameshift tag
            frameshift_match = re.search(r"(.+) - Frameshift.*$", m)
            if(frameshift_match):
                m = frameshift_match.group(1)
                out_dict["frameshift"] = True

            # Remove frame restored tag
            framerestored_match = re.search(r"(.+) - Frame restored.*$", m)
            if(framerestored_match):
                m = framerestored_match.group(1)
                out_dict["frame restored"] = True

            # Remove premature stop tag
            prem_stop_match = re.search(r"(.+) - Premature stop codon.*$", m)
            if(prem_stop_match):
                m = prem_stop_match.group(1)
                out_dict["prem_stop"] = True

            # TODO: premature or frameshift tag adds too many whitespaces
            m = m.strip()

            # Delins
            multi_delins_match = re.search(
                r"^p.(\D{1})(\d+)_(\D{1})(\d+)delins(\S+)$", m)
            single_delins_match = re.search(
                r"^p.(\D{1})(\d+)delins(\S+)$", m)
            # TODO: is both necessary?
            multi_delins_match2 = re.search(
                r"^p.(\D{1})(\d+)_(\D{1})(\d+)delins$", m)
            single_delins_match2 = re.search(
                r"^p.(\D{1})(\d+)delins$", m)
            multi_ins_match = re.search(
                r"^p.(\D{1})(\d+)_(\D{1})(\d+)ins(\D*)$", m)
            if(multi_delins_match or single_delins_match):
                out_dict["deletion"] = True
                out_dict["insertion"] = True
                if(single_delins_match):
                    out_dict["ref_aa"] = single_delins_match.group(1)
                    out_dict["pos"] = single_delins_match.group(2)
                    out_dict["mut_aa"] = single_delins_match.group(3)
                else:
                    out_dict["ref_aa"] = multi_delins_match.group(1)
                    out_dict["pos"] = multi_delins_match.group(2)
                    out_dict["ref_aa_right"] = multi_delins_match.group(3)
                    out_dict["mut_end"] = multi_delins_match.group(4)
                    out_dict["mut_aa"] = multi_delins_match.group(5)
            # Deletions
            elif(m[-3:] == "del"):
                single_del_match = re.search(
                    r"^p.(\D{1})(\d+)del$", m)
                multi_del_match = re.search(
                    r"^p.(\D{1})(\d+)_(\D{1})(\d+)del$", m)
                out_dict["deletion"] = True
                if(single_del_match):
                    out_dict["ref_aa"] = single_del_match.group(1)
                    out_dict["pos"] = single_del_match.group(2)
                else:
                    out_dict["ref_aa"] = multi_del_match.group(1)
                    out_dict["pos"] = multi_del_match.group(2)
                    out_dict["ref_aa_right"] = multi_del_match.group(3)
                    out_dict["mut_end"] = multi_del_match.group(4)
            # Insertions
            elif(multi_ins_match):
                out_dict["insertion"] = True
                out_dict["ref_aa"] = multi_ins_match.group(1).lower()
                out_dict["pos"] = multi_ins_match.group(2)
                out_dict["ref_aa_right"] = multi_ins_match.group(3).lower()
                if(multi_ins_match.group(4)):
                    out_dict["mut_aa"] = multi_ins_match.group(4).lower()
            # Substitutions
            else:
                sub_match = re.search(
                    r"^p.(\D{1})(\d+)(\D{1})$", m)
                out_dict["ref_aa"] = sub_match.group(1).lower()
                out_dict["pos"] = sub_match.group(2)
                out_dict["mut_aa"] = sub_match.group(3).lower()

        # Nucleotide mutations
        # Ex. sub: n.-42T>C
        # Ex. ins: n.-13_-14insG    (TODO: Verify)
        # Ex. del: n.42delT         (TODO: Verify)
        # Ex. del: n.42_45del       (TODO: Verify)
        elif(m.startswith("n.") or m.startswith("r.")):
            out_dict["nucleotide"] = True

            sub_match = re.search(
                r"^[nr]{1}\.(-{0,1}\d+)(\D{1})>(\D{1})$", m)
            ins_match = re.search(
                r"^[nr]{1}\.(-{0,1}\d+)_(-{0,1}\d+)ins(\S+)$", m)
            # r.541delA
            del_match = re.search((
                r"^[nr]{1}\.(-{0,1}\d+)_{0,1}(-{0,1}\d*)del(\S*)$"), m)
            if(sub_match):
                out_dict["pos"] = sub_match.group(1)
                out_dict["ref_nuc"] = sub_match.group(2)
                out_dict["mut_nuc"] = sub_match.group(3)
            elif(ins_match):
                out_dict["insertion"] = True
                out_dict["pos"] = ins_match.group(1)
                out_dict["mut_end"] = ins_match.group(2)
                out_dict["mut_nuc"] = ins_match.group(3)
            elif(del_match):
                out_dict["deletion"] = True
                out_dict["pos"] = del_match.group(1)
                if(del_match.group(2)):
                    out_dict["mut_end"] = del_match.group(2)
                if(del_match.group(3)):
                    out_dict["ref_nuc"] = del_match.group(3)
                else:
                    sys.exit("ERROR: Nucleotide deletion did not contain any "
                             "reference sequence. mut string: {}".format(m))

        return out_dict

    def get_mutations(self, gene, gene_name, mis_matches, unknown_flag, hit):
        RNA = False
        if gene in self.RNA_gene_list:
            RNA = True

        known_muts = []
        unknown_muts = []

        # Go through each mutation
        for i in range(len(mis_matches)):
            m_type = mis_matches[i][0]
            pos = mis_matches[i][1]  # sort on pos?
            look_up_pos = mis_matches[i][2]
            look_up_mut = mis_matches[i][3]
            mut_name = mis_matches[i][4]
            # nuc_ref = mis_matches[i][5]
            # nuc_alt = mis_matches[i][6]
            ref = mis_matches[i][-2]
            alt = mis_matches[i][-1]
            mut_dict = PointFinder.mutstr2mutdict(mut_name)

            mut_id = ("{gene}_{pos}_{alt}"
                      .format(gene=gene_name, pos=pos, alt=alt.lower()))

            ref_aa = mut_dict.get("ref_aa", None)
            ref_aa_right = mut_dict.get("ref_aa_right", None)
            mut_aa = mut_dict.get("mut_aa", None)
            ref_nuc = mut_dict.get("ref_nuc", None)
            mut_nuc = mut_dict.get("mut_nuc", None)
            is_nuc = mut_dict.get("nucleotide", None)
            is_ins = mut_dict.get("insertion", None)
            is_del = mut_dict.get("deletion", None)
            mut_end = mut_dict.get("mut_end", None)
            prem_stop = mut_dict.get("prem_stop", False)

            mut = ResMutation(unique_id=mut_id, seq_region=gene_name, pos=pos,
                              hit=hit, ref_codon=ref_nuc, mut_codon=mut_nuc,
                              ref_aa=ref_aa, ref_aa_right=ref_aa_right,
                              mut_aa=mut_aa, insertion=is_ins, deletion=is_del,
                              end=mut_end, nuc=is_nuc,
                              premature_stop=prem_stop, ab_class=None)

            if "Premature stop codon" in mut_name:
                sbjct_len = hit['sbjct_length']
                qry_len = pos * 3
                perc_trunc = round(
                    ((float(sbjct_len) - qry_len)
                     / float(sbjct_len))
                    * 100, 2
                )
                mut.premature_stop = perc_trunc

            # Check if mutation is known
            gene_mut_name, resistence, pmid = self.look_up_known_muts(
                gene, look_up_pos, look_up_mut, m_type, gene_name)

            # Collect known mutations
            if resistence != "Unknown":
                known_muts.append(mut)
            # Collect unknown mutations
            else:
                unknown_muts.append(mut)

            # TODO: Use ResMutation class to make sure identical mutations are
            #       not kept.

        return (known_muts, unknown_muts)

    def mut2str(self, gene, gene_name, mis_matches, unknown_flag, hit):
        """
            This function takes a gene name a list of mis matches found
            between subject and query of this gene, the dictionary of
            known mutation in the point finder database, and the flag
            telling weather the user wants unknown mutations to be
            reported. All mis matches are looked up in the known
            mutation dict to se if the mutation is known, and in this
            case what drug resistence it causes. The funtions return 3
            strings that are used as output to the users. One string is
            only tab seperated and contains the mutations listed line
            by line. If the unknown flag is set to true it will contain
            both known and unknown mutations. The next string contains
            only known mutation and are given in in a format that is
            easy to convert to HTML. The last string is the HTML tab
            sting from the unknown mutations.
        """
        known_header = ("Mutation\tNucleotide change\tAmino acid change\t"
                        "Resistance\tPMID\n")

        unknown_header = "Mutation\tNucleotide change\tAmino acid change\n"

        RNA = False
        if gene in self.RNA_gene_list:
            RNA = True
            known_header = "Mutation\tNucleotide change\tResistance\tPMID\n"
            unknown_header = "Mutation\tNucleotide change\n"

        known_lst = []
        unknown_lst = []
        all_results_lst = []
        output_mut = []
        stop_codons = []

        # Go through each mutation
        for i in range(len(mis_matches)):
            m_type = mis_matches[i][0]
            pos = mis_matches[i][1]  # sort on pos?
            look_up_pos = mis_matches[i][2]
            look_up_mut = mis_matches[i][3]
            mut_name = mis_matches[i][4]
            nuc_ref = mis_matches[i][5]
            nuc_alt = mis_matches[i][6]
            ref = mis_matches[i][-2]
            alt = mis_matches[i][-1]

            # First index in list indicates if mutation is known
            output_mut += [[]]

            # Define output vaiables
            codon_change = nuc_ref + " -> " + nuc_alt
            aa_change = ref + " -> " + alt

            if RNA is True:
                aa_change = "RNA mutations"
            elif pos < 0:
                aa_change = "Promoter mutations"

            # Check if mutation is known
            gene_mut_name, resistence, pmid = self.look_up_known_muts(
                gene, look_up_pos, look_up_mut, m_type, gene_name)

            gene_mut_name = gene_mut_name + " " + mut_name

            output_mut[i] = [gene_mut_name, codon_change, aa_change,
                             resistence, pmid]

            # Add mutation to output strings for known mutations
            if resistence != "Unknown":
                if RNA is True:
                    # don't include the amino acid change field for
                    # RNA mutations
                    known_lst += ["\t".join(output_mut[i][:2]) + "\t"
                                  + "\t".join(output_mut[i][3:])]
                else:
                    known_lst += ["\t".join(output_mut[i])]

                all_results_lst += ["\t".join(output_mut[i])]

            # Add mutation to output strings for unknown mutations
            else:
                if RNA is True:
                    unknown_lst += ["\t".join(output_mut[i][:2])]
                else:
                    unknown_lst += ["\t".join(output_mut[i][:3])]

                if unknown_flag is True:
                    all_results_lst += ["\t".join(output_mut[i])]

            # Check that you do not print two equal lines (can happen
            # if two indels occure in the same codon)
            if len(output_mut) > 1:
                if output_mut[i] == output_mut[i - 1]:

                    if resistence != "Unknown":
                        known_lst = known_lst[:-1]
                        all_results_lst = all_results_lst[:-1]
                    else:
                        unknown_lst = unknown_lst[:-1]

                        if unknown_flag is True:
                            all_results_lst = all_results_lst[:-1]

            if "Premature stop codon" in mut_name:
                sbjct_len = hit['sbjct_length']
                qry_len = pos * 3
                prec_truckat = round(
                    ((float(sbjct_len) - qry_len)
                     / float(sbjct_len))
                    * 100, 2
                )
                perc = "%"
                stop_codons.append("Premature stop codon in %s, %.2f%s lost"
                                   % (gene, prec_truckat, perc))

        # Creat final strings
        if(all_results_lst):
            all_results = "\n".join(all_results_lst)
        else:
            all_results = ""
        total_known_str = ""
        total_unknown_str = ""

        # Check if there are only unknown mutations
        resistence_lst = []
        for mut in output_mut:
            for res in mut[3].split(","):
                resistence_lst.append(res)

        # Save known mutations
        unknown_no = resistence_lst.count("Unknown")
        if unknown_no < len(resistence_lst):
            total_known_str = known_header + "\n".join(known_lst)
        else:
            total_known_str = "No known mutations found in %s" % gene_name

        # Save unknown mutations
        if unknown_no > 0:
            total_unknown_str = unknown_header + "\n".join(unknown_lst)
        else:
            total_unknown_str = "No unknown mutations found in %s" % gene_name

        return (all_results, total_known_str, total_unknown_str,
                resistence_lst + stop_codons)

    @staticmethod
    def get_file_content(file_path, fst_char_only=False):
        """
        This function opens a file, given as the first argument
        file_path and returns the lines of the file in a list or the
        first character of the file if fst_char_only is set to True.
        """
        with open(file_path, "r") as infile:
            line_lst = []
            for line in infile:
                line = line.strip()
                if line != "":
                    line_lst.append(line)
                if fst_char_only:
                    return line_lst[0][0]
        return line_lst

    def look_up_known_muts(self, gene, pos, found_mut, mut, gene_name):
        """
            This function uses the known_mutations dictionay, a gene a
            string with the gene key name, a gene position as integer,
            found_mut is given as amino acid or nucleotides, the
            mutation type (mut) is either "del", "ins", or "sub", and
            gene_name is the gene name that should be returned to the
            user. The function looks up if the found_mut defined by the
            gene, position and the found_mut string is given in the
            known_mutations dictionary, if it is, the resistance and
            the pmid are returned together with the gene_name given in
            the known_mutations dict. If the mutation type is "del" the
            deleted nucleotids are checked to be contained in any of
            the deletion described in the known_mutation dict.
        """
        resistence = "Unknown"
        pmid = "-"
        found_mut = found_mut.upper()

        if mut == "del":
            for i, i_pos in enumerate(range(pos, pos + len(found_mut))):

                known_indels = self.known_mutations[gene]["del"].get(i_pos, [])
                for known_indel in known_indels:
                    partial_mut = found_mut[i:len(known_indel) + i]

                    # Check if part of found mut is known and check if
                    # found mut and known mut is in the same reading
                    # frame
                    if(partial_mut == known_indel
                       and len(found_mut) % 3 == len(known_indel) % 3):

                        resistence = (self.known_mutations[gene]["del"][i_pos]
                                      [known_indel]['drug'])

                        pmid = (self.known_mutations[gene]["del"][i_pos]
                                [known_indel]['pmid'])

                        gene_name = (self.known_mutations[gene]["del"][i_pos]
                                     [known_indel]['gene_name'])
                        break
        else:
            if pos in self.known_mutations[gene][mut]:
                if found_mut in self.known_mutations[gene][mut][pos]:
                    resistence = (self.known_mutations[gene][mut][pos]
                                  [found_mut]['drug'])

                    pmid = (self.known_mutations[gene][mut][pos][found_mut]
                            ['pmid'])

                    gene_name = (self.known_mutations[gene][mut][pos]
                                 [found_mut]['gene_name'])

        # Check if stop codons refer resistance
        if "*" in found_mut and gene in self.known_stop_codon:
            if resistence == "Unknown":
                resistence = self.known_stop_codon[gene]["drug"]
            else:
                resistence += "," + self.known_stop_codon[gene]["drug"]

        return (gene_name, resistence, pmid)


if __name__ == '__main__':

    ##########################################################################
    # PARSE COMMAND LINE OPTIONS
    ##########################################################################

    parser = argparse.ArgumentParser(
        description="This program predicting resistance associated with \
                     chromosomal mutations based on WGS data",
        prog="pointfinder.py")

    # required arguments
    parser.add_argument("-i",
                        dest="inputfiles",
                        metavar="INFILE",
                        nargs='+',
                        help="Input file. fastq file(s) from one sample for \
                              KMA or one fasta file for blastn.",
                        required=True)
    parser.add_argument("-o",
                        dest="out_path",
                        metavar="OUTFOLDER",
                        help="Output folder, output files will be stored \
                              here.",
                        required=True)
    parser.add_argument("-s",
                        dest="species",
                        metavar="SPECIES",
                        choices=['e.coli', 'gonorrhoeae', 'campylobacter',
                                 'salmonella', 'tuberculosis'],
                        help="Species of choice, e.coli, tuberculosis, \
                              salmonella, campylobactor, gonorrhoeae, \
                              klebsiella, or malaria",
                        required=True)
    parser.add_argument("-m",
                        dest="method",
                        metavar="METHOD",
                        choices=["kma", "blastn"],
                        help="Method of choice, kma or blastn",
                        required=True)
    parser.add_argument("-m_p",
                        dest="method_path",
                        help="Path to the location of blastn or kma dependent \
                              of the chosen method",
                        required=True)
    parser.add_argument("-p",
                        dest="db_path",
                        metavar="DATABASE",
                        help="Path to the location of the pointfinder \
                              database",
                        required=True)

    # optional arguments
    parser.add_argument("-t",
                        dest="threshold",
                        metavar="IDENTITY",
                        help="Minimum gene identity threshold, default = 0.9",
                        type=float,
                        default=0.9)
    parser.add_argument("-l",
                        dest="min_cov",
                        metavar="COVERAGE",
                        help="Minimum gene coverage threshold, \
                              threshold = 0.6",
                        type=float,
                        default=0.6)
    parser.add_argument("-u",
                        dest="unknown_mutations",
                        help="Show all mutations found even if it's unknown \
                              to the resistance database.",
                        action='store_true',
                        default=False)
    parser.add_argument("-g",
                        dest="specific_gene",
                        nargs='+',
                        help="Specify genes existing in the database to \
                              search for - if none is specified all genes are \
                              included in the search.",
                        default=None)

    args = parser.parse_args()

    # If no arguments are given print usage message and exit
    if len(sys.argv) == 1:
        sys.exit("Usage: " + parser.usage)

    if(args.method == "blastn"):
        method = PointFinder.TYPE_BLAST
    else:
        method = PointFinder.TYPE_KMA

    # Get sample name
    filename = args.inputfiles[0].split("/")[-1]
    sample_name = "".join(filename.split(".")[0:-1])  # .split("_")[0]
    if sample_name == "":
        sample_name = filename

    # TODO: Change ilogocal var name
    kma_db_path = args.db_path + "/" + args.species

    finder = PointFinder(db_path=kma_db_path, species=args.species,
                         gene_list=args.specific_gene)

    if method == PointFinder.TYPE_BLAST:

        # Check that only one input file is given
        if len(args.inputfiles) != 1:
            sys.exit("Input Error: Blast was chosen as mapping method only 1 "
                     "input file requied, not %s" % (len(args.inputfiles)))

        finder_run = finder.blast(inputfile=args.inputfiles[0],
                                 out_path=args.out_path,
                                 min_cov=0.01,
                                 threshold=args.threshold,
                                 blast=args.method_path,
                                 cut_off=False)
    else:
        inputfile_1 = args.inputfiles[0]
        inputfile_2 = None

        if(len(args.inputfiles) == 2):
            inputfile_2 = args.inputfiles[1]
        finder_run = finder.kma(inputfile_1=inputfile_1,
                             inputfile_2=inputfile_2,
                             out_path=args.out_path,
                             db_path_kma=kma_db_path,
                             databases=[args.species],
                             min_cov=args.min_cov,
                             threshold=args.threshold,
                             kma_path=args.method_path,
                             sample_name=sample_name,
                             kma_mrs=0.5, kma_gapopen=-5, kma_gapextend=-2,
                             kma_penalty=-3, kma_reward=1)

    results = finder_run.results

    if(args.specific_gene):
        results = PointFinder.discard_unwanted_results(
            results=results, wanted=args.specific_gene)

    finder.write_results(out_path=args.out_path, result=results, min_cov=args.min_cov,
                         res_type=method, unknown_flag=args.unknown_mutations)
