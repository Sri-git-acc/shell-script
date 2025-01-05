#!/bin/bash
echo "Please enter the file path:"
read -r FILE_PATH

while read -r line
do
    for word in $line
    do
        F1=${#word}
        echo "Word count of $word is: $F1"
    done
done < $FILE_PATH