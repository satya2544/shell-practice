#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
     echo "ERROR:: Please run this script with root priveledge"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
     echo "ERROR:: Installing MySQL is failure"
else
    echo "Installing MySql is SUCCESS"
fi