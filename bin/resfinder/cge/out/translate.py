#!/usr/bin/env python3

from result import Result
from exceptions import CGECoreOutTypeError, CGECoreOutTranslateError


class Translate():

    def __init__(self, type, transl_table):
        self.transl_table = transl_table
        self.type = type

        if(type not in Result.beone_defs):
            raise CGECoreOutTypeError(
                "Unknown type given to Translate object. type given: {}. "
                "type must be one of:\n{}"
                .format(type, list(Result.beone_defs.keys())))

        self._check_translation_keys()

    def translate(self, source_dict):
        dest_dict = {}
        for key, val in source_dict.items():
            dest_key = self.transl_table.get(key, None)
            if(dest_key is not None and val is not None):
                dest_dict[dest_key] = val
        return dest_dict

    def _check_translation_keys(self):
        for key, val in self.transl_table.items():
            if(val not in Result.beone_defs[self.type]):
                raise CGECoreOutTranslateError(
                    "Value in the translation table given was not found in the"
                    " definition of the given type. Type given: {}. Value not "
                    "found: {}. Possible values for the given type: {}"
                    .format(self.type, self.key,
                            list(self.transl_table.keys())))
