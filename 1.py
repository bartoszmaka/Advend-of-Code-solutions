import sys

floor = 0
with open(sys.argv[1]) as file:
    for char in file.read():
        print(char)
        if char == '(':
            floor += 1
        elif char == ')':
            floor -= 1
print(floor)
