#!/bin/bash
#cat $0 # prints this program to stdout
for color in red blue green
do
  echo "Color: $color"
done

echo "for loop with numbers {1..5}"
for number in {1..5}
do
  echo "Number: $number"
done

# while loop: prints count 1 to 5 
echo "while loop"
count=1
while [ $count -le 5 ]
do
    echo "Count: $count"
    ((count++))
done

# until loop: prints 0 to 4 or until num is greater than or equal to 5
echo "until loop"
num=0
until [ $num -ge 5 ]; do
    echo "Number: $num"
    ((num++))
done
