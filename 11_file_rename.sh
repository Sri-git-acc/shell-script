#!/bin/bash

SOURCE_DIR="/home/ec2-user"
FILE_NAME=$(find $SOURCE_DIR -name "*.log")
TIMESTAMP=$(date +%Y-%m-%d)


while read -r file
do  
    cd /home/ec2-user/shell-script
    echo "renaming file: $file"
    F1=$(echo $file | cut -d "/" -f4)
    F2=$SOURCE_DIR/$TIMESTAMP-$F1
    mv $file $F2
    echo "file $file renamed to $F2"
done <<< $FILE_NAME


