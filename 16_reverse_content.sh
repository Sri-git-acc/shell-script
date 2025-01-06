#!/bin/bash

echo "Please enter the file path:"
read -r FILE_PATH
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
FILE=$(echo $FILE_PATH | cut -d "/" -f4)

REVER=$(cat $FILE_PATH | rev)
mkdir -p /home/ec2-user/reverse
touch /home/ec2-user/reverse/$FILE
cat $REVER /home/ec2-user/reverse/$FILE



# ////////////////////////////////////////////////////////PENDING//////////////////////////////////////////////////