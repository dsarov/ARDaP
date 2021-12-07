#!/usr/bin/env python3

from result import Result
from exceptions import CGECoreOutTypeError


class CGEOutTemplate(dict):

    def __init__(self, template):
        if(template not in Result.beone_defs):
            raise CGECoreOutTypeError(
                "Unknown template given. Template given: {}. Template must be"
                " one of:\n{}"
                .format(template, list(Result.beone_defs.keys())))

        for key in Result.beone_defs.keys():
            self[key] = None
        self["type"] = template
