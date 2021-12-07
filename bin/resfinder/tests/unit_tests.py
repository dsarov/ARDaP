#!/usr/bin/env python3
import unittest
import os
import subprocess


test_names = ["test1", "test3"]
test_data = {
    test_names[0]: "data/test_isolate_01.fa",  # Test published resistance
    test_names[1]: "data/test_isolate_03.fa",  # Test no resistance
}
run_test_dir = "unit_tests"
blast_out_dir = "blast_out"

configs = {}


class ResFinderTest(unittest.TestCase):

    def setUp(self):
        # Change working dir to test dir
        os.chdir(os.path.dirname(os.path.realpath(__file__)))
        # Does not allow running two tests in parallel
        os.makedirs(run_test_dir, exist_ok=False)
        with open("test_config.txt", "r") as fh:
            for line in fh:
                line = line.rstrip()

                if not(line):
                    continue

                if(line.startswith("#")):
                    continue

                key, path = line.split()
                configs[key] = path

    def test_run_resfinder(self):

        test1_dir = run_test_dir + "/" + test_names[0]
        test1_blast_dir = test1_dir + "/" + blast_out_dir
        os.makedirs(test1_dir)
        os.makedirs(test1_blast_dir)

        cmd = ("python3 ../ResFinder.py"
               + " -i " + test_data[test_names[0]]
               + " -o " + test1_blast_dir
               + " -p " + configs["resfinder_dbs"]
               + " -l 0.6"
               + " -t 0.9")

        print("Run cmd: " + cmd)

        process = subprocess.run(cmd, shell=True, stdout=subprocess.PIPE,
                                 stderr=subprocess.PIPE)

        outs = process.stdout.decode()
        errs = process.stderr.decode()

        self.assertNotIn("Error", errs)


if __name__ == "__main__":
    unittest.main()
