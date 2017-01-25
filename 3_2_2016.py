import sys
# 2592


class ChristmasCourier(object):
    presents = 0
    visited_houses = []

    def __init__(self):
        self.x = 0
        self.y = 0
        self.check_visited()
        self.update_history()

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
        if (self.x, self.y) not in ChristmasCourier.visited_houses:
            ChristmasCourier.presents += 1

    def update_history(self):
        ChristmasCourier.visited_houses.append((self.x, self.y))

Santa = ChristmasCourier()
RoboSanta = ChristmasCourier()
iteration = 0

with open(sys.argv[1]) as file:
    for char in file.read():
        if iteration % 2 == 0:
            Santa.move(char)
        else:
            RoboSanta.move(char)
        iteration += 1

print(ChristmasCourier.presents)
