#!/bin/bash
sudo docker run -d --rm \
	-v /home/haseong/alpha/dev:/home/rstudio/dev \
	--name rstudio \
	-e USER=rstudio \
	-e ROOT=TRUE \
	-e PASSWORD=haseong \
	-p 8787:8787 \
	haseong/rocker-rstudio:v0.1

