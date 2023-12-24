#!/bin/bash

# How to use case statement in shell scripting
# 
echo "This program demonstrates working of case statement in shell"
echo "Enter one amoung these fruits:  apple banana orange"
echo "its case sensitive, apple is not Apple"
read fruit

# fruit="apple"

case $fruit in
    "apple")
        echo "It's an apple"
        ;;
    "banana")
        echo "It's a banana"
        ;;
    "orange")
        echo "It's an orange"
        ;;
    *)
        echo "Unknown fruit"
        ;;
esac
