#!/usr/bin/env bash
docker pull mysql:8.0
docker run --rm -d -p 3306:3306 --name mysql -v /mnt/alpha/mysql:/var/lib/mysql mysql:8.0
