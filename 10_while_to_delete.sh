#!/bin/bash

while read -r file <<< 09_delete.sh
do
    echo "Deleting file: $file"
    rm -rf $file
    echo "Deleted file: $file"
done 
#