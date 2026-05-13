#!/bin/bash

apt install nginx

systemctl enable nginx
systemctl start nginx

cp expense.conf /etc/nginx/default.d/expense.conf

# remove default contents
rm -rf /usr/share/nginx/html/*

# download front end content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip

# extract the content
cd /usr/share/nginx/html/
unzip /tmp/frontend.zip


# localhost means actual ip of backend component server

systemctl restart nginx