#!/bin/bash

echo "Please enter the file path to edit a word:"
read -r FILE_PATH

echo "Enter the word to replace:"
read -r WORD

echo "Enter the word to replace with:"
read -r REP

while read -r line
do 
    for word in $line
    do
        if [ $word = $WORD ]
        then
            sed "s|$WORD|$REP"
        fi
    done
done < $FILE_PATH