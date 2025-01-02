#!/bin/bash

PER1=$1
PER2=$2
PER3=$3

echo "$PER1: Hello $PER2"
echo "$PER3: Hello $PER1, How are you?"
echo "$PER1: I'm fine, How are you?"
echo "$PER3: I'm good."
echo "$PER1: Please enter your username:$USER"
read -s USER
echo "$PER1: Your username is: $USER"
