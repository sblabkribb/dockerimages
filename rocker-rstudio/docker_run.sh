#!/bin/bash
docker run -d --rm \
	-v /mnt/alpha:/mnt/alpha \
	-v /etc/localtime:/etc/localtime \
	-p 8888:8787 \
	--name rstudio \
	haseong/rocker-rstudio:v2.2

docker network connect sblab rstudio 

sudo bash /mnt/alpha/dockerimages/bin/rstudio_users_sync.sh rstudio
