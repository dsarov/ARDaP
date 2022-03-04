#!/usr/bin/env python3
import sys
import os
import subprocess
from argparse import ArgumentParser
import pickle

from cge.resfinder import ResFinder
from cge.pointfinder import PointFinder

#  Modules used to create the extended ResFinder output (phenotype output)
from cge.phenotype2genotype.isolate import Isolate
from cge.phenotype2genotype.res_profile import PhenoDB
from cge.phenotype2genotype.res_sumtable import ResSumTable
from cge.phenotype2genotype.res_sumtable import PanelNameError
from cge.out.util.generator import Generator
from cge.standardize_results import ResFinderResultHandler, DatabaseHandler
from cge.standardize_results import PointFinderResultHandler

import json
# TODO list:
# TODO: Add input data check


# ########################################################################### #
# #########                                 FUNCTIONS               ######### #
# ########################################################################### #


def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

# TODO: Add fix species choice
species_transl = {"c. jejuni": "campylobacter jejuni",
                  "c.jejuni": "campylobacter jejuni",
                  "c jejuni": "campylobacter jejuni",
                  "c. coli": "campylobacter coli",
                  "c.coli": "campylobacter coli",
                  "c coli": "campylobacter coli",
                  "e. coli": "escherichia coli",
                  "e.coli": "escherichia coli",
                  "e coli": "escherichia coli",
                  "ecoli": "escherichia coli",
                  "s. enterica": "salmonella enterica",
                  "s.enterica": "salmonella enterica",
                  "s enterica": "salmonella enterica",
                  "senterica": "salmonella enterica",
                  }

##########################################################################
# PARSE COMMAND LINE OPTIONS
##########################################################################

parser = ArgumentParser(allow_abbrev=False)

# General options
parser.add_argument("-ifa", "--inputfasta",
                    help="Input fasta file.",
                    default=None)
parser.add_argument("-ifq", "--inputfastq",
                    help="Input fastq file(s). Assumed to be single-end fastq \
                          if only one file is provided, and assumed to be \
                          paired-end data if two files are provided.",
                    nargs="+",
                    default=None)

parser.add_argument("-o", "--outputPath",
                    dest="out_path",
                    help="Path to blast output",
                    default='')
parser.add_argument("-b", "--blastPath",
                    dest="blast_path",
                    help="Path to blastn",
                    default='blastn')
parser.add_argument("-k", "--kmaPath",
                    dest="kma_path",
                    help="Path to KMA",
                    default=None)
parser.add_argument("-s", "--species",
                    help="Species in the sample",
                    default=None)

# Acquired resistance options
parser.add_argument("-db_res", "--db_path_res",
                    help="Path to the databases for ResFinder",
                    default=None)
parser.add_argument("-db_res_kma", "--db_path_res_kma",
                    help="Path to the ResFinder databases indexed with KMA. \
                          Defaults to the 'kma_indexing' directory inside the \
                          given database directory.",
                    default=None)
parser.add_argument("-d", "--databases",
                    dest="databases",
                    help="Databases chosen to search in - if none is specified\
                          all is used",
                    default=None)
parser.add_argument("-acq", "--acquired",
                    action="store_true",
                    dest="acquired",
                    help="Run resfinder for acquired resistance genes",
                    default=False)
parser.add_argument("-ao", "--acq_overlap",
                    help="Genes are allowed to overlap this number of\
                          nucleotides. Default: 30.",
                    type=int,
                    default=30)
parser.add_argument("-l", "--min_cov",
                    dest="min_cov",
                    help="Minimum (breadth-of) coverage of ResFinder within the range 0-1.",
                    type=float,
                    default=0.60)
parser.add_argument("-t", "--threshold",
                    dest="threshold",
                    help="Threshold for identity of ResFinder within the range 0-1.",
                    type=float,
                    default=0.80)
parser.add_argument("-nano", "--nanopore",
                        action="store_true",
                        dest="nanopore",
                        help="If nanopore data is used",
                        default=False)
# Point resistance option
parser.add_argument("-c", "--point",
                    action="store_true",
                    dest="point",
                    help="Run pointfinder for chromosomal mutations",
                    default=False)
parser.add_argument("-db_point", "--db_path_point",
                    help="Path to the databases for PointFinder",
                    default=None)
