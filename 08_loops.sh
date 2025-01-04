#!/bin/bash

USER=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

#if [ $USER -ne root ]
if [ $USER -ne 0 ]
then   
    echo -e "$R ERROR: Please change the user mode to root $N"
    exit 1
fi

VALIDATE(){

    dnf list installed $1 &>>$LOG_FILE_NAME
    if [ $? -eq 0 ]
    then 
        echo -e "$1 already installed and $Y up-to-date $N"
    else
        dnf install $1 -y &>>$LOG_FILE_NAME

        if [ $1 -ne 0 ]
        then   
            echo -e "$1 installation $R failed $N"
            exit 1
        else   
            echo -e "$1 installation is $G success $N" 
        fi
    fi
}

for package in $@
do
    VALIDATE package
done


# VALIDATE "python" 
# VALIDATE "ansible"


#///////////////////////////////////////////////////////*Phase-1*//////////////////////////////////////////////////

#!/bin/bash

# for i in {0..6}
# do
#     echo $i
# done