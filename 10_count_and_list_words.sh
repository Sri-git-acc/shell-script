#!/bin/bash

echo "Please enter your file name:"
read -r FILENAME
echo "Filename = $FILENAME"

COUNT=0

while read -r line
do
    for word in $line
    do
        COUNT=COUNT+1
        echo "$word"
    done
done < "$FILENAME"

