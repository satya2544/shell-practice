#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[34m"


if [ $USERID -ne 0 ]; then
     echo "ERROR:: Please run this script with root privelege"
     exit 1 # failure is other than 0
fi

VALIDATE(){
   if [ $1 -ne 0 ]; then
     echo -e "ERROR:: Installing $2 ... $R is failure $N"
     exit 1
   else
     echo -e "Installing $2 ... $G is SUCCESS $N"
   fi
}

dnf list installed mysql

if [ $? -ne 0 ]; then
     dnf install mysql -y
     VALIDATE $? "MySQL"
else
    echo "MySQL already exist ... $G SKIPPING $N"
fi


dnf list installed nginx


if [ $? -ne 0 ]; then
   dnf install nginx -y
   VALIDATE $? "Nginx"
else
    echo "Nginx already exist ... $G SKIPPING $N"
fi


if [ $? -ne 0 ]; then
   dnf install python3 -y
   VALIDATE $? "python3"
else
    echo "python already exist ... $G SKIPPING $N"
fi









