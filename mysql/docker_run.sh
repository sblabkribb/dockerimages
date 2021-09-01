#!/usr/bin/env bash
sudo docker run --rm --name=mysql -v /mnt/a/mysql:/var/lib/mysql -e MYSQL_ROOT_HOST=% -p 3306:3306 -d mysql/mysql-server

