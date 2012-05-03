#!/usr/bin/python
#
#	QIF file generator
#
#	Screen scrape from Romeoville Community Credit Union
#

import string, sys, re

Amount_regex = "(-|)(\d{1,}[,])?(\d{1,3}[.])\d{2}"
ctr = 0

#f=open('dump.txt', 'r')
print >> sys.stderr, "Paste the Transactions here and then type [ENTER, CTRL-D, CTRL-C] to write the QIF file"

print "!Type:Bank"

#for line in f:
for line in sys.stdin:

	if len(line.strip()) == 0: continue
	Date = Amount = Desc = Check = Type = ""
	ctr += 1
	Date = line[:10]
	Line = line[10:]
	
	m = re.search(Amount_regex, Line)
	if m: Amount = m.group().strip()
	
	if Amount[0] == "-": Type = "Debit"
	else: Type = "Credit"
	
	idx = Line.index(Amount)
	Desc = Line[:idx]

	if Type == "Debit":
	
		# Capture check number if one exists
		m = re.match('(SHARE DRAFT WITHDRAWAL)(.*)(\d*)', Desc) 
		if m:
			Desc = m.group(1).strip()
			Check  = m.group(2).strip()
			if Check == "0": Check = ""

	print "^"
	print "D%s" % Date.strip()
	print "U%s" % Amount.strip()
	print "T%s" % Amount.strip()
	if Check != "": print "N%s" % Check.strip()
	print "P%s" % Desc.strip()
	print "M%s" % Desc.strip()

#print "Total transactions: %s" % ctr	

#f.close

#def file_len(full_path):
#  """ Count number of lines in a file."""
#  f = open(full_path)
#  nr_of_lines = sum(1 for line in f)
#  f.close()
#  return nr_of_lines