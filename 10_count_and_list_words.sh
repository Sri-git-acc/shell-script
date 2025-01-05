#!/bin/bash

echo "Please enter your file name:"
read -r FILE
FILEPATH="/home/ec2-user"
FILENAME=$FILEPATH/$FILE
echo "Filename = $FILE"
COUNT=$(wc -w < $FILENAME)
echo -e "Total word count of $FILE is: $COUNT"

while read -r word;
do
    for each in $word;
    do
        echo "$each"
    done
done < $FILENAME


