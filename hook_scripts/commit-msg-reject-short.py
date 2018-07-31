#! /usr/bin/env python3

import argparse
import re
import sys

# This script takes 1 argument: the file where the commit message is stored.
parser = argparse.ArgumentParser()
parser.add_argument('commit_file', type=str)
args = parser.parse_args()

with open(args.commit_file, 'r') as f:
    lines = f.readlines()

# Remove any comments
lines = [line for line in lines if not line.strip().startswith('#')]

# Check if vowels exist in any lines.
pattern = re.compile(r'[aeiou]')
for line in lines:
    if pattern.search(line):
        print("Error: Commit cannot contain any vowels:")
        print(line)
        # It contains a vowel! Return a non-zero exit code.
        sys.exit(1)
