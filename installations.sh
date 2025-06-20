$!/bin/bash

USERID = $(id -u)

if [ $USERID -ne 0 ]
then
    echo "u must have sudo user access to execute this script"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    if [ $? -ne 0]
        echo "MySql installation failure"
    else
        echo "MySql installation Success"
else
    echo "My Sql is already installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then 
    dnf install git -y
    if [ $? -ne 0]
        echo "Git installation failure"
    else
        echo "Git installation Success"
else 
    echo "Git is already Installed"
fi

