#! /usr/bin/env python3

import argparse

# This script takes 1 argument: the file where the commit message is stored.
parser = argparse.ArgumentParser()
parser.add_argument('commit_file', type=str)
args = parser.parse_args()

ascii_art = """
# Please enjoy this ascii art of a cat.

   _._     _,-'""`-._
  (,-.`._,'(       |\`-/|
      `-.-' \ )-`( , o o)
            `-    \`_`"'-
"""

with open(args.commit_file, 'a') as f:
    f.write('\n')
    f.write(ascii_art)
