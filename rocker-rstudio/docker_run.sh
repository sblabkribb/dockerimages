#!/bin/bash
docker run -d --rm \
	-v /mnt/alpha:/mnt/alpha \
	-p 8787:8787 \
	--name rstudio \
	haseong/rocker-rstudio:v2.1

sudo bash ../bin/rstudio_users_sync.sh rstudio
