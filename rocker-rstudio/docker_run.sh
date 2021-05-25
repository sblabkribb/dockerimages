#!/bin/bash
sudo docker run -d --rm \
	-e PASSWORD=haseong \
	-v /home/haseong/:/home/rstudio/ \
	-p 8787:8787 \
	--name rstudio-server \
	haseong/rocker-rstudio:v1.0


