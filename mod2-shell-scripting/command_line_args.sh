#!/bin/bash
# command line arguments
# usage: ./command_line_args arg1 arg2 arg3 arg4

echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Total number of arguments: $#"
echo "All arguments as list: $@"
echo "All arguments as string: $*"

