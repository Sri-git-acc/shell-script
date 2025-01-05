#!/bin/bash

Please enter the file name with path:
read -r FILENAME

while read -r line
do 
    for word in $line
    do
        REVER=$(echo $word | rev)
        if[ $REVER -eq $word ]
        do  
            echo "$word"
        done
    done
done < $FILENAME