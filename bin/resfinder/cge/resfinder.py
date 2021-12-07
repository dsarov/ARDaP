#!/usr/bin/env python3
from __future__ import division
import sys
import os
import time
import random
import re
from argparse import ArgumentParser
from tabulate import tabulate
import collections

from cgecore.blaster import Blaster
from cgecore.cgefinder import CGEFinder
from .output.table import TableResults


class ResFinder(CGEFinder):

    def __init__(self, db_conf_file, notes, db_path, db_path_kma=None,
                 databases=None):
        """
        """
        self.db_path = db_path

        if(db_path_kma is None):
            self.db_path_kma = db_path
        else:
            self.db_path_kma = db_path_kma

        self.configured_dbs = dict()
        self.kma_db_files = None
        self.load_db_config(db_conf_file=db_conf_file)

        self.databases = []
        self.load_databases(databases=databases)

        self.phenos = dict()
        self.load_notes(notes=notes)

        self.blast_results = None
        # self.kma_results = None
        # self.results = None

    @staticmethod
    def old_results_to_standard_output(result, software, version, run_date,
                                       run_cmd, id, mutation=False,
                                       tableresults=None):
        """
        """
        std_results = TableResults(software, version, run_date, run_cmd, id)
        headers = [
            "template_name",
            "template_length",
            "template_start_pos",
            "template_end_pos",
            "aln_length",
            "aln_identity",
            "aln_gaps",
            "aln_template_string",
            "aln_query_string",
            "aln_homology_string",
            "template_variant",
            "acc_no",
            "query_id",
            "query_start_pos",
            "query_end_pos",
            "query_depth",
            "blast_eval",
            "blast_bitscore",
            "pval",
            "software_score"
        ]

        for db_name, db in result.items():
            if(db_name == "excluded"):
                continue

            if(db == "No hit found"):
                continue

            std_results.add_table(db_name)
            std_db = std_results.long[db_name]
            std_db.add_headers(headers)
            std_db.lock_headers = True

            for unique_id, hit_db in db.items():
                if(unique_id in result["excluded"]):
                    continue
                # TODO: unique_id == unique_db_id
                sbjct = hit_db["sbjct_header"].split("_")
                template = sbjct[0]
                variant = sbjct[1]
                acc = "_".join(sbjct[2:])
                unique_db_id = ("{}_{}".format(template, acc))
                std_db[unique_db_id] = {
                    "template_name": template,
                    "template_variant": variant,
                    "acc_no": acc,
                    "template_length": hit_db["sbjct_length"],
                    "template_start_pos": hit_db["sbjct_start"],
                    "template_end_pos": hit_db["sbjct_end"],
                    "aln_length": hit_db["HSP_length"],
                    "aln_identity": hit_db["perc_ident"],
                    "aln_gaps": hit_db["gaps"],
                    "aln_template_string": hit_db["sbjct_string"],
                    "aln_query_string": hit_db["query_string"],
                    "aln_homology_string": hit_db["homo_string"],
                    "query_id": hit_db["contig_name"],
                    "query_start_pos": hit_db["query_start"],
                    "query_end_pos": hit_db["query_end"],
                    "query_depth": hit_db.get("query_depth", "NA"),
                    "blast_eval": hit_db.get("evalue", "NA"),
                    "blast_bitscore": hit_db.get("bit", "NA"),
                    "pval": hit_db.get("p_value", "NA"),
                    "software_score": hit_db["cal_score"]
                }

        return std_results

    def write_results(self, out_path, result, res_type, software="ResFinder"):
        """
        """
        if(res_type == ResFinder.TYPE_BLAST):
            result_str = self.results_to_str(
                res_type=res_type, results=result.results,
                query_align=result.gene_align_query,
                homo_align=result.gene_align_homo,
                sbjct_align=result.gene_align_sbjct)
        elif(res_type == ResFinder.TYPE_KMA):
            result_str = self.results_to_str(res_type=res_type,
                                             results=result)

        with open(out_path + "/{}_results_tab.txt".format(software), "w") as fh:
            fh.write(result_str[0])
        with open(out_path + "/{}_results_table.txt".format(software), "w") as fh:
            fh.write(result_str[1])
        with open(out_path + "/{}_results.txt".format(software), "w") as fh:
            fh.write(result_str[2])
        with open(out_path + "/{}_Resistance_gene_seq.fsa".format(software), "w") as fh:
            fh.write(result_str[3])
        with open(out_path + "/{}_Hit_in_genome_seq.fsa".format(software), "w") as fh:
            fh.write(result_str[4])

    def blast(self, inputfile, out_path, min_cov=0.9, threshold=0.6,
              blast="blastn", allowed_overlap=0):
        """
        """
        blast_run = Blaster(inputfile=inputfile, databases=self.databases,
                            db_path=self.db_path, out_path=out_path,
                            min_cov=min_cov, threshold=threshold, blast=blast,
                            allowed_overlap=allowed_overlap)
        self.blast_results = blast_run.results
        return blast_run

    def results_to_str(self, res_type, results, query_align=None,
                       homo_align=None, sbjct_align=None):

        if(res_type != ResFinder.TYPE_BLAST
           and res_type != ResFinder.TYPE_KMA):
            sys.exit("resfinder.py error: result method was not provided or "
                     "not recognized.")

        # Write the header for the tab file
        tab_str = ("Resistance gene\tIdentity\tAlignment Length/Gene Length\t"
                   "Coverage\tPosition in reference\tContig\t"
                   "Position in contig\tPhenotype\tAccession no.\n")

        table_str = ""
        txt_str = ""
        ref_str = ""
        hit_str = ""

        # Getting and writing out the results
        titles = dict()
        rows = dict()
        headers = dict()
        txt_file_seq_text = dict()
        split_print = collections.defaultdict(list)

        for db in results:
            if(db == "excluded"):
                 continue

            # Clean up dbs with only excluded hits
            no_hits = True
            for hit in results[db]:
                 if(hit not in results["excluded"]):
                      no_hits = False
                      break
            if(no_hits):
                 results[db] = "No hit found"

            profile = str(self.configured_dbs[db][0])
            if results[db] == "No hit found":
                table_str += ("%s\n%s\n\n" % (profile, results[db]))
            else:
                titles[db] = "%s" % (profile)
                headers[db] = ["Resistance gene", "Identity",
                               "Alignment Length/Gene Length", "Coverage",
                               "Position in reference", "Contig",
                               "Position in contig", "Phenotype",
                               "Accession no."]
                table_str += ("%s\n" % (profile))
                table_str += ("Resistance gene\tIdentity\t"
                              "Alignment Length/Gene Length\tCoverage\t"
                              "Position in reference\tContig\t"
                              "Position in contig\tPhenotype\t"
                              "Accession no.\n")

                rows[db] = list()
                txt_file_seq_text[db] = list()

                for hit in results[db]:
                    if(hit in results["excluded"]):
                         continue

                    res_header = results[db][hit]["sbjct_header"]
                    tmp = res_header.split("_")
                    gene = tmp[0]
                    acc = "_".join(tmp[2:])
                    ID = results[db][hit]["perc_ident"]
                    coverage = results[db][hit]["perc_coverage"]
                    sbjt_length = results[db][hit]["sbjct_length"]
                    HSP = results[db][hit]["HSP_length"]
                    positions_contig = "{}..{}".format(
                        results[db][hit]["query_start"],
                        results[db][hit]["query_end"])
                    positions_ref = "{}..{}".format(
                        results[db][hit]["sbjct_start"],
                        results[db][hit]["sbjct_end"])
                    contig_name = results[db][hit]["contig_name"]
                    pheno = self.phenos.get(gene, ("Warning: gene is missing "
                                                   "from Notes file. Please "
                                                   "inform curator."))

                    pheno = pheno.strip()

                    if "split_length" in results[db][hit]:
                        total_HSP = results[db][hit]["split_length"]
                        split_print[res_header].append([gene, ID, total_HSP,
                                                        sbjt_length, coverage,
                                                        positions_ref,
                                                        contig_name,
                                                        positions_contig,
                                                        pheno, acc])
                        tab_str += ("%s\t%s\t%s/%s\t%s\t%s\t%s\t%s\t%s\t%s\n"
                                    % (gene, ID, HSP, sbjt_length, coverage,
                                       positions_ref, contig_name,
                                       positions_contig, pheno, acc)
                                    )
                    else:
                        # Write tabels
                        table_str += ("%s\t%.2f\t%s/%s\t%s\t%s\t%s\t%s\t%s\t%s"
                                      "\n" % (gene, ID, HSP, sbjt_length,
                                              coverage, positions_ref,
                                              contig_name, positions_contig,
                                              pheno, acc)
                                      )
                        tab_str += ("%s\t%.2f\t%s/%s\t%s\t%s\t%s\t%s\t%s\t%s\n"
                                    % (gene, ID, HSP, sbjt_length, coverage,
                                        positions_ref, contig_name,
                                        positions_contig, pheno, acc)
                                    )

                        # Saving the output to write the txt result table
                        hsp_length = "%s/%s" % (HSP, sbjt_length)
                        rows[db].append([gene, ID, hsp_length, coverage,
                                         positions_ref, contig_name,
                                         positions_contig, pheno, acc])

                    # Writing subjet/ref sequence
                    if(res_type == ResFinder.TYPE_BLAST):
                        ref_seq = sbjct_align[db][hit]
                    elif(res_type == ResFinder.TYPE_KMA):
                        ref_seq = results[db][hit]["sbjct_string"]

                    ref_str += (">%s_%s\n" % (gene, acc))
                    for i in range(0, len(ref_seq), 60):
                        ref_str += ("%s\n" % (ref_seq[i:i + 60]))

                    # Getting the header and text for the txt file output
                    sbjct_start = results[db][hit]["sbjct_start"]
                    sbjct_end = results[db][hit]["sbjct_end"]
                    text = ("%s, ID: %.2f %%, "
                            "Alignment Length/Gene Length: %s/%s, "
                            "Coverage: %s, "
                            "Positions in reference: %s..%s, Contig name: %s, "
                            "Position: %s" % (gene, ID, HSP, sbjt_length,
                                              coverage, sbjct_start, sbjct_end,
                                              contig_name, positions_contig))
                    hit_str += (">%s\n" % text)

                    # Writing query/hit sequence
                    if(res_type == ResFinder.TYPE_BLAST):
                        hit_seq = query_align[db][hit]
                    elif(res_type == ResFinder.TYPE_KMA):
                        hit_seq = results[db][hit]["query_string"]

                    for i in range(0, len(hit_seq), 60):
                        hit_str += ("%s\n" % (hit_seq[i:i + 60]))

                    # Saving the output to print the txt result file allignemts
                    if(res_type == ResFinder.TYPE_BLAST):
                        txt_file_seq_text[db].append((text, ref_seq,
                                                      homo_align[db][hit],
                                                      hit_seq))
                    elif(res_type == ResFinder.TYPE_KMA):
                        txt_file_seq_text[db].append(
                            (text, ref_seq, results[db][hit]["homo_string"],
                             hit_seq))

                for res in split_print:
                    gene = split_print[res][0][0]
                    ID = split_print[res][0][1]
                    HSP = split_print[res][0][2]
                    sbjt_length = split_print[res][0][3]
                    coverage = split_print[res][0][4]
                    positions_ref = split_print[res][0][5]
                    contig_name = split_print[res][0][6]
                    positions_contig = split_print[res][0][7]
                    pheno = split_print[res][0][8]
                    acc = split_print[res][0][9]

                    total_coverage = 0

                    for i in range(1, len(split_print[res])):
                        ID = "%s, %.2f" % (ID, split_print[res][i][1])
                        total_coverage += split_print[res][i][4]
                        positions_ref = (positions_ref + ", "
                                         + split_print[res][i][5])
                        contig_name = (contig_name + ", "
                                       + split_print[res][i][6])
                        positions_contig = (positions_contig + ", "
                                            + split_print[res][i][7])

                    table_str += ("%s\t%s\t%s/%s\t%s\t%s\t%s\t%s\t%s\t%s\n"
                                  % (gene, ID, HSP, sbjt_length, coverage,
                                     positions_ref, contig_name,
                                     positions_contig, pheno, acc)
                                  )

                    hsp_length = "%s/%s" % (HSP, sbjt_length)

                    rows[db].append([gene, ID, hsp_length, coverage,
                                     positions_ref, contig_name,
                                     positions_contig, pheno, acc])

                table_str += ("\n")

        # Writing table txt for all hits
        for db in titles:
            # Txt file table
            table = ResFinder.text_table(titles[db], headers[db], rows[db])
            txt_str += table

        # Writing alignment txt for all hits
        for db in titles:
            # Txt file alignments
            txt_str += ("##################### %s #####################\n"
                        % (db))
            for text in txt_file_seq_text[db]:
                txt_str += ("%s\n\n" % (text[0]))
                for i in range(0, len(text[1]), 60):
                    txt_str += ("%s\n" % (text[1][i:i + 60]))
                    txt_str += ("%s\n" % (text[2][i:i + 60]))
                    txt_str += ("%s\n\n" % (text[3][i:i + 60]))
                txt_str += ("\n")

        return (tab_str, table_str, txt_str, ref_str, hit_str)

    @staticmethod
    def text_table(title, headers, rows, table_format='psql'):
        ''' Create text table

        USAGE:
            >>> from tabulate import tabulate
            >>> title = 'My Title'
            >>> headers = ['A','B']
            >>> rows = [[1,2],[3,4]]
            >>> print(text_table(title, headers, rows))
            +-----------+
            | My Title  |
            +-----+-----+
            |    A |    B |
            +=====+=====+
            |    1 |    2 |
            |    3 |    4 |
            +-----+-----+
        '''
        # Create table
        table = tabulate(rows, headers, tablefmt=table_format)
        # Prepare title injection
        width = len(table.split('\n')[0])
        tlen = len(title)
        if tlen + 4 > width:
            # Truncate oversized titles
            tlen = width - 4
            title = title[:tlen]
        spaces = width - 2 - tlen
        left_spacer = ' ' * int(spaces / 2)
        right_spacer = ' ' * (spaces - len(left_spacer))
        # Update table with title
        table = '\n'.join(['+%s+' % ('-' * (width - 2)),
                           '|%s%s%s|' % (left_spacer,
                                         title, right_spacer),
                          table, '\n'])
        return table

    def load_notes(self, notes):
        with open(notes, 'r') as f:
            for line in f:
                line = line.strip()
                if line.startswith("#"):
                    continue
                else:
                    tmp = line.split(":")

                    self.phenos[tmp[0]] = "%s %s" % (tmp[1], tmp[2])

                    if(tmp[2].startswith("Alternate name; ")):
                        self.phenos[tmp[2][16:]] = "%s %s" % (tmp[1], tmp[2])

    def load_databases(self, databases):
        """
        """
        # Check if databases and config file are correct/correponds
        if databases == '':
            sys.exit("Input Error: No database was specified!\n")
        elif databases is None:
            # Choose all available databases from the config file
            self.databases = self.configured_dbs.keys()
        else:
            # Handle multiple databases
            databases = databases.split(',')
            # Check that the ResFinder DBs are valid
            for db_prefix in databases:
                if db_prefix in self.configured_dbs:
                    self.databases.append(db_prefix)
                else:
                    sys.exit("Input Error: Provided database was not "
                             "recognised! (%s)\n" % db_prefix)

    def load_db_config(self, db_conf_file):
        """
        """
        extensions = []
        with open(db_conf_file) as f:
            for line in f:
                line = line.strip()

                if not line:
                    continue

                if line[0] == '#':
                    if 'extensions:' in line:
                        extensions = [s.strip()
                                      for s in line.split('extensions:')[-1]
                                      .split(',')]
                    continue

                tmp = line.split('\t')
                if len(tmp) != 3:
                    sys.exit(("Input Error: Invalid line in the database"
                              " config file!\nA proper entry requires 3 tab "
                              "separated columns!\n%s") % (line))

                db_prefix = tmp[0].strip()
                name = tmp[1].split('#')[0].strip()
                description = tmp[2]

                # Check if all db files are present
                for ext in extensions:
                    db = "%s/%s.%s" % (self.db_path, db_prefix, ext)
                    if not os.path.exists(db):
                        sys.exit(("Input Error: The database file (%s) "
                                  "could not be found!") % (db))

                if db_prefix not in self.configured_dbs:
                    self.configured_dbs[db_prefix] = []
                self.configured_dbs[db_prefix].append(name)

        if len(self.configured_dbs) == 0:
            sys.exit("Input Error: No databases were found in the "
                     "database config file!")

        # Loading paths for KMA databases.
        for drug in self.configured_dbs:
            kma_db = self.db_path_kma + drug
            self.kma_db_files = [kma_db + ".b", kma_db + ".length.b",
                                 kma_db + ".name.b", kma_db + ".align.b"]


