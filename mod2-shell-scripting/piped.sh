#!/bin/bash

# piped.sh
#
# to list the files and folders 
ls -l | grep ".txt"

# count the number of lines using pipe and word count wc command
cat data.txt | wc -l
