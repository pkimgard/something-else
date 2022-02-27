#! /bin/bash
# 2022-02-26
# Showing different ways of working with arrays in bash.
#
# Nice reference:
# https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays
# ------------------------------------------------

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

exit
