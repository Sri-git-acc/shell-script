#!/bin/bash

echo "Please enter your file name with path:"
read -r FILE_PATH

echo "Filename = $FILE_PATH"
COUNT=$(wc -w < $FILE_PATH)
echo -e "Total word count of $FILE_PATH is: $COUNT"

# while read -r line;
# do
#     for word in $line;
#     do
#         echo "$word"
#     done    
# done < $FILENAME

# ////////////////////////////////////////////////////////PENDING//////////////////////////////////////////////////////
