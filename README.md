 apt install nginx
   14  ls
   15  systemctl enable nginx
   16  systemctl status nginx
   17  systemctl start nginx
   18  curl localhost
   19  ip a
   # remove default contents
rm -rf /usr/share/nginx/html/*
# download front end content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip

# extract the content
cd /usr/share/nginx/html/
unzip /tmp/frontend.zip

# create nginx reverse proxy conf

vim /etc/nginx/default.d/expense.conf

# add following content
/etc/nginx/default.d/expense.conf

proxy_http_version 1.1;

location /api/ { proxy_pass http://localhost:8080; }

location /health {
    stub_status on;
    access_log off;
}

# localhost means actual ip of backend component server

systemctl restart nginx

# install mysql 8.0.x
apt install mysql-server -y

systemctl enable mysqld
systemctl start mysqld

# change default root passwd
mysql_secure_installation --set-root-pass ExpenseApp@1

## BACKEND
nodejs 20+

dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y

# add app user
useradd expense
mkdir /app

# download front end content
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip

# extract the content
cd /app
unzip /tmp/backend.zip

# download dependencies
cd /app
npm install

# set up systemd expense backend.service
/etc/systemd/system/backend.service

[Unit]
Description = Backend Service

[Service]
User=expense
Environment=DB_HOS="<MYSQL_SERVR-IPADD>"
ExecStart=/bin/node /app/index.js
SysLogIdentifier=backend

[Install]
wantedBy=multi-user.target

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

 echo $SHELL

## Operators [Numbers, strings] Number == 1, || string = akas, akas shinde

Numbers: -eq, -gt, -lt, -ne 
Strings: == , = , -z=null or char [ -z $a ], !=

# more dynamic ( becoz we want to give my script some power take input from user)
1. cmd args --> bash cond.sh 20 [Postional args or values]
2. read --> read $a

last cmd success or not = echo $? =0 = success