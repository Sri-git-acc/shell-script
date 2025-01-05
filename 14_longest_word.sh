#!/bin/bash
echo "Please enter the file path:"
read -r FILE_PATH
COUNT=0

while read -r line
do
    for word in $line
    do
        F1=${#word}
        if [ $F1 -gt $COUNT ]
        then
            COUNT=$F1
            WOR=$word
        fi
    done
done < $FILE_PATH
echo "Longest word is: $WOR"