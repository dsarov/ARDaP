#!/usr/bin/env python3

import json
import os.path

from result import Result
from exceptions import CGECoreOutTypeError, CGECoreOutInputError
from template import CGEOutTemplate
from translate import Translate


try:
    CGEOutTemplate("nonsense")
except CGECoreOutTypeError:
    print("Caught expected template error.")

soft_dict = CGEOutTemplate("software_result")
soft_dict["software_name"] = "ResFinder"
soft_dict["key"] = "soft_dict key"
soft_dict["version"] = "3.2.0"

soft_result = Result(**soft_dict)

test_gene = {
    "type": "gene",
    "key": "some_gene_key",
    "name": "gen_name",
    "identity": "187",
    "alignment_length": "800",
    "ref_gene_lenght": "800",
    "coverage": "89",
    "ref_id": "some_ref_id"
}

soft_result.add_class(cl="genes", **test_gene)

test_dict = {
    "type": "software_result",
    "software_name": "ResFinder",
    "software_version": "4.0",
    "run_date": "20200214",
    "key": "software_key"
}

result = Result(result_type="software_result", **test_dict)
result.add_class(cl="genes", **test_gene)

test_trans_table = {
    "primary": "key",
    "gene": "name",
    "id": "identity",
    "alignment": "alignment_length",
    "gene_lenght": "ref_gene_lenght",
    "cov": "coverage"
}

translator = Translate("gene", test_trans_table)

test_gene2 = {
    "primary": "some_gene_key2",
    "gene": "gen_name2",
    "id": "97",
    "alignment": "800",
    "gene_lenght": "800",
    "cov": "99"
}

result.add_class(cl="genes", result_type="gene",
                 **translator.translate(test_gene2))

try:
    result.check_results()
    soft_result.check_results()
except CGECoreOutInputError as e:
    print("Error dict:\n{}".format(e.errors))

print(json.dumps(result))
print(json.dumps(soft_result))
