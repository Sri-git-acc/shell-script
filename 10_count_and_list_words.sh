#!/bin/bash

echo "Please enter your file name with path:"
read -r FILE_PATH

# echo "Filename = $FILE_PATH"
# COUNT=$(wc -w < $FILE_PATH)
COUNT=$(wc -w < $FILE_PATH)
echo -e "Total word count of $FILE_PATH is: $COUNT"
RES=$(tr -s '[:space:]' '\n' < $FILE_PATH | sort | uniq -cd | sort -r -n)
echo $RES

# echo $(sort $FILE_PATH | uniq -w)

# while read -r line;
# do
#     # RES=$(sort | uniq -c)
#     # echo $RES
#     # echo $line
#     # sort $line | uniq -c
#     for word in $line;
#     do
#         # echo "$word" 
#     done
    
# done < $FILE_PATH

# ////////////////////////////////////////////////////////PENDING//////////////////////////////////////////////////////
