#!/usr/bin/env python3
import unittest
from subprocess import PIPE, run
import os
import shutil
import sys
import argparse


# This is not best practice but for testing, this is the best I could
# come up with
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

# TODO: Species specific aqquired genes only pheno results, not spec specific?

test_names = ["test1", "test2", "test3", "test4"]
test_data = {
    # Test published acquired resistance
    test_names[0]: "data/test_isolate_01.fa",
    test_names[1]: "data/test_isolate_01_1.fq data/test_isolate_01_2.fq",
    # Test published point mut resistance
    test_names[2]: "data/test_isolate_05.fa",
    test_names[3]: "data/test_isolate_05_1.fq data/test_isolate_05_2.fq",
}
run_test_dir = "running_test"
working_dir = os.path.dirname(os.path.realpath(__file__))


class ResFinderRunTest(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        # Delete "running_test" folder from previous tests if still exists
        if os.path.isdir(run_test_dir):
            try:
                shutil.rmtree(run_test_dir)
            # The following error has occured using VirtualBox under Windows 10
            # with ResFinder installed in a shared folder:
            #   OSError [Errno: 26] Text file busy: 'tmp'
            except OSError:
                procs = run(["rm", "-r", run_test_dir])

        # Set absolute path for database folders and external programs
        cls.db_path_res = os.path.abspath(args.db_path_res)
        cls.blastPath = os.path.abspath(args.blast_path)
        cls.kmaPath = os.path.abspath(args.kma_path)
        cls.db_path_point = os.path.abspath(args.db_path_point)
        cls.dir_res = os.path.join(os.path.dirname(__file__), '../', )
        cls.dir_res = os.path.abspath(cls.dir_res)
        # Change working dir to test dir
        os.chdir(working_dir)
        # Does not allow running two tests in parallel
        os.makedirs(run_test_dir, exist_ok=False)

    @classmethod
    def tearDownClass(cls):
        try:
            shutil.rmtree(run_test_dir)
        # The following error has occured using VirtualBox under Windows 10
        # with ResFinder installed in a shared folder:
        #   OSError [Errno: 26] Text file busy: 'tmp'
        except OSError:
            procs = run(["rm", "-r", run_test_dir])

    def test_on_data_with_just_acquired_resgene_using_blast(self):
        # Maria has an E. coli isolate, with unknown resistance.
        # At first, she just wants to know which acquired resistance genes are
        # found in the genome.
        # She therefore runs resfinder cmd line.

        # First Maria checks out the documentation.
        procs = run("python3 ../run_resfinder.py -h", shell=True, stdout=PIPE,
                    check=True)
        output = procs.stdout.decode()
        self.assertIn("--help", output)

        # Maria goes on to run ResFinder for acquired genes with her E. coli
        # isolate.
        # First she creates a few directories to store her output.
        test1_dir = run_test_dir + "/" + test_names[0]
        os.makedirs(test1_dir)
        # Then she runs run_resfinder with her first isolate.
        cmd_acquired = ("python3  " + self.dir_res + "/run_resfinder.py"
                        + " -ifa " + test_data[test_names[0]]
                        + " -o " + test1_dir
                        + " -s 'Escherichia coli'"
                        + " --min_cov 0.6"
                        + " -t 0.8"
                        + " --acquired"
                        + " --db_path_res " + self.db_path_res
                        + " --blastPath " + self.blastPath)

        procs = run(cmd_acquired, shell=True, stdout=PIPE, stderr=PIPE,
                    check=True)

        fsa_hit = test1_dir + "/ResFinder_Hit_in_genome_seq.fsa"
        fsa_res = test1_dir + "/ResFinder_Resistance_gene_seq.fsa"
        res_table = test1_dir + "/ResFinder_results_table.txt"
        res_tab = test1_dir + "/ResFinder_results_tab.txt"
        results = test1_dir + "/ResFinder_results.txt"

        with open(fsa_hit, "r") as fh:
            check_result = fh.readline()
        self.assertIn("blaB-2_1_AF189300", check_result)

        with open(fsa_res, "r") as fh:
            check_result = fh.readline()
        self.assertIn("blaB-2_AF189300", check_result)

        with open(res_table, "r") as fh:
            for line in fh:
                if(line.startswith("blaB-2")):
                    check_result = line
                    break
        self.assertIn("blaB-2_1_AF189300", check_result)

        with open(res_tab, "r") as fh:
            fh.readline()
            check_result = fh.readline()
        self.assertIn("blaB-2_1_AF189300", check_result)

        with open(results, "r") as fh:
            fh.readline()
            fh.readline()
            fh.readline()
            fh.readline()
            fh.readline()
            check_result = fh.readline()
        self.assertIn("blaB-2_1_AF189300", check_result)

    def test_on_data_with_just_acquired_resgene_using_kma(self):
        # Maria has another E. coli isolate, with unknown resistance.
        # This time she does not have an assembly, but only raw data.
        # She therefore runs resfinder cmd line using KMA.

        # First she creates a few directories to store her output.
        test2_dir = run_test_dir + "/" + test_names[1]
        os.makedirs(test2_dir, exist_ok=False)

        # Then she runs run_resfinder with her first isolate.
        cmd_acquired = ("python3 " + self.dir_res + "/run_resfinder.py"
                        + " -ifq " + test_data[test_names[1]]
                        + " -o " + test2_dir
                        + " -s 'Escherichia coli'"
                        + " --min_cov 0.6"
                        + " -t 0.8"
                        + " --acquired"
                        + " --db_path_res " + self.db_path_res
                        + " --kmaPath " + self.kmaPath)

        procs = run(cmd_acquired, shell=True, stdout=PIPE, stderr=PIPE,
                    check=True)

        fsa_hit = test2_dir + "/ResFinder_Hit_in_genome_seq.fsa"
        fsa_res = test2_dir + "/ResFinder_Resistance_gene_seq.fsa"
        res_table = test2_dir + "/ResFinder_results_table.txt"
        res_tab = test2_dir + "/ResFinder_results_tab.txt"
        results = test2_dir + "/ResFinder_results.txt"

        with open(fsa_hit, "r") as fh:
            check_result = fh.readline()
        self.assertIn("blaB-2", check_result)

        with open(fsa_res, "r") as fh:
            check_result = fh.readline()
        self.assertIn("blaB-2_AF189300", check_result)

        with open(res_table, "r") as fh:
            for line in fh:
                if(line.startswith("blaB-2")):
                    check_result = line
                    break
        self.assertIn("blaB-2", check_result)

        with open(res_tab, "r") as fh:
            fh.readline()
            check_result = fh.readline()
        self.assertIn("blaB-2", check_result)

        with open(results, "r") as fh:
            fh.readline()
            fh.readline()
            fh.readline()
            fh.readline()
            fh.readline()
            check_result = fh.readline()
        self.assertIn("blaB-2", check_result)

    def test_on_data_with_just_point_mut_using_blast(self):
        # Maria also wants to check her assembled E. coli isolate for
        # resistance caused by point mutations.

        # First she creates a few directories to store her output.
        test3_dir = run_test_dir + "/" + test_names[2]
        os.makedirs(test3_dir)

        # Then she runs run_resfinder with her first isolate.
        cmd_point = ("python3 " + self.dir_res + "/run_resfinder.py"
                     + " -ifa " + test_data[test_names[2]]
                     + " -o " + test3_dir
                     + " -s 'Escherichia coli'"
                     + " --min_cov 0.6"
                     + " --threshold 0.8"
                     + " --point"
                     + " --db_path_point " + self.db_path_point
                     + " --db_path_res " + self.db_path_res
                     + " --blastPath " + self.blastPath)

        procs = run(cmd_point, shell=True, stdout=PIPE, stderr=PIPE,
                    check=True)

        # Expected output files
        pf_pred = test3_dir + "/PointFinder_prediction.txt"
        pf_res = test3_dir + "/PointFinder_results.txt"
        pf_table = test3_dir + "/PointFinder_table.txt"

        with open(pf_res, "r") as fh:
            fh.readline()
            check_result = fh.readline()
        self.assertIn("gyrA", check_result)
        self.assertIn("p.S83A", check_result)

        point_mut_found = False
        with open(pf_table, "r") as fh:
            for line in fh:
                if(line.startswith("gyrA p.S83A")):
                    check_result = line
                    point_mut_found = True
                    break
        self.assertEqual(point_mut_found, True)

    def test_on_data_with_just_point_mut_using_kma(self):
        # Maria has another E. coli isolate, with unknown resistance.
        # This time she does not have an assembly, but only raw data.
        # She therefore runs resfinder cmd line using KMA.

        # First she creates a few directories to store her output.
        test4_dir = run_test_dir + "/" + test_names[3]
        os.makedirs(test4_dir, exist_ok=False)

        # Then she runs run_resfinder with her first isolate.
        cmd_acquired = ("python3 " + self.dir_res + "/run_resfinder.py"
                        + " -ifq " + test_data[test_names[3]]
                        + " -o " + test4_dir
                        + " -s 'Escherichia coli'"
                        + " --min_cov 0.6"
                        + " --threshold 0.8"
                        + " --point"
                        + " --db_path_point " + self.db_path_point
                        + " --db_path_res " + self.db_path_res
                        + " --kmaPath " + self.kmaPath)

        procs = run(cmd_acquired, shell=True, stdout=PIPE, stderr=PIPE,
                    check=True)

        # Expected output files
        pf_pred = test4_dir + "/PointFinder_prediction.txt"
        pf_res = test4_dir + "/PointFinder_results.txt"
        pf_table = test4_dir + "/PointFinder_table.txt"

        with open(pf_res, "r") as fh:
            fh.readline()
            check_result = fh.readline()
        self.assertIn("gyrA", check_result)
        self.assertIn("p.S83A", check_result)

        point_mut_found = False
        with open(pf_table, "r") as fh:
            for line in fh:
                if(line.startswith("gyrA p.S83A")):
                    check_result = line
                    point_mut_found = True
                    break
        self.assertEqual(point_mut_found, True)


def parse_args():
    parser = argparse.ArgumentParser(add_help=False, allow_abbrev=False)
    group = parser.add_argument_group("Options")
    group.add_argument('-res_help', "--resfinder_help",
                       action="help")
    group.add_argument("-db_res", "--db_path_res",
                       help="Path to the databases for ResFinder",
                       default="./db_resfinder")
    group.add_argument("-b", "--blastPath",
                       dest="blast_path",
                       help="Path to blastn",
                       default="./cge/blastn")
    group.add_argument("-k", "--kmaPath",
                       dest="kma_path",
                       help="Path to KMA",
                       default="./cge/kma/kma")
    group.add_argument("-db_point", "--db_path_point",
                       help="Path to the databases for PointFinder",
                       default="./db_pointfinder")
    ns, args = parser.parse_known_args(namespace=unittest)
    return ns, sys.argv[:1] + args

if __name__ == "__main__":
    args, argv = parse_args()   # run this first
    sys.argv[:] = argv       # create cleans argv for main()
    unittest.main()
