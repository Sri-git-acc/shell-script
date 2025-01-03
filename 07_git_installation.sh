#!/bin/bash

#USER=$USER
USER=$(id -u)

#if [ $USER -ne root ]
if [ $USER -ne 0 ]
then   
    echo "ERROR: Please change the user mode to root"
fi

dnf install git -y