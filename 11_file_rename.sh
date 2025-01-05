#!/bin/bash

PATH="/home/ec2-user"
FILES=$(find $PATH -name "*.log")
echo "files to rename: $FILES"
TIMESTAMP=$(date +%Y-%m-%d)

while read -r file
do  
    mv $($PATH/$file) $($PATH/$TIMESTAMP_$file)
done < $FILES


