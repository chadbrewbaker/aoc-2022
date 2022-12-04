import sys
from parse import *

text_file = open(sys.argv[1], "r")
data = text_file.read()
text_file.close()
elf_assign_raw = data.split("\n")
elf_assign_raw.pop() #remove last empty elt
contain_count = 0
for line in elf_assign_raw:
	x1, x2, y1, y2 = map(int,list(parse( "{}-{},{}-{}", line)))
	if(x1 <= y1 and x2 >= y2 or  y1 <= x1 and y2 >= x2):
		contain_count = contain_count +1
print(contain_count)

overlap_count = 0
for line in elf_assign_raw:
	x1, x2, y1, y2 = map(int,list(parse( "{}-{},{}-{}", line)))
	if(not (x2 < y1 or  y2 < x1)):
		overlap_count = overlap_count +1
print(overlap_count)
