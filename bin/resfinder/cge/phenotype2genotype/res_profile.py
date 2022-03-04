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
from .feature import Feature, ResGene, Mutation, ResMutation
from .abclassdef import ABClassDefinition


def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)


class PhenoDB(dict):
    """ Loads a text table into dict.
        The dict consists of Phenotype objects. The keys are unique ids.
    """

    def __init__(self, abclassdef_file, acquired_file=None, point_file=None):

        # Stores non-redundant complete list of antibiotics in DB.
        self.antibiotics = {}

        # ID in DB is <gene>_<group>_<acc>. Ex: blaB-2_1_AF189300
        # The <group> should be redundant, as the acc will be enough to
        # define which variant it is.
        # This code uses the 'new' ID <gene>_<acc>, but has this dict so other
        # parts can translate the new ids into the old ones that includes
        # <group>
        self.id_to_idwithvar = {}

        self.ab_class_defs = ABClassDefinition(abclassdef_file)

        if(acquired_file is None and point_file is None):
            eprint("ERROR: No phenotype database files where specified.")
            quit(1)

        if(acquired_file):
            self.load_acquired_db(acquired_file)

        if(point_file):
            self.load_point_db(point_file)

        self.unknown_pheno = Phenotype(unique_id="unknown",
                                       antibiotics=[],
                                       sug_phenotype=(),
                                       pub_phenotype=(),
                                       pmid="-",
                                       notes="Phenotype not found in database")

    def load_acquired_db(self, txt_file):

        # Test file for illegal encodings
        with open(txt_file, "r") as fh:
            line_counter = 1
            try:
                for line in fh:
                    line_counter += 1
            except UnicodeDecodeError:
                eprint("PhenoDB load_acquired_dbacq UnicodeDecodeError in "
                       "line {0}".format(line_counter))
                eprint("\t\"" + line + "\"")
                sys.exit("UnicodeDecodeError")

        with open(txt_file, "r") as fh:
            # Skip headers
            fh.readline()
            line_counter = 1

            for line in fh:
                if(line.startswith("#")):
                    continue

                try:
                    line_counter += 1

                    # line = line.encode("latin_1")
                    line = line.rstrip()
                    line_list = line.split("\t")
                    line_list = list(map(str.rstrip, line_list))

                    # ID in DB is <gene>_<group>_<acc>. Ex: blaB-2_1_AF189300.
                    # The gene + acc should be unique and is used here.
                    id_with_group = line_list[0]
                    phenodb_id = id_with_group.split("_")

                    # This code is temporary
                    # TODO: Remove when database has been reformatted.
                    if(len(phenodb_id) < 3):
                        unique_id = phenodb_id
                    else:
                        accno = "_".join(phenodb_id[2:])
                        unique_id = "{0}_{1}".format(phenodb_id[0], accno)

                    self.id_to_idwithvar[unique_id] = id_with_group

                    # ab_class = self.get_csv_tuple(line_list[1].lower())

                    pub_phenotype = self.get_csv_tuple(line_list[2].lower())
                    if("unknown" in pub_phenotype or "none" in pub_phenotype):
                        pub_phenotype = ()

                    abs = []
                    for ab_name in pub_phenotype:
                        # TODO: Fix database
                        if(ab_name == "see notes"):
                            continue
                        classes = self.ab_class_defs.get(ab_name, None)
                        if(classes is None):
                            eprint("Entry {id:s} contained antibiotic "
                                   "'{ab:s}' not found in ab class "
                                   "def file."
                                   .format(id=unique_id, ab=ab_name))
                            continue
                        ab = Antibiotics(name=ab_name, classes=classes)
                        abs.append(ab)
                        for class_ in classes:
                            if(class_ in self.antibiotics):
                                self.antibiotics[class_][ab] = True
                            else:
                                self.antibiotics[class_] = {}
                                self.antibiotics[class_][ab] = True

                    # phenotype = list(pub_phenotype)

                    pmid = self.get_csv_tuple(line_list[3].lower())

                    if(len(line_list) > 4 and line_list[4]):
                        res_mechanics = line_list[4].lower()
                    else:
                        res_mechanics = ""

                    if(len(line_list) > 5 and line_list[5]):
                        notes = line_list[5]
                    else:
                        notes = ""

                    # Line list pos 6 is required genes

                    #
                    # The following should be written out
                    #
                    # if(len(line_list) > 6 and line_list[6]):
                    #    sug_phenotype = self.get_csv_tuple(line_list[6])
                    #    for p in sug_phenotype:
                    #        if p not in pub_phenotype:
                    #            phenotype.append(p)
                    # else:
                    sug_phenotype = ()

                    if(len(line_list) > 7 and line_list[7]):
                        gene_class = line_list[7].lower()
                    else:
                        gene_class = None
                    if(len(line_list) > 8 and line_list[8]):
                        susceptibile = self.get_csv_tuple(line_list[6])
                    else:
                        susceptibile = ()
                    if(len(line_list) > 9 and line_list[9]):
                        species = self.get_csv_tuple(line_list[9])
                    else:
                        species = None

                    pheno = Phenotype(unique_id, abs,
                                      sug_phenotype, pub_phenotype, pmid,
                                      susceptibile=susceptibile,
                                      gene_class=gene_class, notes=notes)

                    pheno_lst = self.get(unique_id, [])
                    pheno_lst.append(pheno)
                    self[unique_id] = pheno_lst

                except IndexError:
                    eprint("PhenoDB load_acquired_dbacq IndexError in line {0}"
                           .format(line_counter))
                    eprint("Split line:\n{0}".format(str(line_list)))

    def load_point_db(self, txt_file):

        with open(txt_file, "r") as fh:
            # Skip headers
            fh.readline()
            line_counter = 1

            for line in fh:
                if(line.startswith("#")):
                    continue

                try:
                    line_counter += 1

                    line_list = line.split("\t")
                    line_list = list(map(str.rstrip, line_list))

                    # ID in DB is just Gene ID and is not unique
                    phenodb_id = line_list[0]
                    codon_pos = line_list[2]
                    res_codon_str = line_list[5].lower()

                    # Check if the entry is with a promoter
                    phenodb_id = PhenoDB.if_promoter_rename(phenodb_id)

                    unique_id = (phenodb_id + "_" + codon_pos + "_"
                                 + res_codon_str)

                    pub_phenotype = self.get_csv_tuple(line_list[6].lower())
                    if("unknown" in pub_phenotype or "none" in pub_phenotype):
                        pub_phenotype = ()

                    pmid = self.get_csv_tuple(line_list[7].lower())

                    # TODO: Remove this tuple and its dependencies.
                    sug_phenotype = ()

                    abs = []
                    for ab_name in pub_phenotype:
                        # TODO: Fix database
                        if(ab_name == "see notes"):
                            continue
                        classes = self.ab_class_defs.get(ab_name, None)
                        if(classes is None):
                            eprint("Entry {id:s} contained antibiotic "
                                   "'{ab:s}' not found in ab class "
                                   "def file."
                                   .format(id=unique_id, ab=ab_name))
                            continue
                        ab = Antibiotics(name=ab_name, classes=classes)
                        abs.append(ab)
                        for class_ in classes:
                            if(class_ in self.antibiotics):
                                self.antibiotics[class_][ab] = True
                            else:
                                self.antibiotics[class_] = {}
                                self.antibiotics[class_][ab] = True

                    if(len(line_list) > 8 and line_list[8]):
                        res_mechanics = line_list[8]
                    else:
                        res_mechanics = None

                    if(len(line_list) > 9 and line_list[9]):
                        notes = line_list[9]
                    else:
                        notes = ""

                    # Load required mutations.
                    # A mutation can dependent on a group of other
                    # mutations. It is also possible for a mutation to
                    # be dependent on either group A, B, C etc.
                    # The string stored in this field divides each
                    # group using a semicolon, and each mutation using
                    # a comma.
                    # The individual mutation notation is also a little
                    # different from elsewhere, see MutationGenotype
                    # class for more info.
                    # Requied mutations are stored in a tuple of tuples
                    # of MutationGenotypes. Outer tuple seperate
                    # groups, inner tuples seperate mutations.
                    if(len(line_list) > 10 and line_list[10]):
                        mut_groups_str = PhenoDB.get_csv_tuple(line_list[10],
                                                               sep=";",
                                                               lower=False)
                        if(mut_groups_str):
                            mut_groups = []

                            for group in mut_groups_str:
                                group_list = []
                                mut_strings = PhenoDB.get_csv_tuple(
                                    group, lower=False)
                                for mut_str in mut_strings:
                                    mut = MutationGenotype(mut_str)
                                    group_list.append(mut)

                                mut_groups.append(tuple(group_list))

                            mut_groups = tuple(mut_groups)

                        else:
                            mut_groups = None
                    else:
                        mut_groups = None

                    pheno = Phenotype(unique_id, abs,
                                      sug_phenotype, pub_phenotype, pmid,
                                      notes=notes, res_mechanics=res_mechanics,
                                      req_muts=mut_groups)

                    pheno_lst = self.get(unique_id, [])
                    pheno_lst.append(pheno)
                    self[unique_id] = pheno_lst

                    # A pointmutation with several different res codons will
                    # never be found using all the res_codons. Instead it will
                    # be found with just one.
                    # Alternative unique ids are therefore made using just a
                    # single res_codon.
                    res_codon = self.get_csv_tuple(line_list[5].lower())
                    if(len(res_codon) > 1):
                        for codon in res_codon:
                            unique_id_alt = (phenodb_id + "_" + codon_pos
                                             + "_" + codon)
                            self[unique_id_alt] = pheno_lst
                except IndexError:
                    eprint("Error in line " + str(line_counter))
                    eprint("Split line:\n" + str(line_list))

    @staticmethod
    def if_promoter_rename(s):
        out_string = s
        regex = r"^(.+)_promoter_size_\d+bp$"
        promoter_match = re.search(regex, s)
        if(promoter_match):
            reg_name = promoter_match.group(1)
            out_string = reg_name + "-promoter"
        return out_string

    @staticmethod
    def get_csv_tuple(csv_string, sep=",", lower=True):
        """ Takes a string containing a comma seperated list, makes it all
            lower case, remove empty entries, remove trailing and preseeding
            whitespaces, and returns the list as a tuple.
        """
        if(lower):
            csv_string = csv_string.lower()

        string_list = csv_string.split(sep)
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


