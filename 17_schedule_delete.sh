#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "Please enter your source path:"
read -r $SOURCE_PATH

echo "Please enther your destination path"
read -r $DEST_PATH

echo "Please enter the age of older files:"
read -r $FILE_AGE

VALIDATION(){
    if [! -d $1 ]
    then
        echo -e "$SOURCE_PATH $R path is not valid $N"
        exit 1
    fi
}

VALIDATION $SOURCE_FILE
VALIDATION $DEST_FILE

