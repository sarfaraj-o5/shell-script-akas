#!/bin/bash

source common.sh

app_dir=/usr/share/nginx/html/
component=frontend

Print_Task_Heading "Set Nginx"
apt install nginx
Check_Status $?

systemctl enable nginx
systemctl start nginx
Check_Status $?

Print_Task_Heading "Copy"
cp expense.conf /etc/nginx/default.d/expense.conf
Check_Status $?

App_Prereq

# localhost means actual ip of backend component server

Print_Task_Heading "Restart nginx"
systemctl enable nginx
systemctl restart nginx
Check_Status $? 