#!/bin/bash

echo "Please enter the file path:"
read -r FILE_PATH
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
FILE=$(echo $FILE_PATH | cut -d "/" -f4)
FILE_DIR=$(echo $FILE_PATH | cut -d "/" -f1-3)
echo $FILE_DIR
# mkdir -p $FILE_DIR/reverse
# cat $FILE_PATH | $FILE_DIR/reverse/$FILE-$TIMESTAMP





