#!/usr/bin/env python3

from ..result import Result


class Convert():
    """ """

    @staticmethod
    def toCSVTable(result_list):
        """"""
        out = ""
        if(not result_list):
            return out

        # Get all headers
        headers = set()
        for result in result_list:
            headers.update(result.keys())

        headers.remove("key")
        headers = list(headers)

        out = "\t".join(headers)
        out = "key\t{}".format(out)

        for result in result_list:
            entry = [str(result["key"])]
            for header in headers:
                val = result.get(header, "NaN")
                entry.append(str(val))
            entry_str = "\t".join(entry)
            out = "{}\n{}".format(out, entry_str)

        return out
