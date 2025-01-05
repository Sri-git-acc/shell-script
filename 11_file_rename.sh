#!/bin/bash

PATH="/home/ec2-user"
FILES=$(find $PATH -name "*.log")
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

while read -r file
do  
    mv $($PATH/$file) $($PATH/$TIMESTAMP_$file)
done < $FILES


