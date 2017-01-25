import sys


def unpack(line):
    if line != '':
        return list(map(int, line.split('x')))
    else:
        return 0


def calculate(values):
    l, w, h = sorted(values)
    slack = l * w
    return 2 * l * w + 2 * w * h + 2 * h * l + slack

total = 0
with open(sys.argv[1], 'r') as file:
    for line in file:
        total += calculate(unpack(line))
print(total)
