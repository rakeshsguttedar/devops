#! /bin/bash
string="Hello World!"


# demonstrates sub string in shell scripting
# format: ${variable:start:length}
substring=${string:7:3}
echo "Original String: $string"
echo "Sub string (starting from 7th, length: 3): $substring"

substring=${string: -6:5}
echo "Sub string (for word at end of a string using negative indexing -6, length: 5): $substring"

searchstr="Hello"
replacestr="Hi"

resultstr=${string//$searchstr/$replacestr}

echo "Original String: $string"
echo "Result string after replacement: $resultstr"
