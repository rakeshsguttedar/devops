#!/bin/bash
#
# This script files demos how shell script can be used 
# to read user provided inputs during the execution of the 
# script file


# 1. Read inout (basic)
# Prompt the user for their name
echo "Please enter your name:"
read name

# Display a greeting using the user's input
echo "Hello, $name! Nice to meet you."


# 2. Read input with a prompt message: -p for prompt message
read -p "Enter your favorite color: " color

echo "Your favorite color is $color."

# 3. Using read Options: The read command has various options to customize its behavior. For example:

# -p specifies a prompt message.
# -r disables interpreting backslashes, useful for reading file paths.
# -t sets a timeout for input.
# -s hides input (useful for passwords).

# Read password without echoing characters: -s for silent 
read -s -p "Enter your password: " password
echo "Password entered."

# Read input with timeout: -t for specifying timeout period
read -t 10 -p "Enter something in 10 seconds: " timed_input
echo "You entered: $timed_input"
