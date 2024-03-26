#!/bin/bash
# this program demonstrates working of functions in shell script

# simple function called with no arguments and no return values
simple_function() {
  echo "simple function called.."
}

# a function called with 2 arguments but does not return anything
print_args() {
  echo "$FUNCNAME function is called with arguments: $@"
  echo "$1 $2!"
}

# adder1 function called with 2 arguments but returns the result using echo
adder1() {
  result1=$(($1+$2))
  echo $result1
}

# adder2 function called with 2 arguments but and returns 
# the result in exit code variable $?
adder2() {
  local n1=$1
  local n2=$2
  local result2=$((n1+n2))
  return $result2
}

# calling simple_function
simple_function

# print arguments 
print_args "Hello" "world"
echo 
echo "This program prints sum of two numbers using functions"
read -p "Enter a number: " num1
read -p "Enter another number: " num2

# two methods of calling a function: method 1
sum1=$(adder1 $num1 $num2)
echo "Sum1 of $num1 and $num2 is $sum1"

# two methods of calling a function: method 2
adder2 $num1 $num2
echo "Sum2 of $num1 and $num2 is $?"
