#!/bin/bash

echo "Please enter your file name:"
read -r FILE
FILEPATH="/home/ec2-user"
FILENAME=$FILEPATH/$FILE
echo "Filename = $FILENAME"
COUNT=$(wc -w $FILENAME)
echo -e "word count of $FILENAME is: $COUNT"

while read -r line;
do
    for word in $line;
    do
        echo "$word"
    done
done <<< $FILENAME


