#!/bin/bash

while read -r file 
do
    echo "Deleting file: $file"
    rm -rf $file
    echo "Deleted file: $file"
done < 09_delete.sh