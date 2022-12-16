#!/usr/bin/env bash
#docker pull mysql:8.0
VER=8.0
docker pull mysql:$VER
docker run --rm -d -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=rootpass -v /mnt/alpha/mysql:/var/lib/mysql mysql:$VER
#docker run --rm -d -p 3306:3306 --name mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=true -v /mnt/alpha/mysql:/var/lib/mysql mysql:$VER --skip-grant-tables

docker network connect sblab mysql
