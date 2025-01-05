#!/bin/bash

SOURCE_DIR="/home/ec2-user"
FILE_NAME=$(find $SOURCE_DIR -name "*.log")
echo "files to rename: $FILE_NAME"
TIMESTAMP=$(date +%Y-%m-%d)

while read -r file
do  
    # echo "renaming file: $file"
    mv $SOURCE_DIR/$file $SOURCE_DIR/$TIMESTAMP_$file
done < $FILE_NAME