parser.add_argument("-db_point_kma", "--db_path_point_kma",
                    help="Path to the PointFinder databases indexed with KMA. \
                          Defaults to the 'kma_indexing' directory inside the \
                          given database directory.",
                    default=None)
parser.add_argument("-g",
                    dest="specific_gene",
                    nargs='+',
                    help="Specify genes existing in the database to \
                          search for - if none is specified all genes are \
                          included in the search.",
                    default=None)
parser.add_argument("-u", "--unknown_mut",
                    dest="unknown_mutations",
                    action="store_true",
                    help="Show all mutations found even if in unknown to the\
                          resistance database",
                    default=False)
parser.add_argument("-l_p", "--min_cov_point",
                    dest="min_cov_point",
                    help="Minimum (breadth-of) coverage of Pointfinder within the range 0-1. \
                          If None is selected, the minimum coverage of \
                          ResFinder will be used.",
                    type=float,
                    default=None)
parser.add_argument("-t_p", "--threshold_point",
                    dest="threshold_point",
                    help="Threshold for identity of Pointfinder within the range 0-1. \
                          If None is selected, the minimum coverage of \
                          ResFinder will be used.",
                    type=float,
                    default=None)
# Temporary option only available temporary
parser.add_argument("--pickle",
                    action="store_true",
                    help="Create a pickle dump of the Isolate object. \
                          Currently needed in the CGE webserver. Dependency \
                          and this option is being removed.",
                    default=False)

args = parser.parse_args()

if(args.species is not None and args.species.lower() == "other"):
    args.species = None

if(args.point and not args.species):
    sys.exit("ERROR: Chromosomal point mutations cannot be located if no "
             "species has been provided. Please provide species using the "
             "--species option.")

# Check if coverage/identity parameters are valid
if(args.min_cov > 1.0 or args.min_cov < 0.0):
    sys.exit("ERROR: Minimum coverage above 1 or below 0 is not allowed. Please select a minimum coverage within the range 0-1 with the flag -l.")

if(args.threshold > 1.0 or args.threshold < 0.0):
    sys.exit("ERROR: Threshold for identity of ResFinder above 1 or below 0 is not allowed. Please select a threshold for identity within the range 0-1 with the flag -t.")


# Create a "sample" name
if(args.inputfasta):
    args.inputfasta = os.path.abspath(args.inputfasta)
    if(not os.path.isfile(args.inputfasta)):
        sys.exit("ERROR: Input FASTA file not found: " + args.inputfasta)
    sample_name = os.path.basename(args.inputfasta)
    method = PointFinder.TYPE_BLAST
else:
    sample_name = os.path.basename(args.inputfastq[0])
    method = PointFinder.TYPE_KMA

if(args.inputfastq):
    inputfastq_1 = args.inputfastq[0]
    inputfastq_1 = os.path.abspath(inputfastq_1)
    if(not os.path.isfile(inputfastq_1)):
        sys.exit("ERROR: Input fastq file 1 not found: " + inputfastq_1)
    if(len(args.inputfastq) == 2):
        inputfastq_2 = args.inputfastq[1]
        inputfastq_2 = os.path.abspath(inputfastq_2)
        if(not os.path.isfile(inputfastq_2)):
            sys.exit("ERROR: Input fastq file 2 not found: " + inputfastq_2)
    else:
        inputfastq_2 = None

blast = args.blast_path
if(args.inputfasta):
    try:
        _ = subprocess.check_output([blast, "-h"])
    except FileNotFoundError as e:
        sys.exit("ERROR: Unable to execute blastn from the path: {}"
                 .format(blast))

# Check KMA path cge/kma/kma
if(args.inputfastq):
    if(args.kma_path is None):
        kma = (os.path.dirname(os.path.realpath(__file__)) + "/cge/kma/kma")
        kma = os.path.abspath(kma)
        try:
            _ = subprocess.check_output([kma, "-h"])
        except FileNotFoundError as e:
            kma = "kma"
    else:
        kma = args.kma_path
    try:
        _ = subprocess.check_output([kma, "-h"])
    except FileNotFoundError as e:
        sys.exit("ERROR: Unable to execute kma from the path: {}".format(kma))
else:
    kma = None

db_path_point = None

