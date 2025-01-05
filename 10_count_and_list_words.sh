#!/bin/bash

echo "Please enter your file name:"
read -r FILENAME
echo "Filename = $FILENAME"

echo -e "word count of $FILENAME is: wc -w $FILENAME"

while read -r line;
do
    for word in $line;
    do
        echo "$word"
    done
done <<< $FILENAME


