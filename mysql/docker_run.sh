#!/usr/bin/env bash
#docker pull mysql:8.0
VER=8.0
docker pull mysql:$VER
docker run --rm -d -p 3306:3306 --name mysql -e MYSQL_RANDOM_ROOT_PASSWORD=yes -v /mnt/alpha/mysql:/var/lib/mysql mysql:$VER
