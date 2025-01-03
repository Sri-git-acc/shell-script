#!/bin/bash

#USER=$USER
USER=$(id -u)

#if [ $USER -ne root ]
if [ $USER -ne 0 ]
then   
    echo "ERROR: Please change the user mode to root"
    exit 1
fi

dnf install git -y

if [ $? -ne 0 ]
then   
    echo "git installation failed"
    exit 1
else   
    echo "git installation is success"
fi

dnf install ansible -y

if [ $? -ne 0 ]
then   
    echo "ansible installation failed"
    exit 1
else   
    echo "ansible installation is success"
fi