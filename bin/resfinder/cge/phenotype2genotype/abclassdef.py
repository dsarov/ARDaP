#!/usr/bin/env python3


class ABClassDefinition(dict):
    """ A dict mapping antibiotics to classes.
    """
    def __init__(self, def_file):
        with open(def_file, "r") as fh:
            for line in fh:
                if(line.startswith("#")):
                    continue

                line = line.rstrip().lower()

                if(not line):
                    continue

                entries = line.split("\t")
                ab_class = entries[0]

                for antibiotic in entries[1:]:
                    classes = self.get(antibiotic, [])
                    classes.append(ab_class)
                    self[antibiotic] = classes
