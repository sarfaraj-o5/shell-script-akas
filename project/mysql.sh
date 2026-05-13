#!/bin/bash

# install mysql 8.0.x
apt install mysql-server -y

systemctl enable mysqld
systemctl start mysqld

# change default root passwd
mysql_secure_installation --set-root-pass ExpenseApp@1