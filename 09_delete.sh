#!/bin/bash

SOURCE_DIR="/home/ec2-user"

FILES_TO_DELETE=&(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "File/Files to delete: $FILES_TO_DELETE 