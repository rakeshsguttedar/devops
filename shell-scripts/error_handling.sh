#!/bin/bash

# error_handling

# Error handling in shell script using three methods:
# 1. Using exit status code to check for errors in execution
# 2. Error handling with Error message and exitting with a status code
# 3. Error handling using trap


# 1. Using exit status code to check for errors in execution

# list files - checking exit code for error status using $?
ls /non-existing-dir

# exit code 0 is for success
if [ $? -eq 0 ]
then
  echo "Directory exists"
else
  echo "Exit code using \$? is $?"
  echo "Directory does not exist"
fi

echo "Done"

# 2. Error handling with Error message and exitting with a status code

file="file-not-exist.txt"

if [ ! -f "$file" ]
then
  echo "Error: file does not exist"
  exit 1 # exitting with exit status 1 
fi

echo "File Exists"

# Third type of error handling using trap is shown in  trap.sh file
