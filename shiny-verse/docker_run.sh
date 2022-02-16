#!/bin/bash
docker run -d --rm \
	-v /mnt/alpha/sblab_shiny:/srv/shiny-server/ \
	-v /mnt/alpha/sblab_shiny_log:/var/log/shiny-server/ \
	-p 8001:3838 \
	--name shiny \
	haseong/shiny-verse:v1.8

#/mnt/alpha/dockerimages/rstudio_users_sync.sh
