#!/bin/bash

USERID=$(id -u)
DATE=$(date +"%F-%H-%M-%S")
LOG_FILE="$DATE.log"
R="\e[31m"
G="\e[32m"
N="\e[0m"
if [ $USERID -ne 0 ]
    then
        echo "Please run the script with root priviliges"
        exit 1
fi

VALIDATE(){
    if [ $1 -eq 0 ]
        then    
            echo -e     "$2 .....$G SUCCESS $N"
        else
            echo -e "$2 ......$R FAILED $N "
            exit 1
    fi
}

yum install git -y &>>$LOG_FILE

VALIDATE $? "GIT Installation"

yum install vim -y &>>$LOG_FILE

VALIDATE $? "VIM Installation"

yum install wget -y &>>$LOG_FILE

VALIDATE $? "WGET Installation"

yum install net-tools -y &>>$LOG_FILE

VALIDATE $? "NET-TOOLS Installation"