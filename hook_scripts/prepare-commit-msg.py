#! /usr/bin/env python3

import argparse

# This script takes between 1-3 arguments.
parser = argparse.ArgumentParser()
# The first argument is the file where the commit message is stored.
parser.add_argument('commit_file', type=str)
# The other arguments are optional. We will ignore them for this demo.
parser.add_argument('extra', type=str, nargs='*')
args = parser.parse_args()

ascii_art = """
# Please enjoy this ascii art of a cat.

   _._     _,-'""`-._
  (,-.`._,'(       |\`-/|
      `-.-' \ )-`( , o o)
            `-    \`_`"'-
"""

with open(args.commit_file, 'r+') as f:
    content = f.read()
    f.seek(0, 0)
    f.write('\n')
    f.write(ascii_art)
    f.write(content)
