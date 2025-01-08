#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE=$(echo $0 | awk -F "/" '{print $NF}' | cut -d "." -f1 | cut -d "_" -f2-3)

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
    ZIP_FILE=$($DEST_PATH/$LOG_FILE-$TIMESTAMP.zip)
    find $SOURCE_PATH -name "*.log" -mtime +$FILE_AGE | zip #@ "ZIP_FILE"
    if [ -f $ZIP_FILE ]
    then
        echo "successfully created zip file for greater than 14days files"
        while read -r dfile
        do
            rm -rf $dfile
            echo "Deleted $dfile"
        done < $FILES
    else 
        echo "Unable to zip file"
else
    echo "No file/files greater than $FILE_AGE days are found"
fi


