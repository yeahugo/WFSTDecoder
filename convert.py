import sys

if len(sys.argv) != 3:
	print "usage: command infile outfile"
	exit()
fin = open(sys.argv[1])
fout = open(sys.argv[2],"w")
for line in fin:
  new_line = ''
  find_prefix = False
  for ch in line:
		if ch == '\\':
			num_octal = ''
			find_prefix = True
			continue
		if find_prefix == True:
		  num_octal += ch
		  if len(num_octal) == 3:
		  	new_line += chr(int(num_octal,8))
		  	find_prefix = False
		else:
		  new_line += ch 
  fout.write(new_line)