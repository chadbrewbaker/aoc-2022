import sys

text_file = open("input.txt", "r")
data = text_file.read().split("\n")
text_file.close()

for sack in data:
    assert( len(sack) %2 == 0)
    firstpart, secondpart = sack[:len(sack)//2], sack[len(sack)//2:]
    p1 = set(list(firstpart))
    p2 = set(list(secondpart))
    common = p1.intersection(p2)
    assert(len(common) <= 1)
    print(common)

