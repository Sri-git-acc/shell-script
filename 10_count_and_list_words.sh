#!/bin/bash

echo "Please enter your file name with path:"
read -r FILE_PATH

# echo "Filename = $FILE_PATH"
# COUNT=$(wc -w < $FILE_PATH)
COUNT=$(wc -w < $FILE_PATH)
echo -e "Total word count of $FILE_PATH is: $COUNT"
# echo $(sort $FILE_PATH | uniq -w)

while read -r line;
do
    # RES=$(sort | uniq -c)
    # echo $RES
    # echo $line
    # sort $line | uniq -c
    for word in $line;
    do
        # echo "$word"
        echo $(sort | uniq -c < $word)
    done    
done < $FILE_PATH

# ////////////////////////////////////////////////////////PENDING//////////////////////////////////////////////////////
