#!/bin/bash

echo "Please enter the file name with path:"
read -r FILENAME

while read -r line
do 
    for word in $line
    do
        REVER=$(echo $word | rev)
        if[ $REVER -eq $word ]
        then  
            echo "$word"
        fi
    done
done < $FILENAME