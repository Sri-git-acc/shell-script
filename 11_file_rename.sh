#!/bin/bash

SOURCE_DIR="/home/ec2-user"
FILE_NAME=$(find $SOURCE_DIR -name "*.log")
# echo "files to rename: $FILE_NAME"
TIMESTAMP=$(date +%Y-%m-%d)

while read -r file
do  
    echo "renaming file: $file"
    F1=$($file | cut -d "/" -f4)
    F2=$($SOURCE_DIR/$TIMESTAMP_$F1)
    mv $file F2
done <<< $FILE_NAME


