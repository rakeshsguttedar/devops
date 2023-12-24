#!/bin/bash

# grep sed and awk command for regular expression text search, 
# pattern matching and text replacement

grep "To the lascivious pleasing of a lute" sample-text.txt

# sed is a stream editor which processes the input line by line 
# and modifies the line based on the options passed to the sed
sed 's/date/rakesh/' sample-text.txt

# awk command is a powerful text manipulation command 
# and it has programming language features to work on 
# formatted or structured files with fields like csv files
awk '$2 < 30 { print $1 " " $2}' data.txt
