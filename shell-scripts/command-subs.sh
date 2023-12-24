#!/bin/bash
# This script demonstrates command substitution in shell scripting
#
#

# Using backticks ` 
current_date=`date`
echo "Current date with time is: $current_date"

# Using $(...)
current_time=$(date +%H:%M:%S)
echo "Current time: $current_time"
