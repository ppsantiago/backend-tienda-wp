#!/bin/bash 
echo $1"/src/theme"
echo $1"/src/plugin"
echo $1"/src/upload"
read
docker run -d --name wordpress --link wp-db-name:mysql --mount type=bind,source=$1/src/themes,target="\var\www\html\wp-content/themes" --mount type=bind,source=$1/src/plugins,target="\var\www\html\wp-content\plugins" --mount type=bind,source=$1/src/upload,target="\var\www\html\wp-content\upload" -e WORDPRESS_DB_USER=manager -e WORDPRESS_DB_PASSWORD=secret -p 8080:80 wordpress:4.9.8
read
docker run -d --name wp-db-name --mount source=mysql,target='\var\lib\mysql' -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=wordpress -e MYSQL_USER=manager -e MYSQL_PASSWORD=secret mariadb:10.3.9