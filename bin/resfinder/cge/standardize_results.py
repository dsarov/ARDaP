#!/usr/bin/env python3
import random
import string

from .phenotype2genotype.feature import ResGene, ResMutation
from .phenotype2genotype.res_profile import PhenoDB
from .out.util.generator import Generator

import json


class SeqVariationResult(dict):
    def __init__(self, res_collection, mismatch, region_results, db_name):
        self.res_collection = res_collection
        self.load_var_type(mismatch[0])
        self["ref_start_pos"] = mismatch[1]
        self["ref_end_pos"] = mismatch[2]
        mut_string = mismatch[4]
        self["ref_codon"] = mismatch[5].lower()
        self["var_codon"] = mismatch[6].lower()

        if(len(mismatch) > 7):
            self["ref_aa"] = mismatch[7].lower()
            self["var_aa"] = mismatch[8].lower()
        region_name = region_results[0]["ref_id"]
        region_name = PhenoDB.if_promoter_rename(region_name)

        self["type"] = "seq_variation"
        if(len(mismatch) > 7):
            self["ref_id"] = ("{id}{deli}{pos}{deli}{var}"
                              .format(id=region_name,
                                      pos=self["ref_start_pos"],
                                      var=self["var_aa"], deli="_"))
        else:
            self["ref_id"] = ("{id}{deli}{pos}{deli}{var}"
                              .format(id=region_name,
                                      pos=self["ref_start_pos"],
                                      var=self["var_codon"], deli="_"))
        self["key"] = self._get_unique_key()
        self["seq_var"] = mut_string

        if(len(self["ref_codon"]) == 3):
            self["codon_change"] = ("{}>{}".format(self["ref_codon"],
                                                   self["var_codon"]))

        db_key = DatabaseHandler.get_key(res_collection, db_name)
        self["ref_database"] = db_key

        region_keys = []
        for result in region_results:
            region_keys.append(result["key"])
        self["genes"] = region_keys

    def load_var_type(self, type):
        self["substitution"] = False
        self["deletion"] = False
        self["insertion"] = False
        if(type == "sub"):
            self["substitution"] = True
        elif(type == "ins"):
            self["insertion"] = True
        elif(type == "del"):
            self["deletion"] = True

    def _get_unique_key(self, delimiter=";;"):
        minimum_key = self["ref_id"]
        unique_key = minimum_key
        while(unique_key in self.res_collection["seq_variations"]):
            rnd_str = GeneResult.randomString()
            unique_key = ("{key}{deli}{rnd}"
                          .format(key=minimum_key, deli=delimiter,
                                  rnd=rnd_str))

        return unique_key


