#!/bin/bash

USERID=$(id -u)
DATE=$(date +"%F-%H-%M-%S")
LOG_FILE="$DATE.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"   

if [ $USERID -ne 0 ]
    then
        echo "Please run the script with root priviliges"
        exit 1
fi

VALIDATE(){
    if [ $1 -eq 0 ]
        then    
            echo -e "$2 .....$G SUCCESS $N"
        else
            echo -e "$2 ......$R FAILED $N"
            exit 1
    fi
}

for PACKAGES in $@ 
    do
        yum -q list installed $PACKAGES &>/dev/null
        if [ $? -ne 0 ]
            then 
                echo " $PACKAGES .....Not installed "
                yum install $PACKAGES -y &>>$LOG_FILE
                VALIDATE $? " $PACKAGES installation "
            else
                echo -e " $PACKAGES ....$Y Installed Already $N "
        fi
    done


