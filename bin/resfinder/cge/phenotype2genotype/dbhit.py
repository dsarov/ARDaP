#!/usr/bin/env python3


class DBHit(object):
    """ A DBHit describes an alignment of a feature to a reference/template.
        The db variable should be used to describe which database the alignment
        in question was done against. For example 'resfinder'

        The match_category variable stores one of the integers:
            1: Match < 100% identity AND match_length < ref_length
            2: Match < 100% identity AND match_length == ref_length
            3: Match == 100% identity AND match_length == ref_length
    """
    def __init__(self, name, identity, match_length, ref_length, start_ref,
                 end_ref, acc, depth=None, db=None):
        self.name = name
        self.identity = float(identity)
        if(match_length == "NA"):
            self.match_length = None
        else:
            self.match_length = int(match_length)
        self.ref_length = int(ref_length)
        self.start_ref = int(start_ref)
        self.end_ref = int(end_ref)
        self.acc = acc
        self.depth = depth
        self.db = db

        if(self.match_length is not None
           and self.ref_length != self.match_length):
            self.match_category = 1
        elif(self.identity < 100.0):
            self.match_category = 2
        else:
            self.match_category = 3