class GeneResult(dict):
    def __init__(self, res_collection, res, db_name):
        self.db_name = db_name
        self["type"] = "gene"

        self["ref_id"] = res["sbjct_header"]
        self["ref_id"] = PhenoDB.if_promoter_rename(self["ref_id"])

        if(db_name == "ResFinder"):
            self["name"], self.variant, self["ref_acc"] = (
                GeneResult._split_sbjct_header(self["ref_id"]))
        elif(db_name == "PointFinder"):
            self["name"] = self["ref_id"]

        self["ref_start_pos"] = res["sbjct_start"]
        self["ref_end_pos"] = res["sbjct_end"]
        self["identity"] = res["perc_ident"]
        self["alignment_length"] = res["HSP_length"]
        self["ref_gene_lenght"] = res["sbjct_length"]
        self["query_id"] = res["contig_name"]
        self["query_start_pos"] = res["query_start"]
        self["query_end_pos"] = res["query_end"]
        self["key"] = self._get_unique_gene_key(res_collection)

        # BLAST coverage formatted results
        coverage = res.get("coverage", None)
        if(coverage is None):
            # KMA coverage formatted results
            coverage = res["perc_coverage"]
        else:
            coverage = float(coverage) * 100
        self["coverage"] = coverage

        depth = res.get("depth", None)
        if(depth is not None):
            self["depth"] = depth

        db_key = DatabaseHandler.get_key(res_collection, db_name)
        self["ref_database"] = db_key
        self.remove_NAs()

    @staticmethod
    def _split_sbjct_header(header):
        sbjct = header.split("_")
        template = sbjct[0]

        if(len(sbjct) > 1):
            variant = sbjct[1]
            acc = "_".join(sbjct[2:])
        else:
            variant = None
            acc = None

        return (template, variant, acc)

    def remove_NAs(self):
        na_keys = []
        for key, val in self.items():
            if(val == "NA" or val is None):
                na_keys.append(key)
        for key in na_keys:
            del self[key]

    def _get_unique_gene_key(self, res_collection, delimiter=";;"):
        if(self.db_name == "ResFinder"):
            gene_key = ("{name}{deli}{var}{deli}{ref_acc}"
                        .format(deli=delimiter, var=self.variant, **self))
        if(self.db_name == "PointFinder"):
            gene_key = self["name"]
        # Attach random string if key already exists
        minimum_gene_key = gene_key
        if gene_key in res_collection["genes"]:
            if(self["query_id"] == "NA"):
                gene_key = self.get_rnd_unique_gene_key(
                    gene_key, res_collection, minimum_gene_key, delimiter)
            elif (self["query_id"]
                    != res_collection["genes"][gene_key]["query_id"]
                  or self["query_start_pos"]
                    != res_collection["genes"][gene_key]["query_start_pos"]
                  or self["query_end_pos"]
                    != res_collection["genes"][gene_key]["query_end_pos"]):
                gene_key = self.get_rnd_unique_gene_key(
                    gene_key, res_collection, minimum_gene_key, delimiter)

        return gene_key

    def get_rnd_unique_gene_key(self, gene_key, res_collection,
                                minimum_gene_key, delimiter):
        while(gene_key in res_collection["genes"]):
            rnd_str = GeneResult.randomString()
            gene_key = ("{key}{deli}{rnd}"
                        .format(key=minimum_gene_key, deli=delimiter,
                                rnd=rnd_str))
        return gene_key

    @staticmethod
    def randomString(stringLength=4):
        letters = string.ascii_lowercase
        return ''.join(random.choice(letters) for i in range(stringLength))


class PhenotypeResult(dict):
    def __init__(self, antibiotic):
        self["type"] = "phenotype"
        self["category"] = "amr"
        self["key"] = antibiotic.name
        self["amr_classes"] = antibiotic.classes
        self["resistance"] = antibiotic.name
        self["resistant"] = False

    def set_resistant(self, res):
        self["resistant"] = res

    def add_feature(self, res_collection, isolate, feature):
        # Get all keys in the result that matches the feature in question.
        # Most of the time this will be a one to one relationship.
        # However if several identical features has been found in a sample,
        # they will all have different keys, but identical ref ids.

        ref_id, type = PhenotypeResult.get_ref_id_and_type(feature, isolate)
        feature_keys = PhenotypeResult.get_keys_matching_ref_id(
            ref_id, res_collection[type])
        # Add keys to phenotype results
        pheno_feat_keys = self.get(type, [])
        pheno_feat_keys = pheno_feat_keys + feature_keys
        self[type] = pheno_feat_keys

        # Add phenotype keys to feature results
        features = res_collection[type]
        for feat_key in feature_keys:
            feat_result = features[feat_key]
            pheno_keys = feat_result.get("phenotypes", [])
            pheno_keys.append(self["key"])
            feat_result["phenotypes"] = pheno_keys
        if(type == "genes"):
            db_key = DatabaseHandler.get_key(res_collection, "ResFinder")
        elif(type == "seq_variations"):
            db_key = DatabaseHandler.get_key(res_collection, "PointFinder")
        self["ref_database"] = db_key

    @staticmethod
    def get_ref_id_and_type(feature, isolate):
        type = None
        ref_id = None
        if(isinstance(feature, ResGene)):
            type = "genes"
            ref_id = isolate.resprofile.phenodb.id_to_idwithvar[
                feature.unique_id]
        elif(isinstance(feature, ResMutation)):
            type = "seq_variations"
            ref_id = feature.unique_id
        return (ref_id, type)

    @staticmethod
    def get_keys_matching_ref_id(ref_id, res_collection):
        out_keys = []
        for key, results in res_collection.items():
            if(ref_id == results["ref_id"]):
                out_keys.append(key)

        return out_keys


