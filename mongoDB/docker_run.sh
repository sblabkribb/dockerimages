#!/usr/bin/env bash
#docker pull mysql:8.0
VER=3.1
docker pull mongo:$VER
docker run --rm -d -p 27017:27017 --name mongo -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=rootpass -v /mnt/alpha/mongo:/data/db mongo:$VER
#docker run --rm -d -p 3306:3306 --name mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=true -v /mnt/alpha/mysql:/var/lib/mysql mysql:$VER --skip-grant-tables

docker network connect sblab mongo
