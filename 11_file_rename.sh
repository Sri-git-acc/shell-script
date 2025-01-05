#!/bin/bash

SOURCE_DIR="/home/ec2-user"
FILE_NAME=$(find $SOURCE_DIR -name "*.log")
# echo "files to rename: $FILE_NAME"
TIMESTAMP=$(date +%Y-%m-%d)
# echo $TIMESTAMP

while read -r file
do  
    cd /home/ec2-user/shell-script
    echo "renaming file: $file"
    F1=$(echo $file | cut -d "/" -f4)
    # echo $F1
    F2=$SOURCE_DIR/$TIMESTAMP-$F1
    # echo $F2
    mv $file $F2
done <<< $FILE_NAME


