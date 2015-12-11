#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import codecs
import argparse


def parse_cmd_args():
    parser = argparse.ArgumentParser(description='run the procedure of advice opinion extraction')
    parser.add_argument('command', help='the command to execute on each line')
    parser.add_argument('-i', '--inpath', help='input data path')
    parser.add_argument('-o', '--outpath', help='output data path')
    parser.add_argument('-e', '--encoding', type=str, default='utf-8', help='input file encoding')
    args = parser.parse_args()
    return args


def main():
    args = parse_cmd_args()
    command = args.command.decode('utf-8')
    encoding = args.encoding
    inpath = args.inpath
    outpath = args.outpath

    if not command:
        raise ValueError('command must not be empty')

    if inpath:
        fi = codecs.open(inpath)
    else:
        fi = sys.stdin

    if outpath:
        fo = codecs.open(outpath, 'wb')
    else:
        fo = sys.stdout

    for line in fi:
        line = line.rstrip('\n')
        line = line.decode(encoding)
        exec(command)
        if line:
            fo.write('%s\n' % line.encode(encoding))

    if inpath:
        fi.close()
    if outpath:
        fo.close()


if __name__ == '__main__':
    main()
