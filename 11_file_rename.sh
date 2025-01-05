#!/bin/bash

PATH="/home/ec2-user"
FILE_NAME=$(find $PATH -name "*.log")
echo "files to rename: $FILE_NAME"
TIMESTAMP=$(date +%Y-%m-%d)

while read -r file
do  
    mv $($PATH/$file) $($PATH/$TIMESTAMP_$file)
done < $FILE_NAME