if(args.species):
    args.species = args.species.lower()

    fixed_species = species_transl.get(args.species, None)
    if(fixed_species):
        args.species = fixed_species

    tmp_list = args.species.split()
    if(len(tmp_list) != 1 and len(tmp_list) != 2):
        sys.exit("ERROR: Species name must contain 1 or 2 names.")

    # Check Poinfinder database
    if(args.point):
        if(len(tmp_list) == 2):
            point_species = "_".join(tmp_list)
        else:
            point_species = tmp_list[0]

        if(args.db_path_point is None and args.point):
            db_path_point = (os.path.dirname(
                os.path.realpath(__file__)) + "/db_pointfinder")
        elif(args.db_path_point is not None):
            db_path_point = args.db_path_point

        db_path_point = os.path.abspath(db_path_point)
        point_dbs = PointFinder.get_db_names(db_path_point)

        # Check if a database for species exists
        if(point_species not in point_dbs and args.point):
            # If not db for species is found check if db for genus is found
            # and use that instead
            if(tmp_list[0] in point_dbs):
                point_species = tmp_list[0]
            else:
                sys.exit("ERROR: species '%s' (%s) does not seem to exist"
                         " as a PointFinder database."
                         % (args.species, point_species))

        db_path_point_root = db_path_point
        db_path_point = db_path_point + "/" + point_species

# Check output directory
args.out_path = os.path.abspath(args.out_path)
os.makedirs(args.out_path, exist_ok=True)

if args.acquired is False and args.point is False:
    sys.exit("Please specify to look for acquired resistance genes, "
             "chromosomal mutaitons or both!\n")

# Check ResFinder database
if(args.db_path_res is None):
    args.db_path_res = (os.path.dirname(
        os.path.realpath(__file__)) + "/db_resfinder")
args.db_path_res = os.path.abspath(args.db_path_res)
if(not os.path.exists(args.db_path_res)):
    sys.exit("Could not locate ResFinder database path: %s"
             % args.db_path_res)

if(args.db_path_res_kma is None and args.acquired and args.inputfastq):
    args.db_path_res_kma = args.db_path_res
    if(not os.path.exists(args.db_path_res_kma)):
        sys.exit("Could not locate ResFinder database index path: %s"
                 % args.db_path_res_kma)

min_cov = float(args.min_cov)

# Initialise result dict
init_software_result = {"software_name": "ResFinder"}
git_path = os.path.abspath(os.path.dirname(__file__))
std_result = Generator.init_software_result(name="ResFinder", gitdir=git_path)

if(args.acquired):
    DatabaseHandler.load_database_metadata("ResFinder", std_result,
                                           args.db_path_res)
if(args.point):
    DatabaseHandler.load_database_metadata("PointFinder", std_result,
                                           db_path_point_root)
##########################################################################
# ResFinder
##########################################################################

if args.acquired is True:

    databases = args.databases
    threshold = float(args.threshold)

    if(args.inputfasta):
        out_res_blast = args.out_path + "/resfinder_blast"
        os.makedirs(out_res_blast, exist_ok=True)
    if(args.inputfastq):
        out_res_kma = args.out_path + "/resfinder_kma"
        os.makedirs(out_res_kma, exist_ok=True)

    db_path_res = args.db_path_res

    # Check if valid database is provided
    if(db_path_res is None):
        db_path_res = (os.path.dirname(os.path.realpath(__file__))
                       + "/db_resfinder")

    if not os.path.exists(db_path_res):
        sys.exit("Input Error: The specified database directory does not "
                 "exist!\nProvided path: " + str(db_path_res))
    else:
        # Check existence of config file
        db_config_file = '%s/config' % (db_path_res)
        if not os.path.exists(db_config_file):
            sys.exit("Input Error: The database config file could not be "
                     "found!")

    # Check existence of notes file
    notes_path = "%s/notes.txt" % (db_path_res)
    if not os.path.exists(notes_path):
        sys.exit('Input Error: notes.txt not found! (%s)' % (notes_path))

    blast_results = None
    kma_results = None

    # Actually running ResFinder (for acquired resistance)
    acquired_finder = ResFinder(db_conf_file=db_config_file,
                                databases=args.databases, db_path=db_path_res,
                                notes=notes_path,
                                db_path_kma=args.db_path_res_kma)

    if(args.inputfasta):
        blast_results = acquired_finder.blast(inputfile=args.inputfasta,
                                              out_path=out_res_blast,
                                              min_cov=min_cov,
                                              threshold=threshold,
                                              blast=blast,
                                              allowed_overlap=args.acq_overlap)

        # DEPRECATED
        # use std_result
        new_std_res = ResFinder.old_results_to_standard_output(
            blast_results.results, software="ResFinder", version="4.1.0",
            run_date="fake_run_date", run_cmd="Fake run cmd",
            id=sample_name)

        # DEPRECATED
        # use std_result
        acquired_finder.write_results(out_path=args.out_path,
                                      result=blast_results,
                                      res_type=ResFinder.TYPE_BLAST)

        ResFinderResultHandler.standardize_results(std_result,
                                                   blast_results.results,
                                                   "ResFinder")
