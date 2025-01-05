#!/bin/bash

echo "Please enter your file name:"
read -r FILENAME
echo "Filename = $FILENAME"

COUNT=0

while read -r line;
do
    for word in $line;
    do
        COUNT++
        echo "$word"
    done
    echo "Number of wordsare: $COUNT"
done <<< $FILENAME