class ResFinderResultHandler():

    @staticmethod
    def load_res_profile(res_collection, isolate):
        # For each antibiotic class
        for ab_class in isolate.resprofile.phenodb.antibiotics.keys():
            # For each antibiotic in current class
            for phenodb_ab in isolate.resprofile.phenodb.antibiotics[ab_class]:

                phenotype = PhenotypeResult(phenodb_ab)
                # Isolate is resistant towards the antibiotic
                if(phenodb_ab in isolate.resprofile.resistance):
                    phenotype.set_resistant(True)

                    isolate_ab = isolate.resprofile.resistance[phenodb_ab]
                    for unique_id, feature in isolate_ab.features.items():
                        if(isinstance(feature, ResGene)):
                            phenotype.add_feature(res_collection, isolate,
                                                  feature)
                res_collection.add_class(cl="phenotypes", **phenotype)

    @staticmethod
    def standardize_results(res_collection, res, ref_db_name):
        for db_name, db in res.items():
            if(db_name == "excluded"):
                continue

            if(db == "No hit found"):
                continue

            for unique_id, hit_db in db.items():
                if(unique_id in res["excluded"]):
                    continue
                gene_result = GeneResult(res_collection, hit_db, ref_db_name)
                if gene_result["key"] in res_collection["genes"]:
                    res_collection.modify_class(cl="genes", **gene_result)
                else:
                    res_collection.add_class(cl="genes", **gene_result)


class DatabaseHandler():

    @staticmethod
    def load_database_metadata(name, res_collection, db_dir):
        database_metadata = {}
        database_metadata["type"] = "database"
        database_metadata["database_name"] = name

        version, commit = Generator.get_version_commit(db_dir)
        database_metadata["database_version"] = version
        database_metadata["key"] = "{}-{}".format(name, version)
        database_metadata["database_commit"] = commit

        res_collection.add_class(cl="databases", **database_metadata)

    @staticmethod
    def get_key(res_collection, name):
        for key, val in res_collection["databases"].items():
            if(val["database_name"] == name):
                return key


class PointFinderResultHandler():

    @staticmethod
    def load_res_profile(res_collection, isolate):
        # For each antibiotic class
        for ab_class in isolate.resprofile.phenodb.antibiotics.keys():
            # For each antibiotic in current class
            for phenodb_ab in isolate.resprofile.phenodb.antibiotics[ab_class]:

                phenotype = PhenotypeResult(phenodb_ab)
                # Isolate is resistant towards the antibiotic
                if(phenodb_ab in isolate.resprofile.resistance):
                    phenotype.set_resistant(True)

                    isolate_ab = isolate.resprofile.resistance[phenodb_ab]
                    for unique_id, feature in isolate_ab.features.items():
                        if(isinstance(feature, ResMutation)):
                            phenotype.add_feature(res_collection, isolate,
                                                  feature)
                res_collection.add_class(cl="phenotypes", **phenotype)

    @staticmethod
    def standardize_results(res_collection, res, ref_db_name):
        for gene_name, db in res.items():
            if(gene_name == "excluded"):
                continue

            if(db == "No hit found"):
                continue

            ###Added to solve current PointFinder
            if gene_name in res["excluded"]:
                continue
            if(isinstance(db, str)):
                if db.startswith("Gene found with coverage"):
                    continue
            #####               #####

            gene_results = []

            # For BLAST results
            db_hits = db.get("hits", {})

            # For KMA results
            if(not db_hits):
                id = db["sbjct_header"]
                db_hits[id] = db

            for unique_id, hit_db in db_hits.items():
                if(unique_id in res["excluded"]):
                    continue

                gene_result = GeneResult(res_collection, hit_db, ref_db_name)
                res_collection.add_class(cl="genes", **gene_result)
                gene_results.append(gene_result)

            mismatches = db["mis_matches"]

#DEBUG
            for mismatch in mismatches:
                seq_var_result = SeqVariationResult(
                    res_collection, mismatch, gene_results, ref_db_name)
                res_collection.add_class(cl="seq_variations", **seq_var_result)
