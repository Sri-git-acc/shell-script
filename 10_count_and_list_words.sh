#!/bin/bash

echo "Please enter your file name:"
read -r FILE
FILEPATH="/home/ec2-user"
FILENAME=$FILEPATH/$FILE
echo "Filename = $FILE"
COUNT=$(wc -w < $FILENAME)
echo -e "Total word count of $FILE is: $COUNT"

while read -r line;
do
    for word in $line;
    do
        LIN=$word
    done
    uniq -c $LIN
done < $FILENAME


