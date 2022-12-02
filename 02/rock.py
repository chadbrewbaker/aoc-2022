
import sys

decode = {}
decode['A']='R'
decode['B']='P'
decode['C']='S'
decode['X']='R'
decode['Y']='P'
decode['Z']='S'

rps = {}
rps['RR']= rps['PP'] = rps['SS'] =  'T'
rps['RP']= rps['PS'] = rps['SR'] =  'L'
rps['PR']= rps['SP'] = rps['RS'] =  'W'

score = {}
score['R']=1
score['P']=2
score['S']=3
score['T']=3
score['L']=0
score['W']=6

def getscore(p2, p1):
	winscore = score[rps[ decode[p1]+decode[p2] ]]
	playscore = score[decode[p1]]
	return winscore + playscore
assert(getscore('A','Y') == 8) 
assert(getscore('B','X') == 1)
assert(getscore('C','Z') == 6)


text_file = open(sys.argv[1], "r")
data = text_file.read()
text_file.close()
elf_plays = data.split("\n")
total_score = 0
for play in elf_plays:
	items = play.split()
	if len(items) < 2:
		continue
#	print(items)
	total_score = total_score + getscore(items[0],items[1])
print(total_score)
