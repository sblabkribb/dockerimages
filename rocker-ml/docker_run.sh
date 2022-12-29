#!/bin/bash
docker run -d --rm \
	-v /mnt/alpha:/mnt/alpha \
	-v /etc/localtime:/etc/localtime \
	-p 8888:8787 \
	--name ml \
  -e PASSWORD=kribb1143! \
	haseong/rocker-ml:v1

docker network connect sblab ml

#sudo bash /mnt/alpha/dockerimages/bin/rstudio_users_sync.sh ml
