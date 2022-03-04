#!/usr/bin/env python3

import sys
import re
from string import Template


class PanelNameError(Exception):
    """ Raise when panel name given does not match panel names from file.
    """
    def __init__(self, message, *args):
        self.message = message
        # allow users initialize misc. arguments as any other builtin Error
        super(PanelNameError, self).__init__(message, *args)


class ResSumTable(dict):
    """
    """
    def __init__(self, text):
        """
        """
        self.panels = {}
        self.inclusions = {}
        self.name = ""

        has_missing_features = False
        self.missing_features = []

        for line in text.splitlines():

            # Skip Comments
            if(line.startswith("#")):
                # Storing missing feature headers
                if(has_missing_features):
                    self.missing_features.append(line)

                if(line.startswith("# Sample: ")):
                    self.name = line[10:].strip()
                # Only exists if the table has a missing feature warning
                elif(line.startswith("# WARNING")):
                    has_missing_features = True
                    self.missing_features.append(line)
                continue

            # Skip empty lines
            if(not line):
                continue

            if(has_missing_features):
                self.missing_features.append(line)
            else:
                line_list = line.split("\t")
                self[line_list[0]] = line_list

    def _merge_inclusions(self):
        """
        """
        for panel in self.inclusions:
            panel_list = self.panels[panel]
            include_list = self.inclusions[panel]
            include_abs = []
            for incl_panel in include_list:
                include_abs = include_abs + self.panels[incl_panel]
            self.panels[panel] = panel_list + include_abs

    def _remove_redundancy(self):
        for panel in self.panels:
            panel_list = self.panels[panel]
            self.panels[panel] = list(set(panel_list))

    def load_amr_panels(self, panel_file):
        """
        """
        with open(panel_file, "r") as fh:
            panel_name = None
            re_panel = re.compile(r':Panel:\s{0,1}(.+)$')
            re_include = re.compile(r':Include:\s{0,1}(.+)$')
            for line in fh:

                line = line.rstrip()

                # Skip empty lines
                if(not line):
                    continue

                # Skip Comments
                if(line.startswith("#")):
                    continue

                # Get panel name
                match_panel = re_panel.search(line)
                if(match_panel):
                    panel_name = match_panel.group(1).lower()
                    self.panels[panel_name] = []
                    species_panel_name = None
                    continue

                # Get inclusions
                match_inclusion = re_include.search(line)
                if(match_inclusion):
                    include_panel = match_inclusion.group(1).lower()
                    tmp_list = []

                    if(panel_name in self.inclusions):
                        tmp_list = self.inclusions[panel_name]

                    tmp_list.append(include_panel)
                    self.inclusions[panel_name] = tmp_list

                    continue

                # Antibiotics
                # Stores list of antimicrobials in dict of panel names.
                if(panel_name):
                    if(panel_name in self.panels):
                        tmp_list = self.panels[panel_name]
                        tmp_list.append(line.lower())
                        self.panels[panel_name] = tmp_list
                    else:
                        tmp_list = [line.lower()]
                        self.panels[panel_name] = tmp_list

        self._merge_inclusions()
        self._remove_redundancy()

    def check_panel_name(self, name):
        """ Panel names are expected to consist of "Genus species" or
            only "Genus". The method checks the name against the loaded
            panel names and returns the panel name that matches the
            given name. If no panel name matches it checks if the first
            word of the given name matches any of the genus panel
            names, and considers that a match if found.

            Returns False if no match is found
            Returns None if no panels has been loaded
            Returns the panel name that match
        """
        if(not self.panels):
            return None

        name = name.lower()
        if(name in self.panels):
            return name

        if(name == "complete"):
            return name

        genus_name = " ".split(name)[0]
        if(genus_name in self.panels):
            return genus_name

        return False

    def get_amr_panel_str(self, panel_name_raw, header=False):
        """
        """
        panel_name = self.check_panel_name(name=panel_name_raw)
        if(not panel_name):
            raise(PanelNameError("ERROR: Panel name given was not found among "
                                 "the loaded panels. Panel name given: "
                                 + str(panel_name_raw)))

        output_str = ""

        if(header):
            output_str = (
                "# ResFinder phenotype results for " + panel_name + ".\n"
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

        for ab in self.panels[panel_name]:
            na_list = [ab, "NA", "NA", "NA", "Not in database"]
            ab_list = self.get(ab, na_list)
            output_str += "\t".join(ab_list) + "\n"

        if(self.missing_features):
            output_str += "\n" + "\n".join(self.missing_features)

        return output_str

    def get_html_panel_table(self, panel_name_raw, panel_id, indent='      '):
        panel_name = self.check_panel_name(name=panel_name_raw)
        if(not panel_name):
            raise(PanelNameError("ERROR: Panel name given was not found among "
                                 "the loaded panels. Panel name given: "
                                 + str(panel_name_raw)))

        beg = Template(
            '$indent<div id="$panel_name" class="tabcontent">\n'
            '$indent  <table id="$panel_id" rules="cols">\n'
            '$indent    <thead>\n'
            '$indent      <tr>\n'
            '$indent        <th class="head-ab-col" onclick="sortTable(0, '
            '\'$panel_id\')">Antimicrobial</th>\n'
            '$indent        <th class="head-col" onclick="sortTable(1, '
            '\'$panel_id\')">Class</th>\n'
            '$indent        <th class="head-col" onclick="sortTable(2, '
            '\'$panel_id\')">WGS-predicted phenotype</th>\n'
            '$indent        <th class="head-gene-col" onclick="sortTable(3, '
            '\'$panel_id\')">Genetic background</th>\n'
            '$indent      </tr>\n'
            '$indent    </thead>\n\n')

        output_str = beg.substitute(panel_name=panel_name,
                                    panel_id=panel_id,
                                    indent=indent)

        ab_row = Template(
            '$indent      <tr>\n'
            '$indent        <td class="ab-col">$ab</td>\n'
            '$indent        <td class="class-col">$abclass</td>\n'
            '$indent        <td class="$res">$pheno</td>\n'
            '$indent        <td class="genes-col">$genes</td>\n'
            '$indent      </tr>\n')

        output_str += indent + '    <tbody>\n'

        if(panel_name == "complete"):
            for ab in self:
                na_list = [ab, "NA", "NA", "NA", "Not in database"]
                ab_list = self.get(ab, na_list)
                if(ab_list[3] == "1"):
                    res = 'bggrey'
                elif(ab_list[3] == "2"):
                    res = 'bglightgreen'
                elif(ab_list[3] == "3"):
                    res = 'bggreen'
                else:
                    res = 'sus-col'
                output_str += ab_row.substitute(indent=indent,
                                                ab=ab,
                                                abclass=ab_list[1],
                                                res=res,
                                                pheno=ab_list[2],
                                                genes=ab_list[4])
        else:
            for ab in self.panels[panel_name]:
                na_list = [ab, "NA", "NA", "NA", "Not in database"]
                ab_list = self.get(ab, na_list)
                if(ab_list[3] == "1"):
                    res = 'bggrey'
                elif(ab_list[3] == "2"):
                    res = 'bglightgreen'
                elif(ab_list[3] == "3"):
                    res = 'bggreen'
                else:
                    res = 'sus-col'
                output_str += ab_row.substitute(indent=indent,
                                                ab=ab,
                                                abclass=ab_list[1],
                                                res=res,
                                                pheno=ab_list[2],
                                                genes=ab_list[4])

        output_str += (indent + '    </tbody>\n\n'
                       + indent + '  </table>\n'
                       + indent + '</div>\n')

        return output_str