class MutationGenotype(object):
    """
    """
    def __init__(self, mut_string):
        mut_match = re.search(r"^(.+)_(\D+)(\d+)(.+)$", mut_string)
        self.gene = mut_match.group(1)
        self.ref = mut_match.group(2).lower()
        self.pos = mut_match.group(3)
        alt_str = mut_match.group(4).lower()
        self.alternatives = tuple(alt_str.split("."))
        self.mut_id_prefix = "".join((self.gene, "_", self.ref, self.pos))

    def create_mut(self, mut_aa):
        """ Given an aa alternative, creates a Mutation object.
        """
        unique_id = self.mut_id_prefix + "_" + mut_aa
        mut = Mutation(unique_id, seq_region=gene, pos=self.pos,
                       ref_aa=self.ref, mut_aa=mut_aa)
        # Check if the created mutation is part of the MutationGenotype
        if(self.is_in([mut])):
            return mut
        else:
            sys.exit("An attempt was made to create a mutation from a"
                     "MutationGenotype that was not defined in that "
                     "genotype.")

    def is_in(self, feat_dict):
        """ Checks if any of the mutation genotypes exists in the given
            feature dict. Retuns feature if found. Returns False
            otherwise.
        """
        for feat_id in feat_dict:
            feat = feat_dict[feat_id]
            if(self == feat):
                return feat

        return False

    def __eq__(self, other):
        """ Compare MutationGenotype to other MutationGenotypes,
            Mutation objects, or strings.

            Returns the matched mutation aa if compared to a mutation
            or a string. Returns boolean if compared to another
            MutationGenotype object.
        """
        if isinstance(other, Mutation):
            if(self == other.mut_string):
                return other.mut_aa
            else:
                return False
        elif isinstance(other, MutationGenotype):

            # Returns True if gene, ref base, position and the tuple of
            # alternatives match.
            if(self.mut_id_prefix == other.mut_id_prefix):

                if(len(self.alternatives) != len(other.alternatives)):
                    return False
                for self_alt in self.alternatives:
                    if(self_alt not in other.alternatives):
                        return False
                return True
            else:
                return False

        elif isinstance(other, str):
            mut_match = re.search(r"^(\D+\d+)(.+)$", other)
            if(mut_match):

                if(mut_match.group(1) == self.mut_id_prefix):
                    if(mut_match.group(2) in self.alternatives):
                        return mut_match.group(2)
                    else:
                        return False
                else:
                    return False

            else:
                return False

        else:
            return False

    def __ne__(self, other):
        result = self.__eq__(other)
        if result is NotImplemented:
            return result
        return not result


