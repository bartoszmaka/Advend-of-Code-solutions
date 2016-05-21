import sys
# 236


class Validator(object):
    def __init__(self):
        self.nice = 0
        self.naughty = 0
        self.excluded = ['ab', 'cd', 'pq', 'xy']
        self.valid_vowels = list('aeiou')

    def verdict(self, word):
        if (self.validate_vowels(word) is True and
                self.validate_row(word) is True and
                self.validate_excluded(word) is True):
            self.nice += 1
        else:
            self.naughty += 1

    def validate_vowels(self, word):
        vowels = 0
        for char in word:
            if char in self.valid_vowels:
                vowels += 1
        if vowels >= 3:
            return True
        else:
            return False

    def validate_row(self, word):
        for i in range(1, len(word)):
            if word[i] == word[i - 1]:
                return True
        return False

    def validate_excluded(self, word):
        for char in self.excluded:
            if char in word:
                return False
        return True

foo = Validator()
with open(sys.argv[1], 'r') as file:
    for line in file:
        foo.verdict(line.rstrip())
print(foo.nice)
