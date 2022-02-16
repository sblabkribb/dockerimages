#!/bin/bash
docker run -d --rm \
	--user shiny \
	-p 3838:3838 \
	--name shiny \
	rocker/shiny:3.4.4

#/mnt/alpha/dockerimages/rstudio_users_sync.sh
