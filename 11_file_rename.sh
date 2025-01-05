#!/bin/bash

SOURCE_DIR="/home/ec2-user/shell-script"
FILE_NAME=$(find $SOURCE_DIR -name "*.log")
# echo "files to rename: $FILE_NAME"
TIMESTAMP=$(date +%Y-%m-%d)

while read -r file
do  
    cd /home/ec2-user/shell-script
    echo "renaming file: $file"
    F1=$($file | cut -d "/" -f5)
    F2=$($TIMESTAMP_$F1)
    mv $F1 $F2
done <<< $FILE_NAME


