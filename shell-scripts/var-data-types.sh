#!/bin/bash

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

# Concatenation
greeting="Hello"
subject="World"
message="$greeting, $subject!"
echo $message  # Output: Hello, World!

# String Length
string="Shell Scripting"
length=${#string}
echo "Length: $length"  # Output: Length: 15

# Substring Extraction
substring=${string:0:4}  # Extracts first 4 characters
echo "Substring of string: \"$string\" is $substring"  # Output: Substring: Shell
