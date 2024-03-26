#!/bin/bash

# NAme: Rakesh
# Date: 04-11-2023
# demonstrate the usage of functions in bash scripting
# function to return the sum of three numbers
#

sum() {
    local result=$(($1 + $2 + $3)) # adding positional parameters of sum function
    # result is a local variable which is visible only within sum function
    return $result
}

echo "This script prints the sum of three numbers, it reads the third number"
num1=5 # global variable
num2=3 # global variable
echo "The two numbers are $num1 and $num2, enter third number: "
read num3 # read third number from stdin

# calling the function sum with three arguments
sum $num1 $num2 $num3 

# accessing the return value of sum function in exit value $?
echo "The sum of $num1, $num2 and $num3 is : $?"
