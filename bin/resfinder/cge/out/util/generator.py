#!/usr/bin/env python3

from git import Repo
from git.exc import InvalidGitRepositoryError
from datetime import datetime, timezone

from ..result import Result


class Generator():
    """ """

    @staticmethod
    def init_software_result(name, gitdir):
        """"""
        version, commit = Generator.get_version_commit(gitdir)
        date = datetime.now(timezone.utc).date().isoformat()

        result_dict = {
            "type": "software_result",
            "software_name": name,
            "software_version": version,
            "software_commit": commit,
            "run_date": date,
            "key": "{}-{}".format(name, version)
        }
        return Result(**result_dict)

    @staticmethod
    def get_version_commit(gitdir):
        try:
            repo = Repo(gitdir)
        except InvalidGitRepositoryError:
            return ("unknown", "unknown")

        com2tag = {}
        for tag in repo.tags:
            com2tag[tag.commit.hexsha] = str(tag)

        version = com2tag.get(repo.commit().hexsha, repo.commit().hexsha[:7])

        return (version, repo.commit().hexsha)
