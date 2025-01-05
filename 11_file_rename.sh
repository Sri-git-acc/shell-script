#!/bin/bash

SOURCE_DIR="/home/ec2-user"
FILE_NAME=$(find $SOURCE_DIR -name "*.log")
# echo "files to rename: $FILE_NAME"
TIMESTAMP=$(date +%Y-%m-%d)

while read -r file
do  
    echo "renaming file: $file"
    F1=$($SOURCE_DIR/$file)
    F2=$($SOURCE_DIR/$TIMESTAMP_$file)
    mv F1 F2
done <<< $FILE_NAME


