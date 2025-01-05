#!/bin/bash

echo "Please enter your file name:"
read -r FILENAME
echo "Filename = $FILENAME"

while read -r line
do
    for word in $line
    COUNT=0
    do
        COUNT+COUNT+1
        echo "$word"
    done
done < $FILENAME

