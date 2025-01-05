#!/bin/bash

echo "Please enter the file path:"
read -r FILE_PATH
cat $FILE_PATH | rev
# REVER=$(cat $FILE_PATH | rev)
# mv $REVER /etc