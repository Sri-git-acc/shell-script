#!/bin/bash

echo "Please enter the file path:"
read -r FILE_PATH
echo $FILE_PATH
FILE=$(echo $FILE_PATH -d "/" -f4)
echo $FILE
# sort $FILE | uniq -cd