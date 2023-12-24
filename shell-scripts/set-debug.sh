#!/bin/bash

# set commands to enable debugging

# Using set -x and set -e for debugging is better than older 
# method of debugging the script using echo statements inside 
# the script

# set -x prints every executing statement using + to help us 
# debug the script
set -x

# if script fails, -e option will exit the sript immediately 
# to help us pin-point the location where the error has occurred
set -e

# String Variable
name="John"
echo "Hello, $name!"  # Output: Hello, John!

# Integer Variable
# age = 25
# the above statement will not work as we have a space surrounding =

age=25
echo "Age: $age years"  # Output: Age: 25 years

# Arithmetic Operations
x=10
y=5
sum=$((x + y))
echo "Sum of $x and $y: $sum"  # Output: Sum: 15

ls /non-existing-dir

# the below command will not run because of set -e option
echo "Script is done"
