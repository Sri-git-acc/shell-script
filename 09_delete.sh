#!/bin/bash

SOURCE_DIR="/home/ec2-user"

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "Files to delete:$FILES_TO_DELETE" 

# while read -r file
# do
#     echo "Deleting file: $file"
#     rm -rf $file
#     echo "Deleted file: $file"
# done <<< $FILES_TO_DELETE