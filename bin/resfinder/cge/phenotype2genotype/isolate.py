#!/usr/bin/env python3

import argparse
import os.path
import re
import shutil
from signal import *
import tempfile
import sys
import subprocess
# import urllib.parse
from itertools import chain

from .feature import Feature, ResGene, Mutation, ResMutation
from .phenodbpoint import PhenoDBPoint
from .res_profile import PhenoDB, ResProfile, FeatureGroup
from .dbhit import DBHit


class Isolate(dict):
    """ An isolate class is a dict of Features.
    """
    NO_AB_CLASS = "No class defined"

    def __init__(self, name, species=None):
        self.name = name
        self.resprofile = None
        self.species = None
        self.feature_classes = {}

    def load_resfinder_tab(self, tabbed_output, phenodb):
        with open(tabbed_output, "r") as fh:
            while(True):
                line = fh.readline()
                if(not line):
                    break

                line = line.rstrip()
                if(not line):
                    continue

                db_name = line
                second_line = fh.readline().rstrip()

                if(second_line == "No hit found"):
                    continue

                # At this point second line must be headers, and are skipped.

                res_hit = fh.readline().rstrip()

                while(res_hit):
                    hit_list = res_hit.split("\t")
                    match_length, ref_length = hit_list[2].split("/")
                    start_ref, end_ref = hit_list[4].split("..")
                    accno = hit_list[8]
                    gene_name = hit_list[0]
                    unique_id = "{0}_{1}".format(gene_name, accno)
                    hit = DBHit(name=gene_name, identity=hit_list[1],
                                match_length=match_length,
                                ref_length=ref_length, start_ref=start_ref,
                                end_ref=end_ref, acc=accno,
                                db="resfinder")

                    start_feat, end_feat = hit_list[6].split("..")

                    if(start_feat == "NA"):
                        start_feat = None
                        end_feat = None

                    phenotypes = phenodb.get(unique_id, None)
                    ab_class = set()
                    if(phenotypes):
                        for p in phenotypes:
                            for ab in p.antibiotics:
                                ab_class.update(ab.classes)
                    else:
                        ab_class.add(db_name)

                    gene_feat = ResGene(unique_id=unique_id,
                                        seq_region=hit_list[5],
                                        start=start_feat, end=end_feat,
                                        hit=hit, ab_class=ab_class)

                    if(unique_id in self):
                        temp_list = self[unique_id]
                        temp_list.append(gene_feat)
                        self[unique_id] = temp_list
                    else:
                        self[unique_id] = [gene_feat]

                    res_hit = fh.readline().rstrip()

    @staticmethod
    def get_phenodb_id(feat_res_dict, type):

        if(type == "seq_variations"):
            ref_id = feat_res_dict["ref_id"]
            var_aa = feat_res_dict.get("var_aa", None)

            # Not Amino acid mutation
            if(var_aa is None):
                phenodb_id = ref_id
            # Amino acid mutation
            else:
                phenodb_id = ref_id[:-1] + feat_res_dict["var_aa"]
            return phenodb_id

        elif(type == "genes"):
            return "{}_{}".format(feat_res_dict["name"],
                                  feat_res_dict["ref_acc"])

    def load_finder_results(self, std_table, phenodb, type):
        for key, feat_info in std_table[type].items():
            if(type == "genes"
               and re.search("PointFinder", feat_info["ref_database"])):
               continue
            unique_id = Isolate.get_phenodb_id(feat_info, type)
            phenotypes = phenodb.get(unique_id, None)
            ab_class = set()
            if(phenotypes):
                for p in phenotypes:
                    for ab in p.antibiotics:
                        ab_class.update(ab.classes)
            else:
                ab_class.add(Isolate.NO_AB_CLASS)

            if(type == "genes"):
                res_feature = self.new_res_gene(feat_info, unique_id, ab_class)
            elif(type == "seq_variations"):
                res_feature = self.new_res_mut(feat_info, unique_id, ab_class)

            ResProfile.update_classes_dict_of_feature_sets(
                self.feature_classes, res_feature)

            feat_list = self.get(unique_id, [])
            feat_list.append(res_feature)
            self[unique_id] = feat_list

    def new_res_mut(self, feat_info, unique_id, ab_class):
        ref_aa = feat_info.get("ref_aa", None)
        if(ref_aa is None or ref_aa.upper() == "NA"):
            nucleotide_mut = True
        else:
            nucleotide_mut = False
        feat_res = ResMutation(unique_id=unique_id,
                               seq_region=";;".join(feat_info["genes"]),
                               pos=feat_info["ref_start_pos"],
                               ref_codon=feat_info["ref_codon"],
                               mut_codon=feat_info["var_codon"],
                               ref_aa=feat_info.get("ref_aa", None),
                               mut_aa=feat_info.get("var_aa", None),
                               isolate=self,
                               insertion=feat_info["insertion"],
                               deletion=feat_info["deletion"],
                               end=feat_info["ref_end_pos"],
                               nuc=nucleotide_mut,
                               ab_class=ab_class)

        return feat_res

    def new_res_gene(self, gene_info, unique_id, ab_class):
        hit = DBHit(name=gene_info["name"],
                    identity=gene_info["identity"],
                    match_length=gene_info["alignment_length"],
                    ref_length=gene_info["ref_gene_lenght"],
                    start_ref=gene_info["ref_start_pos"],
                    end_ref=gene_info["ref_end_pos"],
                    acc=gene_info["ref_acc"],
                    depth=gene_info.get("depth", None),
                    db="resfinder")

        query_start = gene_info.get("query_start_pos", None)
        query_end = gene_info.get("query_end_pos", None)
        query_id = gene_info.get("query_id", None)

        feat_res = ResGene(unique_id=unique_id,
                           seq_region=query_id,
                           start=query_start,
                           end=query_end,
                           hit=hit,
                           ab_class=ab_class)
        return feat_res

    # Not used, delete it.
    def load_resfinder_results(self, std_table, phenodb):

        for key, gene_info in std_table["genes"].items():

            unique_id = "{}_{}".format(gene_info["name"], gene_info["ref_acc"])

            phenotypes = phenodb.get(unique_id, None)
            ab_class = set()
            if(phenotypes):
                for p in phenotypes:
                    for ab in p.antibiotics:
                        ab_class.update(ab.classes)
            else:
                ab_class.add(Isolate.NO_AB_CLASS)

            hit = DBHit(name=gene_info["name"],
                        identity=gene_info["identity"],
                        match_length=gene_info["alignment_length"],
                        ref_length=gene_info["ref_gene_lenght"],
                        start_ref=gene_info["ref_start_pos"],
                        end_ref=gene_info["ref_end_pos"],
                        acc=gene_info["ref_acc"],
                        db="resfinder")

            query_start = gene_info.get("query_start_pos", None)
            query_end = gene_info.get("query_end_pos", None)
            query_id = gene_info.get("query_id", None)

            feat_res = ResGene(unique_id=unique_id,
                               seq_region=query_id,
                               start=query_start,
                               end=query_end,
                               hit=hit,
                               ab_class=ab_class)

            ResProfile.update_classes_dict_of_feature_sets(
                self.feature_classes, feat_res)

            feat_list = self.get(unique_id, [])
            feat_list.append(feat_res)
            self[unique_id] = feat_list

    # Not used, delete it.
    def load_finder_results_old(self, std_table, phenodb):

        for db_name, features in std_table.long.items():
            for unique_id, feature in features.items():

                # No hits to database
                if(not feature):
                    continue

                phenotypes = phenodb.get(unique_id, None)
                ab_class = set()
                if(phenotypes):
                    for p in phenotypes:
                        for ab in p.antibiotics:
                            ab_class.update(ab.classes)
                else:
                    ab_class.add(Isolate.NO_AB_CLASS)

                is_mut = feature.get("mutation", None)

                # Load mutation
                if(is_mut is not None and is_mut != "NA"):
                    ref_aa = feature["ref_aa"]
                    if(ref_aa is None or ref_aa.upper() == "NA"):
                        nucleotide_mut = True
                    else:
                        nucleotide_mut = False
                    feat_res = ResMutation(unique_id=unique_id,
                                           seq_region=feature["template_name"],
                                           pos=feature["query_start_pos"],
                                           ref_codon=feature["ref_codon"],
                                           mut_codon=feature["alt_codon"],
                                           ref_aa=feature["ref_aa"],
                                           mut_aa=feature["alt_aa"],
                                           isolate=self,
                                           insertion=feature["insertion"],
                                           deletion=feature["deletion"],
                                           end=feature["query_end_pos"],
                                           nuc=nucleotide_mut,
                                           ab_class=ab_class)
                # Load gene
                else:
                    hit = DBHit(name=feature["template_name"],
                                identity=feature["aln_identity"],
                                match_length=feature["aln_length"],
                                ref_length=feature["template_length"],
                                start_ref=feature["template_start_pos"],
                                end_ref=feature["template_end_pos"],
                                acc=feature["acc_no"],
                                db="resfinder")

                    feat_res = ResGene(unique_id=unique_id,
                                       seq_region=feature["query_id"],
                                       start=feature["query_start_pos"],
                                       end=feature["query_end_pos"],
                                       hit=hit,
                                       ab_class=ab_class)

                ResProfile.update_classes_dict_of_feature_sets(
                    self.feature_classes, feat_res)

                feat_list = self.get(unique_id, [])
                feat_list.append(feat_res)
                self[unique_id] = feat_list

    def calc_res_profile(self, phenodb):
        """
        """
        features = self.values()
        # Flatten features.
        features = list(chain.from_iterable(features))
        self.resprofile = ResProfile(features, phenodb)

    def profile_to_str_table(self, header=False):
        """
        """
        output_str = ""

        if(header):
            output_str = (
                "# ResFinder phenotype results.\n"
                "# Sample: " + self.name + "\n"
                "# \n"
                "# The phenotype 'No resistance' should be interpreted with\n"
                "# caution, as it only means that nothing in the used\n"
                "# database indicate resistance, but resistance could exist\n"
                "# from 'unknown' or not yet implemented sources.\n"
                "# \n"
                "# The 'Match' column stores one of the integers 0, 1, 2, 3.\n"
                "#      0: No match found\n"
                "#      1: Match < 100% ID AND match length < ref length\n"
                "#      2: Match = 100% ID AND match length < ref length\n"
                "#      3: Match = 100% ID AND match length = ref length\n"
                "# If several hits causing the same resistance are found,\n"
                "# the highest number will be stored in the 'Match' column.\n"
                "\n"
            )
            output_str += ("# Antimicrobial\t"
                           "Class\t"
                           "WGS-predicted phenotype\t"
                           "Match\t"
                           "Genetic background\n")

        # For each antibiotic class
        for ab_class in self.resprofile.phenodb.antibiotics.keys():
            # For each antibiotic in current class
            for ab_db in self.resprofile.phenodb.antibiotics[ab_class]:
                output_str += ("{ab:s}\t{cl:s}"
                               .format(ab=ab_db.name, cl=ab_class))

                # Isolate is resistant towards the antibiotic
                if(ab_db in self.resprofile.resistance):
                    ab = self.resprofile.resistance[ab_db]
                    output_str += "\tResistant"

                    # Find the resistance causing gene with the best match
                    # Mutations will always have best match as they are only
                    # either present or absent.
                    best_match = 0
                    for unique_id in ab.features:
                        feature = ab.features[unique_id]
                        if(isinstance(feature, Mutation)
                           or isinstance(feature, FeatureGroup)):
                            best_match = 3
                        # Note: Mutations do not have "hits"
                        elif(feature.hit.match_category > best_match):
                            best_match = feature.hit.match_category

                    output_str += "\t" + str(best_match)

                    gene_list = ab.get_gene_namewacc(tostring=True)
                    mut_list = ab.get_mut_namewannot(tostring=True)

                    if(gene_list and mut_list):
                        gene_mut_str = gene_list + " " + mut_list
                    elif(gene_list):
                        gene_mut_str = gene_list
                    elif(mut_list):
                        gene_mut_str = mut_list
                    else:
                        gene_mut_str = ""

                    output_str += "\t" + gene_mut_str + "\n"

                # TODO: delete elif clause.
                # Isolate is susceptibile towards the antibiotic
                elif(ab_db.name in self.resprofile.susceptibile):
                    ab = self.resprofile.susceptibile[ab_db.name]
                    # Genetic background is not written if susceptibile
                    gene_list = ""
                    # Uncomment next line to write genetic background for susc.
                    # gene_list = ab.get_gene_namewacc(tostring=True)
                    output_str += "\tNo resistance\t0\t" + gene_list + "\n"
                else:
                    output_str += "\tNo resistance\t0\t\n"

        if(self.resprofile.missing_db_features):
            output_str += ("\n# WARNING: Missing features from phenotype "
                           "database:\n")
            output_str += "# Feature_ID\tRegion\tDatabase\tHit\n"

            for feature in self.resprofile.missing_db_features:
                output_str += ("{}\t{}\t"
                               .format(feature.unique_id, feature.seq_region))

                if(feature.hit is None):
                    output_str += "\t"
                else:
                    output_str += str(feature.hit.db) + "\t" + feature.hit.name

                output_str += "\n"

        if(self.resprofile.unknown_db_features):
            output_str += ("\n# WARNING: Features with unknown phenotype \n")
            output_str += "# Feature_ID\tRegion\tDatabase\tHit\tClass\n"

            for feature in self.resprofile.unknown_db_features:
                output_str += ("{}\t{}\t"
                               .format(feature.unique_id, feature.seq_region))

                if(feature.hit is None):
                    output_str += "\t"
                else:
                    output_str += str(feature.hit.db) + "\t" + feature.hit.name

                output_str += "\t" + ",".join(feature.ab_class)

                output_str += "\n"

        return output_str
