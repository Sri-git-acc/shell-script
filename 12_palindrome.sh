#!/bin/bash

echo "Please enter the file name with path:"
read -r FILENAME

while read -r line
do 
    for word in $line
    do
        REVER=$(echo $word | rev)
        # echo "$word ---> $REVER"
        if [ $REVER = $word ]
        then  
            echo $REVER
        fi
    done
done < $FILENAME