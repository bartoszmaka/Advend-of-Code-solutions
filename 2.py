import sys


def unpack(line):
    if line != '':
        return list(line.split('x'))
    else:
        return 0


def calculate(values):
      

file = open(sys.argv[1], 'r')
