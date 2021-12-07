#!/usr/bin/env python3
import os.path

from cge.out.util.generator import Generator

from git import Repo


# git_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
git_path = os.path.abspath(os.path.dirname(__file__))
print("Git path: {}".format(git_path))
repo = Repo(git_path)
commit = repo.commit()

com2tag = {}
for tag in repo.tags:
    com2tag[tag.commit.hexsha] = str(tag)

version = com2tag.get(repo.commit().hexsha, repo.commit().hexsha[:7])
print("Version: {}".format(version))

git_path = os.path.abspath(os.path.dirname(__file__))
result = Generator.init_software_result(name="ResFinder", gitdir=git_path)
print(str(result))
