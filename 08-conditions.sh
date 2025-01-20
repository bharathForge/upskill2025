#!/bin/bash

USERID=$(id -u)
if [ $USERID -eq 0 ]
then
    echo "User has root access"
else
    echo "you are not having the root priviliges"
    exit 100    
fi

echo "Installing GIT"
yum install gittt -y

if [ $? -eq 0 ]
then
    echo "GIT is installed"
else
    echo "GIT is not installed"
    exit 12
fi