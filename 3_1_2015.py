import sys
# 2592


class ChristmasCourier(object):
    def __init__(self):
        self.x = 0
        self.y = 0
        self.presents = 1
        self.visited_houses = []

    def move(self, direction):
        if direction == '^':
            self.y += 1
        elif direction == '>':
            self.x += 1
        elif direction == 'v':
            self.y -= 1
        elif direction == '<':
            self.x -= 1
        self.check_visited()
        self.update_history()

    def check_visited(self):
        if (self.x, self.y) not in self.visited_houses:
            self.presents += 1

    def update_history(self):
        self.visited_houses.append((self.x, self.y))

Santa = ChristmasCourier()
with open(sys.argv[1]) as file:
    for char in file.read():
        Santa.move(char)
print(Santa.presents)
