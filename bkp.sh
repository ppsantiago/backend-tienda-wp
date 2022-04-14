#!/bin/bash 
echo $1"/src/theme"
echo $1"/src/plugin"
echo $1"/src/upload"
echo " DB_NAME: "$2
echo " WP_NAME: "$3
read
docker run -d --name wp-db-name1 --mount source=mysql,target='\var\lib\mysql' -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=wordpress -e MYSQL_USER=manager -e MYSQL_PASSWORD=secret mariadb:10.3.9
read
docker run -d --name wordpress1 --link wp-db-name:mysql --mount type=bind,source=$1/src/themes,target="\var\www\html\wp-content/themes" --mount type=bind,source=$1/src/plugins,target="\var\www\html\wp-content\plugins" --mount type=bind,source=$1/src/upload,target="\var\www\html\wp-content\upload" -e WORDPRESS_DB_USER=manager -e WORDPRESS_DB_PASSWORD=secret -p 8091:80 wordpress:4.9.8






#!/bin/bash 
echo $1"/src/theme"
echo $1"/src/plugin"
echo $1"/src/upload"
echo " DB_NAME: "$2
echo " WP_NAME: "$3
echo " Puerto: "$4

echo "docker run -d --name 'db'$4 --mount source=mysql,target='\var\lib\mysql' -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=wordpress -e MYSQL_USER=manager -e MYSQL_PASSWORD=secret mariadb:10.3.9"

echo "docker run -d --name $3 --link 'db'$4 --mount type=bind,source=$1/src/themes,target='\var\www\html\wp-content/themes' --mount type=bind,source=$1/src/plugins,target='\var\www\html\wp-content\plugins' --mount type=bind,source=$1/src/upload,target='\var\www\html\wp-content\upload' -e WORDPRESS_DB_USER=manager -e WORDPRESS_DB_PASSWORD=secret -p $4:80 wordpress:4.9.8"

echo "|instalacion OK!"
echo "|- DB_NAME: "$2 
echo "| - WP_NAME: "$3 " | Puerto: "$4
echo "************ -> By SP&SaiboT! - Ecosystem!"
read
