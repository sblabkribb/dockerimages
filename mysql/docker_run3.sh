#!/bin/bash 

docker run --rm -d  -p 3306:3306  --name mysql -v /mnt/a/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD="rootpass" -e MYSQL_USER="haseong" -e MYSQL_PASSWORD="haseongpass" -e MYSQL_ROOT_HOST="%" mysql:latest 
