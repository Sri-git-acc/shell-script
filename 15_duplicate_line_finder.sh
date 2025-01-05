#!/bin/bash

echo "Please enter the file path:"
read -r FILE_PATH
FILE=$(echo $FILE_PATH | cut -d "/" -f4)
echo $FILE
# sort $FILE | uniq -cd