#!/bin/bash

## BACKEND
nodejs 20+

dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y

# add app user
useradd expense
cp backend.service /etc/systemd/system/backend.service
mkdir /app

# download front end content
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip

# extract the content
cd /app
unzip /tmp/backend.zip

# download dependencies
cd /app
npm install

# load the service
systemctl daemon-reload

# start the service
systemctl enable backend
systemctl start backend

# we need to load the schema, mysql-client
dnf install mysql -y

# load schema
mysql -h <MYSQL_SERVR-IPADD> -uroot -pExpenseApp@1 < /app/schema/backend.sql

systemctl restart backend