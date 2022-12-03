import sys

text_file = open("input.txt", "r")
data = text_file.read().split("\n")
text_file.close()

# Lowercase item types a through z have priorities 1 through 26.
# Uppercase item types A through Z have priorities 27 through 52.
def get_value(c):
    c = ord(c)
    if(c < ord('a')):
       return (c - ord('A')) + 27
    else:
         return (c - ord('a')) + 1
assert(get_value('a')==1)
assert(get_value('A')==27)

psum = 0
for sack in data:
    assert( len(sack) %2 == 0)
    firstpart, secondpart = sack[:len(sack)//2], sack[len(sack)//2:]
    p1 = set(list(firstpart))
    p2 = set(list(secondpart))
    common = p1.intersection(p2)
    assert(len(common) <= 1)
    if(len(list(common))>0):
        c = list(common)[0]
        assert( (ord(c) >= ord('a') and ord(c) <= ord('z'))  or (ord(c) >= ord('A') and ord(c) <= ord('Z')) )
        psum = psum + get_value(c)
print(psum)

psum = 0
x = iter(data)
for a, b, c in zip(x, x, x):
    i = set(list(a)).intersection(set(list(b))).intersection(set(list(c)))
    psum = psum + get_value(list(i)[0])
print(psum)
