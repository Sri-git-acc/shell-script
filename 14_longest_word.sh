#!/bin/bash
echo "Please enter the file path:"
read -r FILE_PATH

while read -r line
do
    for word in $line
    do
        COUNT=0
        F1=${#word}
        # echo "Word count of $word is: $F1"
        if [ $F1 -gt $COUNT ]
        then
            COUNT=$F1
            WOR=$word
            echo "Longest word is: $WOR"
        fi
    done
done < $FILE_PATH