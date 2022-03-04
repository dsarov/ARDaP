#!/usr/bin/env python3


import subprocess


subprocess.run(["git", "status", "--short", "-b"], check=True)
# git tag --contain