class Phenotype(object):
    """ A Phenotype object describes the antibiotics a feature/gene causes
        resistance and susceptibility against.
        unique_id: the id is used to locate the specified phenotype.
        phenotype: Tuple of antibiotics that gene causes resistance toward.
        ab_class: Class of resistance (e.g. Beta-Lactamase).
        pub_phenotype: Tuple of published resistance (antibiotics).
        pmid: Tuple of PubMed IDs of publications presenting resistance and
              susceptibility.
        susceptibility: Tuple of antibiotics that the gene is known to be
                        susceptibil towards.
        gene_class: resistance gene class (e.g. class D)
        notes: String containing other information on the resistance gene.
        species: Ignore resistance in these species as it is intrinsic.
        req_mut: Mutations required to cause the penotype. This is a tuple of
                 tuples of MutationGenotypes. The outmost tuple represent
                 groups of mutations that are needed for the phenotype,
                 but each of the groups are independent of each other. The
                 inner tuples represent individual mutations for a specific
                 reference aa/nucs found at the position. The MutationGenotype
                 objects contain information on known mutations.
    """
    def __init__(self, unique_id, antibiotics, sug_phenotype,
                 pub_phenotype, pmid, susceptibile=(), gene_class=None,
                 notes="", species=None, res_mechanics=None, req_muts=None):
        self.unique_id = unique_id
        self.antibiotics = antibiotics

        self.sug_phenotype = sug_phenotype
        self.pub_phenotype = pub_phenotype
        self.pmid = pmid
        self.susceptibile = susceptibile
        self.gene_class = gene_class
        self.notes = notes
        self.res_mechanics = res_mechanics
        self.req_muts = req_muts


