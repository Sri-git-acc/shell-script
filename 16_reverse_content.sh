#!/bin/bash

echo "Please enter the file path:"
read -r FILE_PATH
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

REVER=$(cat $FILE_PATH | rev)
touch /etc/$TIMESTAMP-reverse-FILE_PATH
mv $REVER /etc/$TIMESTAMP-reverse-FILE_PATH