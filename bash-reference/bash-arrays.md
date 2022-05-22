# Bash Arrays

Nice reference: https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays

```bash
#! /bin/bash

echo "Script name: $0"
echo "PID: $$"
echo "Running as: $USER\\$HOSTNAME"

if [ $# -eq 0 ]
then
  echo "You didn't supply any arguments."
else
  echo "You ran this script with $# arguments."
  echo "The arguments were: $@"
fi

# Debug line number
echo "You've reached line $LINENO."

# Exit code of last command
id
echo "id exited with status code: $?"

# Generate random number
rand=$RANDOM
echo "Random number: $rand"
printf "Same number in hex: %x\n" $rand

# Iterate through arguments
for arg in "$@"; do echo "$arg"; done

# Print numbers
seq 1 10
echo {1..10}

# User input
echo "Easiest way of user input, awsner please: "
read awn1
read -p "User input with nicer code, type: " awn2
read -sp "Silent user input: " awn3

printf "\nAwsner 1: $awn1\nAwnser 2: $awn2\nAwnser 3: $awn3\n(printf is beter than echo)"

# Declaring and assigning values
array1=("1A" "1B" "1C")
array2=("2A" "2B" "2C")

# If you echo array it will be:
echo 'echo "$array1"'
echo "$array1"

# Print entire array, use @ or *
echo 'echo "${array1[@]}"'
echo "${array1[*]}"

# Printing a value from array
echo 'echo "${array1[2]}"'
echo "${array1[2]}"

# Printing out indexes of array
echo 'echo "${!array1[@]}"'
echo "${!array1[@]}"

# Print length of array
echo 'echo "${#array1[@]}"'
echo "${#array1[@]}"

# Comparing lenghts of two arrays
echo 'if [ "${#array1[@]}" -eq "${#array2[@]}" ]; then echo "Same length."; fi'
if [ "${#array1[@]}" -eq "${#array2[@]}" ]; then echo "Same length."; fi

# Looping through and printing arrays
echo 'for n in ${!array1[@]}; do printf "${array1[n]} ${array2[n]}\n"; done'
for n in ${!array1[@]}; do printf "${array1[n]} ${array2[n]}\n"; done
```
