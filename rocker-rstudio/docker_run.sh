#!/bin/bash
docker run -d --rm \
	-v /mnt/alpha:/mnt/alpha \
	-v /etc/localtime:/etc/localtime \
	-p 8787:8787 \
	--name rstudio \
	haseong/rocker-rstudio:v3.0

docker network connect sblab rstudio 

sudo bash /mnt/alpha/dockerimages/bin/docker_user_sync.sh rstudio
