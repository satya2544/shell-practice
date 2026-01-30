#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[34m"

LOGS_FOLDER = "/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER

echo "Script started executed at: $(date)" | tee -a $LOG_FILE
if [ $USERID -ne 0 ]; then
     echo "ERROR:: Please run this script with root privelege"
     exit 1 # failure is other than 0
fi


VALIDATE(){
   if [ $1 -ne 0 ]; then
     echo -e "ERROR:: Installing $2 ... $R is failure $N" | tee -a $LOG_FILE
     exit 1
   else
     echo -e "Installing $2 ... $G is SUCCESS $N" | tee -a $LOG_FILE
   fi
}

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]; then
     dnf install mysql -y &>>$LOG_FILE
     VALIDATE $? "MySQL"
else
    echo "MySQL already exist ... $G SKIPPING $N" | tee -a $LOG_FILE
fi


dnf list installed nginx &>>$LOG_FILE


if [ $? -ne 0 ]; then
   dnf install nginx -y &>>$LOG_FILE
   VALIDATE $? "Nginx"
else
    echo "Nginx already exist ... $G SKIPPING $N" | tee -a $LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE

if [ $? -ne 0 ]; then
   dnf install python3 -y &>>$LOG_FILE
   VALIDATE $? "python3"
else
    echo "python already exist ... $G SKIPPING $N" | tee -a $LOG_FILE
fi




















