#!/usr/bin/env python3

from __future__ import print_function
import argparse
import os.path
import re
import shutil
from signal import *
import tempfile
import sys
import subprocess

from .phenotype import Phenotype


def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)


class PhenoDBPoint(dict):
    """ Loads a text table into dict.
        The dict consists of Phenotype objects. The keys are unique ids.
    """
    def __init__(self, txt_file, alt_name_file=None):

        # Stores non-redundant complete list of antibiotics in DB.
        self.antibiotics = {}

        with open(txt_file, "r") as fh:
            # Skip headers
            fh.readline()
            line_counter = 1

            for line in fh:
                try:
                    line_counter += 1

                    line_list = line.split("\t")
                    line_list = map(str.rstrip, line_list)

                    # ID in DB is just Gene ID and is not unique
                    phenodb_id = line_list[0]
                    codon_pos = line_list[3]
                    res_codon_str = line_list[6].lower()
                    unique_id = (phenodb_id + "_" + codon_pos + "_"
                                 + res_codon_str)

                    ab_class = self.get_csv_tuple(line_list[7].lower())

                    pub_phenotype = self.get_csv_tuple(line_list[8].lower())
                    if("unknown" in pub_phenotype or "none" in pub_phenotype):
                        pub_phenotype = ()

                    pmid = self.get_csv_tuple(line_list[9].lower())

                    phenotype = list(pub_phenotype)

                    if(len(line_list) > 10 and line_list[10]):
                        sug_phenotype = self.get_csv_tuple(line_list[10])
                        for p in sug_phenotype:
                            if p not in pub_phenotype:
                                phenotype.append(p)
                    else:
                        sug_phenotype = None

                    if(len(line_list) > 11 and line_list[11]):
                        res_mechanics = line_list[11]
                    else:
                        res_mechanics = None

                    if(len(line_list) > 12 and line_list[12]):
                        susceptibile = self.get_csv_tuple(line_list[12])
                    else:
                        susceptibile = ()

                    if(len(line_list) > 13 and line_list[13]):
                        notes = line_list[13]
                    else:
                        notes = ""

                    # Create non-redundant complete list of antibiotics in DB.
                    for ab in phenotype:
                        for _class in ab_class:
                            if(_class in self.antibiotics):
                                self.antibiotics[_class][ab] = True
                            else:
                                self.antibiotics[_class] = {}
                                self.antibiotics[_class][ab] = True
                    for ab in susceptibile:
                        for _class in ab_class:
                            if(_class in self.antibiotics):
                                self.antibiotics[_class][ab] = True
                            else:
                                self.antibiotics[_class] = {}
                                self.antibiotics[_class][ab] = True

                    pheno = Phenotype(unique_id, phenotype, ab_class,
                                      sug_phenotype, pub_phenotype, pmid,
                                      susceptibile=susceptibile, notes=notes,
                                      res_mechanics=res_mechanics)

                    self[unique_id] = pheno

                    # A pointmutation with several different res codons will
                    # never be found using all the res_codons. Instead it will
                    # be found with just one.
                    # Alternative unique ids are therefore made using just a
                    # single res_codon.
                    res_codon = self.get_csv_tuple(line_list[6].lower())
                    if(len(res_codon) > 1):
                        for codon in res_codon:
                            unique_id_alt = (phenodb_id + "_" + codon_pos
                                             + "_" + codon)
                            self[unique_id_alt] = pheno
                except IndexError:
                    eprint("Error in line " + str(line_counter))
                    eprint("Split line:\n" + str(line_list))

    @staticmethod
    def get_csv_tuple(csv_string):
        """ Takes a string containing a comma seperated list, makes it all
            lower case, remove empty entries, remove trailing and preseeding
            whitespaces, and returns the list as a tuple.
        """
        csv_string = csv_string.lower()
        string_list = csv_string.split(",")
        # Remove empty entries.
        out_list = [var.strip() for var in string_list if var]
        return tuple(out_list)

    def print_db_stats(self):
        """ Prints some stats about the database to stdout.
        """
        counter_ab_class = 0
        counter_ab = 0

        ab_output = ""

        print("-------------- LIST OF CLASSES --------------")
        for ab_class in self.antibiotics:
            counter_ab_class += 1
            print(ab_class)
        print("--------------- END OF CLASSES --------------")
        print("|")
        print("|")
        print("------------ LIST OF ANTIBIOTICS ------------")
        for ab_class in self.antibiotics:
            print(ab_class)
            for ab in self.antibiotics[ab_class]:
                counter_ab += 1
                print("\t" + ab)
        print("------------ END OF ANTIBIOTICS -------------")
        print("|")
        print("|")
        print("------------------ SUMMARY ------------------")
        print("No. of classes: " + str(counter_ab_class))
        print("No. of antibiotics: " + str(counter_ab))
        print("-------------------- END --------------------")
