#!/usr/bin/env bash
docker pull mysql:8.0
docker run --rm -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=hello --name mysql \
	   -v /mnt/alpha/mysql/:/var/lib/mysql \
	   -v /mnt/alpha/dockerimages/mysql/:/docker-entrypoint-initdb.d \
	   mysql:8.0
