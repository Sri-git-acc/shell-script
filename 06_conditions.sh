#!/bin/bash

echo "Enter your number:"
read NUM

if [ $NUM -gt 100]
then
    echo "Given number is greater tha 100"
else
    echo "Given number is less than 100"
