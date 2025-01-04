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
            echo -e "$2 $G succeded $N" 
    fi
}

EXISTANCE(){
    if [ $? -ne 0 ]
    then 
        echo "$2 already exist $Y SKIPPING $N"
    else    
        echo "creating $2"
    fi
}

dnf module disable nodejs -y &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then 
    echo "nodejs not available... $Y SKIPPING $N"
else 
    echo "disabled nodejs"
fi

dnf module enable nodejs:20 -y &>>$LOG_FILE_NAME
VALIDATE $? "enablinging nodejs:20"

dnf install nodejs -y &>>$LOG_FILE_NAME
VALIDATE $? "installing nodejs"

useradd expense &>>$LOG_FILE_NAME
EXISTANCE $? " username expense"

mkdir /app &>>$LOG_FILE_NAME
EXISTANCE $? "/app directory"

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>>$LOG_FILE_NAME
EXISTANCE $? "backend zip file"

cd /app
rm -rf /app/*

unzip /tmp/backend.zip &>>$LOG_FILE_NAME
VALIDATE $? "backend.zip file unzip"

npm install &>>$LOG_FILE_NAME
VALIDATE $? "npm installation"

cp /root/ec2-user/shell-script/Expense_project/backend.service /etc/systemd/system/backend.service &>>$LOG_FILE_NAME
VALIDATE $? "backend.servicefile transfer"

dnf install mysql -y &>>$LOG_FILE_NAME
VALIDATE $? "mysql installation"

mysql -h <database.sriyaandansh.fun> -u root -pExpenseApp@1 < /app/schema/backend.sql &>>$LOG_FILE_NAME
VALIDATE $? "setting up the transactions schema and tables"

systemctl daemon-reload &>>$LOG_FILE_NAME
VALIDATE $? "Daemon Reload"

systemctl enable backend &>>$LOG_FILE_NAME
VALIDATE $? "Enabling backend"

systemctl restart backend &>>$LOG_FILE_NAME
VALIDATE $? "Starting Backend"