class Antibiotics(object):
    """ Class is implemented to be key in a dict. The class can be tested
        against isinstances of itself and strings.
    """
    def __init__(self, name, classes, feature=None, published=None):
        self.name = name
        self.classes = classes
        self.published = published
        self.features = {}
        if(feature):
            self.add_feature(feature)

    def __hash__(self):
        return hash(self.name)

    def __eq__(self, other):
        if isinstance(other, Antibiotics):
            return other.name == self.name
        elif isinstance(other, str):
            return other == self.name
        else:
            return NotImplemented

    def __ne__(self, other):
        result = self.__eq__(other)
        if result is NotImplemented:
            return result
        return not result

    # TODO: Overwrites identical features. Should check to keep only
    #       the most resistant feature.
    def add_feature(self, feature):
        self.features[feature.unique_id] = feature

    def get_mut_names(self, _list=False):
        names = {}
        for f in self.features:
            feature = self.features[f]
            if(not (isinstance(feature, Mutation)
                    or isinstance(feature, FeatureGroup))):
                continue

            if(isinstance(feature, FeatureGroup)):
                feature_lst = list(feature.values())
            else:
                feature_lst = [feature]

            for entry in feature_lst:
                names[entry.unique_id] = [entry.seq_region,
                                          entry.mut_string_short]

        if(_list):
            return names.keys()
        else:
            return names

    def get_mut_namewannot(self, tostring=False):
        names = self.get_mut_names()

        output = []
        for unique_id in names:
            annot = names[unique_id]
            name_w_annot = annot[0] + " (" + "".join(annot[1:]) + ")"
            output.append(name_w_annot)

        if(tostring):
            return ", ".join(output)
        else:
            return output

    def get_gene_names(self, list_=False):
        names = {}
        for f in self.features:
            feature = self.features[f]
            if(not isinstance(feature, ResGene)):
                continue

            if(feature.hit.name):
                names[feature.unique_id] = feature.hit.name
            else:
                names[feature.unique_id] = "Not Available"

        if(list_):
            return names.keys()
        else:
            return names

    def get_gene_namewacc(self, tostring=False):
        names = self.get_gene_names()

        output = []
        for acc in names:
            name_w_acc = names[acc] + " (" + acc + ")"
            output.append(name_w_acc)

        if(tostring):
            return ", ".join(output)
        else:
            return output

    def get_pubmed_ids(self, phenodb):
        pmids = {}
        for feature in self.features:
            phenotype = phenodb[feature.unique_id]
            for pmid in phenotype.pmid:
                pmids[pmid] = True
        return tuple(pmids.keys())


