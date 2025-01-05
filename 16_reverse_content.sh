#!/bin/bash

echo "Please enter the file path:"
read -r FILE_PATH

REVER=$(cat $FILE_PATH | rev)
echo $REVER
# mv $REVER /etc