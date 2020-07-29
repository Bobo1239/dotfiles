#!/usr/bin/env python3

import subprocess
import sys

args = sys.argv[1:]
for i in range(len(args)):
    args[i] = args[i].replace("gitea@bobo1239.tk", "git@github.com")
    args[i] = args[i].replace("gitea@git.bobo1239.tk", "git@github.com")

subprocess.run(["ssh"] + args)
