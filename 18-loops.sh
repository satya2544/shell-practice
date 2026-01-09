#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executed at : $(date)"

if [ $USERID -ne 0 ]; then
     echo "ERROR:: Please run this script with root privelege"
     exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
         echo -e " Installing $2 .... $R is failure $N"
         exit 1
    else
        echo -e "Installing $2 ... $G is SUCCESS $N"
    fi
}

# $@

for package in $@

do
    echo "Package is: $Package"
done