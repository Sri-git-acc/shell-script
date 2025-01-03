#!/bin/bash

#USER=$USER
USER=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

#if [ $USER -ne root ]
if [ $USER -ne 0 ]
then   
    echo -e "$R ERROR: Please change the user mode to root"
    exit 1
fi

VALIDATE(){

    dnf list installed $1
    if [ $? -eq 0 ]
    then 
        echo -e "$1 already installed and $Y up-to-date"
    else
        dnf install $1 -y

        if [ $1 -ne 0 ]
        then   
            echo -e "$1 installation $R failed"
            exit 1
        else   
            echo -e "$1 installation is $G success"
        fi
    fi
}

VALIDATE "python" 
VALIDATE "ansible"

# dnf list installed git
# if [ $? -eq 0 ]
# then
#     echo "git already installed and up-to-date"
# else
#     dnf install git -y

#     if [ $? -ne 0 ]
#     then   
#         echo "git installation failed"
#         exit 1
#     else   
#         echo "git installation is success"
#     fi
# fi


# dnf list installed ansible
# if [ $? -eq 0 ]
# then
#     echo "ansible already installed and up-to-date"
# else
#     dnf install ansible -y
#     if [ $? -ne 0 ]
#     then   
#         echo "ansible installation failed"
#         exit 1
#     else   
#         echo "ansible installation is success"
#     fi
# fi