if __name__ == '__main__':

    ##########################################################################
    # PARSE COMMAND LINE OPTIONS
    ##########################################################################

    parser = ArgumentParser()
    parser.add_argument("-i", "--inputfile",
                              dest="inputfile",
                              help="Input file",
                              default=None)
    parser.add_argument("-1", "--fastq1",
                              help="Raw read data file 1.",
                              default=None)
    parser.add_argument("-2", "--fastq2",
                              help="Raw read data file 2 (only required if \
                                    data is paired-end).",
                              default=None)
    parser.add_argument("-o", "--outputPath",
                              dest="out_path",
                              help="Path to blast output",
                              default='')

    parser.add_argument("-b", "--blastPath",
                              dest="blast_path",
                              help="Path to blast",
                              default='blastn')
    parser.add_argument("-p", "--databasePath",
                              dest="db_path",
                              help="Path to the databases",
                              default='')

    parser.add_argument("-k", "--kmaPath",
                              dest="kma_path",
                              help="Path to KMA",
                              default=None)
    parser.add_argument("-q", "--databasePathKMA",
                              dest="db_path_kma",
                              help="Path to the directories containing the \
                                    KMA indexed databases. Defaults to the \
                                    directory 'kma_indexing' inside the \
                                    databasePath directory.",
                              default=None)

    parser.add_argument("-d", "--databases",
                              dest="databases",
                              help="Databases chosen to search in - if none \
                                    are specified all are used",
                              default=None)
    parser.add_argument("-l", "--min_cov",
                              dest="min_cov",
                              help="Minimum coverage",
                              default=0.60)
    parser.add_argument("-t", "--threshold",
                              dest="threshold",
                              help="Blast threshold for identity",
                              default=0.90)
    parser.add_argument("-nano", "--nanopore",
                        action="store_true",
                        dest="nanopore",
                        help="If nanopore data is used",
                        default=False)
    args = parser.parse_args()

    ##########################################################################
    # MAIN
    ##########################################################################

    # Defining varibales

    min_cov = args.min_cov
    threshold = args.threshold

    # Check if valid database is provided
    if args.db_path is None:
            sys.exit("Input Error: No database directory was provided!\n")
    elif not os.path.exists(args.db_path):
        sys.exit("Input Error: The specified database directory does not "
                 "exist!\n")
    else:
        # Check existence of config file
        db_config_file = '%s/config' % (args.db_path)
        if not os.path.exists(db_config_file):
            sys.exit("Input Error: The database config file could not be "
                     "found!")
        # Save path
        db_path = args.db_path

    # Check existence of notes file
    notes_path = "%s/notes.txt" % (args.db_path)
    if not os.path.exists(notes_path):
        sys.exit('Input Error: notes.txt not found! (%s)' % (notes_path))

    # Check for input
    if args.inputfile is None and args.fastq1 is None:
        sys.exit("Input Error: No Input were provided!\n")

    # Check if valid input file for assembly is provided
    if args.inputfile:
        if not os.path.exists(args.inputfile):
            sys.exit("Input Error: Input file does not exist!\n")
        else:
            inputfile = args.inputfile
    else:
        inputfile = None

    # Check if valid input files for raw data
    if args.fastq1:

        if not os.path.exists(args.fastq1):
            sys.exit("Input Error: fastq1 file does not exist!\n")
        else:
            input_fastq1 = args.fastq1

        if args.fastq2:
            if not os.path.exists(args.fastq2):
                sys.exit("Input Error: fastq2 file does not exist!\n")
            else:
                input_fastq2 = args.fastq2
        else:
            input_fastq2 = None
    else:
        input_fastq1 = None
        input_fastq2 = None

    # Check if valid output directory is provided
    if not os.path.exists(args.out_path):
        sys.exit("Input Error: Output dirctory does not exists!\n")
    else:
        out_path = args.out_path

    # If input is an assembly, then use BLAST
    if(inputfile is not None):
        finder = ResFinder(db_conf_file=db_config_file,
                           databases=args.databases,
                           db_path=db_path, notes=notes_path)

        blast_run = finder.blast(inputfile=inputfile, out_path=out_path,
                                 min_cov=min_cov, threshold=threshold,
                                 blast=args.blast_path)

        finder.write_results(out_path=out_path, result=blast_run,
                             res_type=ResFinder.TYPE_BLAST)

    # If the input is raw read data, then use KMA
    elif(input_fastq1 is not None):
        finder = ResFinder(db_conf_file=db_config_file,
                           databases=args.databases,
                           db_path=db_path, db_path_kma=args.db_path_kma,
                           notes=notes_path)

        # if input_fastq2 is None, it is ignored by the kma method.
        if args.nanopore:
            kma_run = finder.kma(inputfile_1=input_fastq1,
                                 inputfile_2=input_fastq2, kma_add_args='-ont -md 5')
        else:
            kma_run = finder.kma(inputfile_1=input_fastq1,
                                 inputfile_2=input_fastq2)

        finder.write_results(out_path=out_path, result=kma_run,
                             res_type=ResFinder.TYPE_KMA)
