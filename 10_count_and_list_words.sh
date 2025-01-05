#!/bin/bash

# echo "Please enter your file name:"
# read -r FILENAME
# echo "Filename = $FILENAME"

# COUNT=0

# while read -r line;
# do
#     for word in $line;
#     do
#         COUNT++
#         echo "$word"
#     done
#     echo "Number of words are: $COUNT"
# done <<< $FILENAME

if [ $# -eq 0 ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

filename="$1"

# Read the file word by word
while read -r line; do
  for word in $line; do
    echo "$word"
  done
done < "$filename"

