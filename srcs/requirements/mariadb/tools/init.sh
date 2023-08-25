#!/bin/bash

echo "Hello from the mariadb container!"
sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
service mariadb start
mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE"
mysql -uroot -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO $SQL_USER@'%' IDENTIFIED BY '$SQL_PASSWORD'"
service mariadb stop
mysqld_safe
