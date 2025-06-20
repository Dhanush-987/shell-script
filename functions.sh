#!/bin/bash

user=$(id -u)

validate() {
    if [ $1 -ne 0 ]
    then
        echo "$2 failure"
        exit 1
    else
        echo "$2 Success"
    fi
}

if [ $user -ne 0 ]
then
    echo "you must have sudo access"
    exit 1
fi

dnf list installed mysql-community-server

if [ $? -ne 0 ]
then
    dnf install mysql-community-server -y
    validate $? "Installing MySql"
else
    echo "My Sql already installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    validate $? "Installing Git"
else
    echo "Git is already installed"
fi
