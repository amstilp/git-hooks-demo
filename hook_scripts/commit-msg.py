#! /usr/bin/env python3

import argparse

# This script takes 1 argument: the file where the commit message is stored.
parser = argparse.ArgumentParser()
parser.add_argument('commit_file', type=str)
args = parser.parse_args()

with open(args.commit_file, 'r') as f:
    content = f.read()
print(content)
