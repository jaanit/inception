#!/bin/bash

echo "Hello from the container last test!"

# if [ -x /usr/sbin/mysqld ]; 
# then
#     echo "MySQL is installed"
# else
#     echo "MySQL is not installed"
#     exit 1
# fi
# sleep 10
sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
service mariadb start
# if pgrep mariadb > /dev/null
# then
#     echo "MySQL is running"
# else
#     echo "MySQL is not running"
#     echo "MySQL error log not available"
#     exit 1
# fi

mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE"
mysql -uroot -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO $SQL_USER@'%' IDENTIFIED BY '$SQL_PASSWORD'"
# mysql -uroot -e "FLUSH PRIVILEGES;"
# mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'pass'"
# mysqladmin shutdown -uroot -ppass
service mariadb stop
mysqld_safe
