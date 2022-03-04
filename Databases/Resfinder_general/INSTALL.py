#!/usr/bin/python3
import shutil
import os
import sys
import tempfile
import subprocess

# TODO:
# Make script independent of current working directory
# Make script able to store indexed files in a directory not named
# 'kma_indexing'

# This scripts installs the PointFinder database for using KMA
# KMA should be installed before running this script
# The scripts assumes that it is placed together with the ResFinder species
# directories
#
# First clone the repository:
# git clone https://bitbucket.org/genomicepidemiology/resfinder_db.git

# Check if executable kma_index program is installed, if not promt the user for
# path


# Function for easy error printing
def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)


# KMA version
#KMA_VERSION = "latest"


interactive = True
if len(sys.argv) >= 2:
    kma_index = sys.argv[1]
    if "non_interactive" in sys.argv:
        interactive = False
else:
    kma_index = "kma_index"

print(str(sys.argv))

while shutil.which(kma_index) is None:
    eprint("KMA index program, {}, does not exist or is not executable"
           .format(kma_index))
    ans = None
    if(interactive):
        ans = input("Please input path to executable kma_index program or"
                    "choose one of the options below:\n"
                    "\t1. Install KMA using make, index db, then remove KMA.\n"
                    "\t2. Exit\n")

    if(ans == "2" or ans == "q" or ans == "quit" or ans == "exit"):
        eprint("Exiting!\n\n"
               "Please install executable KMA programs in order to install"
               "this database.\n\n"
               "KMA can be obtained from bitbucked:\n\n"
               "git clone"
               "https://bitbucket.org/genomicepidemiology/kma.git"
               )
        sys.exit()

    if(ans == "1" or ans is None):
        if(shutil.which("git") is None):
            sys.exit("Attempt to automatically install KMA failed.\n"
                     "git does not exist or is not executable.")
        org_dir = os.getcwd()

        # Create temporary directory
        tempdir = tempfile.TemporaryDirectory()
        os.chdir(tempdir.name)

        try:
            subprocess.run(
                ["git", "clone",
                 "https://bitbucket.org/genomicepidemiology/kma.git"],
                check=True)
            os.chdir("kma")
        except subprocess.CalledProcessError:
            eprint("Installation in temporary directory with make failed "
                   "at the git cloning step")
            os.chdir(org_dir)

        try:
            subprocess.run(["make"])
        except subprocess.CalledProcessError:
            eprint("Installation in temporary directory with make failed "
                   "at the make step.")
            os.chdir(org_dir)

        kma_index = "{}/kma/kma_index".format(tempdir.name)
        os.chdir(org_dir)
        if shutil.which(kma_index) is None:
            eprint("Installation in temporary directory with make failed "
                   "at the test step.")
            os.chdir(org_dir)
            kma_index = "kma_index"
            if(not interactive):
                ans = "2"

    if(ans is not None and ans != "1" and ans != "2"):
        kma_index = ans
        if shutil.which(kma_index) is None:
            eprint("Path, {}, is not an executable path. Please provide "
                   "absolute path\n".format(ans))


# Index databases

# Use config_file to go through database dirs
config_file = open("config", "r")
for line in config_file:
    if line.startswith("#"):
        continue
    else:
        line = line.rstrip().split("\t")
        drug = line[0].strip()
        # for each dir index the fasta files
        os.system("{0} -i {1}.fsa -o ./{1}".format(kma_index, drug))
os.system("{0} -i *.fsa -o ./all".format(kma_index))

config_file.close()

eprint("Done")
