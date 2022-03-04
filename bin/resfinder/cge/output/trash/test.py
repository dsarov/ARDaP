#!/usr/bin/env python3
import unittest
from subprocess import PIPE, run
import os
import shutil
import sys
from collections import namedtuple

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from cgecore.cgefinder import CGEFinder
from cge.resfinder import ResFinder
from cge.pointfinder import PointFinder

run_test_dir = "running_test"
working_dir = os.path.dirname(os.path.realpath(__file__))

test_names = ["test1", "test2", "test3", "test4"]


class TestFinder(CGEFinder):

    def __init__(results):
        """
        Marias minimalistic Finder class
        """
        self.results = results

    def resistance_analysis_genes(self):
        """
        Running some analysis that yield results appropriate for resistance
        type results
        """
        Gene = namedtuple("Gene",
                          ["name", "length", "aln_ln", "aln_id", "aln_gaps",
                           "name_variant", "acc", "query", "q_start", "q_end",
                           "q_depth", "t_start", "t_end"])

        analysis_results = {
            "group1": {
                "gene1": None, "gene2": None},
            "group2": {
                "gene3": None},
            "group3": {},
            "group4": {
                "gene1": None}
        }

        analysis_results["group1"]["gene1"] = Gene(
            "gene1", 1000, 890, 0.97, 2, "gene1b", "NC_SOMEGENE", "contig12",
            24, 1024, 50, 1, 1000)
        analysis_results["group1"]["gene2"] = Gene(
            "gene2", 500, 500, 1, 0, None, "NC_SOMEGENE2", "contig3",
            24, 1024, None, 1, 500)
        analysis_results["group2"]["gene3"] = Gene(
            "gene3", 5000, 4500, 0.85, 10, None, "NC_SOMEGENE3", None,
            None, None, 50, 1, 5000)
        analysis_results["group4"]["gene1"] = Gene(
            "gene1", 1000, 890, 0.97, 2, "gene1b", "NC_SOMEGENE", "contig12",
            24, 1024, 49.74, 1, 1000)

        for group in analysis_results:
            for name, gene in group.items():
                self.results.add_gene(
                    template_name=gene.name,
                    template_length=gene.length,
                    template_start_pos=gene.t_start,
                    templare_end_pos=gene.t_end,
                    aln_length=gene.aln_ln,
                    aln_identity=gene.aln_id,
                    aln_gaps=gene.aln_gaps,
                    query_id=gene.query,
                    query_start_pos=gene.q_start,
                    query_end_pos=gene.q_end,
                    query_depth=gene.q_depth
                )

    def resistance_analysis_mutations(self):
        """
        Running some analysis that yield results appropriate for resistance
        type results
        """
        pass

    def resistance_analysis_phenotypes(self):
        """
        Running some analysis that yield results appropriate for resistance
        type results
        """
        pass


class ResFinderRunTest(unittest.TestCase):

    def setUp(self):
        # Change working dir to test dir
        os.chdir(working_dir)
        # Does not allow running two tests in parallel
        os.makedirs(run_test_dir, exist_ok=False)

    def tearDown(self):
        shutil.rmtree(run_test_dir)

    def test_create_and_store_results_in_resistance_type(self):
        """
        Maria has created a CGE service. The service use the cge_core_module
        to create a CGEFinder object, then runs some analysis which stores its
        results using the output module.
        """
        # Maria records when the script is being run
        run_start = time.gmtime(time.time())
        run_start_cge = ",".join(run_start[0], run_start[1], run_start[2],
                                 run_start[3], run_start[4], run_start[5])

        # First she creates a few directories to store her output.
        test1_dir = run_test_dir + "/" + test_names[0]
        os.makedirs(test1_dir)

        # Create
        results = Resistance(date=run_start_cge, name="TestFinder", "0.01", "Fake_ID", dbs)
        finder = TestFinder()
        finder.resistance_analysis_genes()
        finder.resistance_analysis_mutations()
        finder.resistance_analysis_phenotypes()
        out_str = results.dump_json()
        results.dump_json("{}/data.json".format(test1_dir))
