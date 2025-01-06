#!/bin/bash

echo "Please enter the file path:"
read -r FILE_PATH
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
FILE=$(echo $FILE_PATH | cut -d "/" -f4)

REVER=$(cat $FILE_PATH | rev)
mkdir /tmp/reverse
cp $REVER /tmp/reverse/$TIMESTAMP-$FILE



////////////////////////////////////////////////////////PENDING//////////////////////////////////////////////////////