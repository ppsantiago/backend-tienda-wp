#!/bin/bash 
echo $1"/src/theme"
echo $1"/src/plugin"
echo $1"/src/upload"
echo " DB_NAME: "$2
echo " WP_NAME: "$3
echo " Puerto: "$4

docker run -d --name db$4 \
--mount type=bind,source=$1/src$4/mysql$4,target=/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=pwd111 \
-e MYSQL_DATABASE=wordpress \
-e MYSQL_USER=wordpress \
-e MYSQL_PASSWORD=wordpress \
mariadb:latest

docker run -d --name $3 --link db$4:mysql \
--mount type=bind,source=$1/src/wp-content,target=/var/www/html/wp-content \
-e WORDPRESS_DB_HOST=mysql \
-e WORDPRESS_DB_USER=wordpress \
-e WORDPRESS_DB_PASSWORD=wordpress \
-e WORDPRESS_DB_NAME=wordpress \
-p $4:80 \
wordpress:latest


echo "|instalacion OK!"
echo "|- DB_NAME: "$2 
echo "| - WP_NAME: "$3 " | Puerto: "$4
echo "************ -> By SP&SaiboT! - Ecosystem!"
read