#DEBUG
#        print("STD RESULT:\n{}".format(json.dumps(std_result)))

    else:
        if args.nanopore:
            kma_run = acquired_finder.kma(inputfile_1=inputfastq_1,
                                          inputfile_2=inputfastq_2,
                                          out_path=out_res_kma,
                                          db_path_kma=args.db_path_res_kma,
                                          databases=acquired_finder.databases,
                                          min_cov=min_cov,
                                          threshold=args.threshold,
                                          kma_path=kma,
                                          sample_name="",
                                          kma_cge=True,
                                          kma_apm="p",
                                          kma_1t1=True,
                                          kma_add_args='-ont -md 5')
        else:
            kma_run = acquired_finder.kma(inputfile_1=inputfastq_1,
                                          inputfile_2=inputfastq_2,
                                          out_path=out_res_kma,
                                          db_path_kma=args.db_path_res_kma,
                                          databases=acquired_finder.databases,
                                          min_cov=min_cov,
                                          threshold=args.threshold,
                                          kma_path=kma,
                                          sample_name="",
                                          kma_cge=True,
                                          kma_apm="p",
                                          kma_1t1=True)

        # DEPRECATED
        # use std_result
        new_std_res = ResFinder.old_results_to_standard_output(
            kma_run.results, software="ResFinder", version="4.1.0",
            run_date="fake_run_date", run_cmd="Fake run cmd",
            id=sample_name)

        # DEPRECATED
        # use std_result
        acquired_finder.write_results(out_path=args.out_path,
                                      result=kma_run.results,
                                      res_type=ResFinder.TYPE_KMA)

        ResFinderResultHandler.standardize_results(std_result,
                                                   kma_run.results,
                                                   "ResFinder")
#DEBUG
#        print("STD RESULT:\n{}".format(json.dumps(std_result)))

##########################################################################
# PointFinder
##########################################################################

if args.point is True and args.species:

    if(args.inputfasta):
        out_point = os.path.abspath(args.out_path + "/pointfinder_blast")
        os.makedirs(out_point, exist_ok=True)
    if(args.inputfastq):
        out_point = os.path.abspath(args.out_path + "/pointfinder_kma")
        os.makedirs(out_point, exist_ok=True)

    if args.min_cov_point is None:
        min_cov_point = args.min_cov
    else:
        min_cov_point = args.min_cov_point
        if(args.min_cov_point > 1.0 or args.min_cov_point < 0.0):
            sys.exit("ERROR: Minimum coverage above 1 or below 0 is not allowed. Please select a minimum coverage within the range 0-1 with the flag -l_p.")

    if args.threshold_point is None:
        threshold_point = args.threshold
    else:
        threshold_point = args.threshold_point
        if(args.threshold_point > 1.0 or args.threshold_point < 0.0):
            sys.exit("ERROR: Threshold for identity of PointFinder above 1 or below 0 is not allowed. Please select a threshold for identity within the range 0-1 with the flag -t_p.")

    finder = PointFinder(db_path=db_path_point, species=point_species,
                         gene_list=args.specific_gene)

    if(args.inputfasta):
        blast_run = finder.blast(inputfile=args.inputfasta,
                                 out_path=out_point,
                        #         min_cov=min_cov_point,
                                 min_cov=0.01,
                                 threshold=threshold_point,
                                 blast=blast,
                                 cut_off=False)
        results = blast_run.results

    else:

        method = PointFinder.TYPE_KMA

        kma_run = finder.kma(inputfile_1=inputfastq_1,
                             inputfile_2=inputfastq_2,
                             out_path=out_point,
                             db_path_kma=db_path_point,
                             databases=[point_species],
                             min_cov=0.01,
                        #    min_cov=min_cov_point,
                             threshold=threshold_point,
                             kma_path=kma,
                             sample_name="",
                             kma_cge=True,
                             kma_apm="p",
                             kma_1t1=True)

        results = kma_run.results

    if(args.specific_gene):
        results = PointFinder.discard_unwanted_results(
            results=results, wanted=args.specific_gene)

    if(method == PointFinder.TYPE_BLAST):
        results_pnt = finder.find_best_seqs(results, min_cov)
    else:
        results_pnt = results[finder.species]
        if(results_pnt == "No hit found"):
            results_pnt = {}
        else:
            results_pnt["excluded"] = results["excluded"]

    # DEPRECATED
    # use std_result
    new_std_pnt = finder.old_results_to_standard_output(
        result=results_pnt, software="ResFinder", version="4.1.0",
        run_date="fake_run_date", run_cmd="Fake run cmd",
        id=sample_name)

    # DEPRECATED
    # use std_result
    finder.write_results(out_path=args.out_path, result=results,
                         res_type=method, unknown_flag=args.unknown_mutations,
                         min_cov=min_cov_point, perc_iden=threshold_point)

