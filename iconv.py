#!/usr/bin/env python
# -*- coding: utf-8 -*-


import sys
import codecs
import argparse


def parse_cmd_args():
    parser = argparse.ArgumentParser(description='tansfer encoding. Ignore errors. Output to stdout')
    parser.add_argument('-p', '--from_file', default=None, help='from file')
    parser.add_argument('-f', '--from_encode', default=-1, help='from encoding')
    parser.add_argument('-t', '--to_encode', default=-1, help='to encoding')
    args = parser.parse_args()
    return args


def run(inpath, from_encode, to_encode):
    if inpath:
        with codecs.open(inpath, encoding=from_encode, errors='ignore') as fi:
            for line in fi:
                sys.stdout.write(line.encode(to_encode))
    else:
        for line in sys.stdin:
            sys.stdout.write(line.decode(from_encode).encode(to_encode))
    return None


def main():
    args = parse_cmd_args()
    run(args.from_file, args.from_encode, args.to_encode)
    return None


if __name__ == '__main__':
    main()
