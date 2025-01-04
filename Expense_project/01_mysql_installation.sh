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
    if [ $? -ne 0 ]
        then   
            echo -e "$2 $R failed $N"
            exit 1
        else   
            echo -e "$2 $G success $N" 
    fi
}

PACKAGE(){
    dnf list installed $1 &>>$LOG_FILE_NAME
    if [ $? -eq 0 ]
    then 
        echo -e "$1 already installed and $Y up-to-date $N"
    else
        dnf install $1 -y &>>$LOG_FILE_NAME
        VALIDATE $? "Installing Mysql server"
    fi
}

PACKAGE "mysql-server"

systemctl enable mysqld &>>$LOG_FILE_NAME
VALIDATE $? "Enabling Mysql server"

systemctl start mysqld &>>$LOG_FILE_NAME
VALIDATE $? "Starting Mysql server"
 
mysql -h database.sriyaandansh.fun -u root -pExpenseApp@1 -e 'show databases;' &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    echo "MySQL Root password not setup" &>>$LOG_FILE_NAME
    mysql_secure_installation --set-root-pass ExpenseApp@1
    VALIDATE $? "Setting Root Password"
else
    echo -e "MySQL Root password already setup ... $Y SKIPPING $N"
fi