#!/bin/bash

NUM1=$1
NUM2=$2
NUM3=$(($1+$2))

echo "sum of $NUM1 and $NUM2 is: $NUM3"
TIMESTAMP=$(date)
echo "task done at: $TIMESTAMP"

