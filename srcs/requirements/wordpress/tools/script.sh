#!/bin/bash
# This is a sample script to demonstrate execution within the Docker container
echo "Hello from  the wordpress container!"
echo "Starting Wordpress.."
mkdir -p /var/www/html/
cd /var/www/html

wp core download --path=/var/www/html --allow-root
sed -i -e 's/listen =.*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf
wp config create --path=/var/www/html --dbname="$SQL_DATABASE" --dbuser="$SQL_USER" --dbpass="$SQL_PASSWORD" --dbhost='mariadb_container' --allow-root --skip-check
wp core install --path=/var/www/html --url='localhost' --title='wordpress' --admin_user='root' --admin_password='root' --admin_email='reda.jaanit@gmail.com' --allow-root
wp core version --path=/var/www/html --allow-root

echo "Wordpress is ready to use OK !"

service php7.4-fpm start
service php7.4-fpm stop

php-fpm7.4 -F