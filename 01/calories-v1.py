import sys

text_file = open(sys.argv[1], "r")
data = text_file.read()
text_file.close()
elf_sacks_raw = data.split("\n\n")
elf_calories = []
for sack in elf_sacks_raw:
	items = sack.split()
	items = list(map(int, items))
	elf_calories.append(sum(items))
print(max(elf_calories))
 