class ResProfile(object):
    """ Given a list of features and a PhenoDB object, an object is created
        that will contain a resistance profile based on the features given and
        the phenotypes described in the PhenoDB object.
        The class contains an add_feature method that makes it possible to add
        features after the object has been created. Per default the add_feature
        method will call the update_profile method, but this can be turned off
        if one needs to add a lot of genes and wish to call the update_profile
        method only once after adding the features.
    """
    def __init__(self, features, phenodb):
        self.phenodb = phenodb
        self.resistance = {}
        self.features = {}
        self.susceptibile = {}
        self.resistance_classes = {}
        self.missing_db_features = []
        self.unknown_db_features = []

        for feature in features:
            if(feature.unique_id in phenodb):
                # Add feature
                self.features[feature.unique_id] = feature
                # Several phenotypes can exist for a single feature ID.
                for phenotype in phenodb[feature.unique_id]:
                    if(phenotype.antibiotics):
                        self.add_phenotype(feature, phenotype, update=False)
                    else:
                        self.unknown_db_features.append(feature)
                        self.update_classes_dict_of_feature_sets(
                            self.resistance_classes, feature)
            else:
                self.missing_db_features.append(feature)
                self.update_classes_dict_of_feature_sets(
                    self.resistance_classes, feature)
        self.update_profile()

    @staticmethod
    def update_classes_dict_of_feature_sets(classes, feature):
        """
        """
        if(isinstance(feature, ResGene) or isinstance(feature, ResMutation)):
            for _class in feature.ab_class:
                if(_class not in classes):
                    classes[_class] = set()
                classes[_class].add(feature)

    def add_phenotype(self, feature, phenotype, update=True):
        """
        """
        # Handle required mutations
        if(phenotype.req_muts is not None):

            # Iterate through the different groups of mutations (See
            # Phenotype description).
            mut_found = False
            mut_groups_found = []
            for mut_group in phenotype.req_muts:
                feat_group = FeatureGroup([feature])
                # Iterate through the individual mutations.
                for mut in mut_group:
                    mut_feat = mut.is_in(self.features)
                    if(mut_feat):
                        feat_group[mut_feat.unique_id] = mut_feat
                        mut_found = True
                    # Mutation not found, the requied mutations in this
                    # group are therefore not fullfilled.
                    else:
                        mut_found = False
                        break
                # All mutations from a group was found.
                if(mut_found is True):
                    mut_groups_found.append(feat_group)
                    break
            # No group contained all required mutations.
            if(mut_found is False):
                return
            else:
                # If several mut groups exist, then choose the one that
                # contains most req mutations.
                feature = {}
                for fg in mut_groups_found:
                    if(len(fg) > len(feature)):
                        feature = fg

        for antibiotic in phenotype.antibiotics:
            resprofile_ab = self.resistance.get(antibiotic, None)
            if(resprofile_ab):
                antibiotic = resprofile_ab

            # Create collection of features grouped with respect to ab class
            for _class in antibiotic.classes:
                if(_class not in self.resistance_classes):
                    self.resistance_classes[_class] = set()
                self.resistance_classes[_class].add(feature)

            antibiotic.add_feature(feature)
            self.resistance[antibiotic] = antibiotic

        # TODO: delete this for-loop
        for antibiotic in phenotype.sug_phenotype:

            # Create collection of features grouped with respect to ab class
            for _class in phenotype.ab_class:
                if(_class not in self.resistance_classes):
                    self.resistance_classes[_class] = set()
                self.resistance_classes[_class].add(feature)

            if(antibiotic not in self.resistance):
                self.resistance[antibiotic] = Antibiotics(antibiotic,
                                                          phenotype.ab_class,
                                                          feature,
                                                          published=False)
            else:
                self.resistance[antibiotic].add_feature(feature)

        # TODO: delete this for-loop
        for antibiotic in phenotype.susceptibile:
            if(antibiotic not in self.resistance):
                self.susceptibile[antibiotic] = Antibiotics(antibiotic,
                                                            phenotype.ab_class,
                                                            feature)

        if(update):
            self.update_profile()

    def update_profile(self):
        """
        """
        susc_abs = self.susceptibile.keys()
        for ab in susc_abs:
            if ab in self.resistance:
                del self.susceptibile[ab]


class FeatureGroup(dict):
    """ This class is a dict with a unique_id variable created from the
        keys in the dict.

        LIMITATION: The class does not handle the deletion of keys,
                    only additions.
    """
    def __init__(self, features):
        feature_ids = []
        for feature in features:
            feature_ids.append(feature.unique_id)
            super(FeatureGroup, self).__setitem__(feature.unique_id, feature)
            # self[feature.unique_id] = feature

        self.unique_id = "_".join(feature_ids)

    def __hash__(self):
        return hash(self.unique_id)

    def __setitem__(self, k, v):
        self.unique_id = self.unique_id + "_" + k
        return super(FeatureGroup, self).__setitem__(k, v)
