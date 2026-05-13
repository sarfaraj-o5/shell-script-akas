#!/bin/bash

source common.sh

Print_Task_Heading "Install"
# install mysql 8.0.x
apt install mysql-server -y
Check_Status $?

Print_Task_Heading "Install"
systemctl enable mysqld
systemctl start mysqld
Check_Status $?

Print_Task_Heading "Install"
# change default root passwd
mysql_secure_installation --set-root-pass ExpenseApp@1
Check_Status $?