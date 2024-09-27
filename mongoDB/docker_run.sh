#!/usr/bin/env bash
#
docker run --rm -d -p 27027:27017 --name mongodb -v /mnt/alpha/mongodb:/data/db -v /mnt/alpha/share:/share -e TZ=Asia/Seoul haseong/mongodb:v6.0.3 --auth
#docker run --rm -d -p 3306:3306 --name mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=true -v /mnt/alpha/mysql:/var/lib/mysql mysql:$VER --skip-grant-tables

#docker network connect sblab mongodb
