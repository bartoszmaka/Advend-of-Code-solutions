import sys
# 2592


class Trip(object):
    def __init__(self):
        self.x = 0
        self.y = 0
        self.presents = 1
        self.visited_houses = []

    def move(self, delta_x, delta_y):
        self.x += delta_x
        self.y += delta_y
        self.check_visited()
        self.update_history()

    def check_visited(self):
        if (self.x, self.y) not in self.visited_houses:
            self.presents += 1

    def update_history(self):
        self.visited_houses.append((self.x, self.y))

santa = Trip()
with open(sys.argv[1]) as file:
    for char in file.read():
        if char == '^':
            santa.move(0, 1)
        elif char == '>':
            santa.move(1, 0)
        elif char == 'v':
            santa.move(0, -1)
        elif char == '<':
            santa.move(-1, 0)
        # else:
        #     print('unknown char')
print(santa.presents)