#DEBUG
#    print("POINT RES:\n{}".format(json.dumps(results_pnt)))

    PointFinderResultHandler.standardize_results(std_result,
                                                 results_pnt,
                                                 "PointFinder")

#DEBUG
#        print("STD RESULT:\n{}".format(json.dumps(std_result)))
##########################################################################
# Phenotype to genotype
##########################################################################

# Load genotype to phenotype database
if(db_path_point):
    point_file = db_path_point + "/resistens-overview.txt"
else:
    point_file = None

res_pheno_db = PhenoDB(
    abclassdef_file=(args.db_path_res + "/antibiotic_classes.txt"),
    acquired_file=args.db_path_res + "/phenotypes.txt", point_file=point_file)
# Isolate object store results
isolate = Isolate(name=sample_name)
if(args.acquired):
    isolate.load_finder_results(std_table=std_result,
                                phenodb=res_pheno_db,
                                type="genes")
    # isolate.load_finder_results(std_table=std_result,
    #                             phenodb=res_pheno_db)
    # isolate.load_finder_results(std_table=new_std_res,
    #                             phenodb=res_pheno_db)
if(args.point):
    isolate.load_finder_results(std_table=std_result,
                                phenodb=res_pheno_db,
                                type="seq_variations")
    # isolate.load_finder_results_old(std_table=new_std_pnt,
    #                                 phenodb=res_pheno_db)
    # isolate.load_pointfinder_tab(args.out_path + "/PointFinder_results.txt",
    #                                      res_pheno_db)
isolate.calc_res_profile(res_pheno_db)
if(args.acquired):
    ResFinderResultHandler.load_res_profile(std_result, isolate)
if(args.point):
    PointFinderResultHandler.load_res_profile(std_result, isolate)


#TODO
std_result_file = "{}/std_format_under_development.json".format(args.out_path)
with open(std_result_file, 'w') as fh:
    fh.write(json.dumps(std_result))

# Create and write the downloadable tab file
pheno_profile_str = isolate.profile_to_str_table(header=True)
# TODO: REMOVE THE NEED FOR THE PICKLED FILE
if(args.pickle):
    isolate_pickle = open("{}/isolate.p".format(args.out_path), "wb")
    pickle.dump(isolate, isolate_pickle, protocol=2)

pheno_table_file = args.out_path + '/pheno_table.txt'
with open(pheno_table_file, 'w') as fh:
    fh.write(pheno_profile_str)

if(args.species is not None):
    # Apply AMR panel
    input_amr_panels = args.db_path_res + "/phenotype_panels.txt"
    res_sum_table = ResSumTable(pheno_profile_str)
    res_sum_table.load_amr_panels(input_amr_panels)

    try:
        panel_profile_str = res_sum_table.get_amr_panel_str(
            panel_name_raw=args.species, header=True)
    # If specified species does not have an associated panel, just ignore it
    # and exit.
    except PanelNameError:
        eprint("Warning: No panel was detected for the species: {}"
               .format(args.species))
        sys.exit()

    amr_panel_filename = args.species.replace(" ", "_")

    panel_tabel_file = (pheno_table_file[:-4] + "_" + amr_panel_filename
                        + ".txt")
    with open(panel_tabel_file, "w") as fh:
        fh.write(panel_profile_str)

sys.exit()
