#!/bin/bash

USER=$USER

if [ $USER -ne root]
then   
    echo "ERROR: Please change the user mode to root"
fi

dnf install git -y