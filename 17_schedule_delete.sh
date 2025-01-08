#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

echo "Please enter your source path:"
read -r SOURCE_PATH

echo

echo "Please enther your destination path"
read -r DEST_PATH

echo "Please enter the age of older files:"
read -r FILE_AGE

VALIDATION() {
    if [ ! -d "$1" ]
    then
        echo -e "$1 $R path is not valid $N"
        exit 1
    fi
}

VALIDATION $SOURCE_PATH
VALIDATION $DEST_PATH

FILES=$(find $SOURCE_PATH -name "*.log" -mtime +$FILE_AGE)

if [ -n "$FILES" ]
then
    echo "Deleting file or files are: $FILES"
fi


