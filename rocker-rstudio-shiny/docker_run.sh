#!/bin/bash
sudo docker run -d --rm \
	-p 8787:8787 \
	-e PASSWORD=haseong \
	-v /home/haseong/alpha/:/alpha/ \
	--name rstudio-server \
	haseong/rocker-rstudio:v0.2
	#haseong/rstudio-server-run:v02

