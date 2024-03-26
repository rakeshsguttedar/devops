#!/bin/bash
# demonstrates arrays in shell scripting

# declare and define an array of fruits
fruits_array=("bananas" "cherry" "apple" "pineapple" "guava" "strawberry")

num_fruits=${#fruits_array[@]}
echo "Fruits array: ${fruits_array[@]}"
echo "Fruit at location 2: ${fruits_array[2]}"
echo "Number of fruits: $num_fruits"

# looping through fruits array using indices
echo "Listing all fruits using indices: "
for index in ${!fruits_array[@]}; do
  printf "${fruits_array[$index]} "
done

echo ""

list_fruits() {
  # iterate array of fruits using a for loop
  echo  "Listing all fruits:"
  for fruit in ${fruits_array[@]}
  do
    printf "$fruit "
  done
  echo ""
}

list_fruits # calling list_fruits function to list all fruits in the fruits array
# Adding and removing elements in the array
echo "Adding orange and mango to fruits array"
fruits_array+=("orange" "mango")
list_fruits
echo "Removing pineapple from fruits array using unset"
unset fruits_array[3] # removes pineapple 
list_fruits # print list of all fruits 
echo "Replaces strawberry with blueberry at location 5"
fruits_array[5]="blueberry"
list_fruits # calling list_fruits
