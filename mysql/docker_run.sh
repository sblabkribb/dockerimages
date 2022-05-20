#!/usr/bin/env bash
docker pull mysql:8.0
docker run --rm -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=mysqlpass  --name mysql -v /mnt/alpha/mysql_20220512:/var/lib/mysql mysql:8.0
