#!/bin/bash

SOURCE_DIR="/home/ec2-user"

FILES_TO_DELETE=&(find $SOURCE_DIR -name "*.logi" -mtime +14)
echo "Files to delete: $FILES_TO_DELETE"