#!/bin/bash
variable="Hello World"
echo "Using double quotes: $variable"
echo 'Using single quotes: $variable'
echo Using no quotes: $variable
echo "Using double quotes: '$variable'"
echo Using quotes on a varible: '$variable'


# output:
# Using double quotes: Hello World
# Using single quotes: $variable
# Using no quotes: Hello World
# Using double quotes: 'Hello World'
# Using quotes on a varible: $variable

