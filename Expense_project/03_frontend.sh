#!/bin/bash

USER=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
mkdir -p $LOGS_FOLDER
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
            echo -e "$2 $G succeded $N" 
    fi
}

EXISTANCE(){
    if [ $? -ne 0 ]
    then 
        echo -e "$2 already exist $Y skipping $N"
    else    
        echo "creating $2"
    fi
}

dnf install nginx -y &>>$LOG_FILE_NAME
EXISTANCE $? "nginx installation"

systemctl enable nginx &>>$LOG_FILE_NAME
VALIDATE $? "enabling nginx"

systemctl start nginx &>>$LOG_FILE_NAME
VALIDATE $? "starting nginx"

rm -rf /usr/share/nginx/html/*
VALIDATE $? "Removing existing version of code"

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip &>>$LOG_FILE_NAME
EXISTANCE $? "expense file"

cd /usr/share/nginx/html
VALIDATE $? "Moving to HTML directory"

unzip /tmp/frontend.zip 
VALIDATE $? "frontend.zip file unzip"

cp /root/shell-script/Expense_project/expense.config /etc/nginx/default.d/expense.conf &>>$LOG_FILE_NAME
VALIDATE $? "expense.config file transfer"

systemctl restart nginx
VALIDATE $? "nginx restart"