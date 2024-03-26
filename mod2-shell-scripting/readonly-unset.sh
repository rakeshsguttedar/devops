#!/bin/bash
# Read only variable declaration
# unset command to unset the value that is assigned to the variable
#
#


readonly pi=3.14159
pi=3.14  # This will result in an error

# Error:  ./readonly-unset.sh line 8: pi: readonly variable

# You can unset (delete) a variable using the unset command
myvar=100
unset myvar
echo $myvar
# Output: prints nothing
