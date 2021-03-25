#!/bin/bash
sudo docker run -d --rm \
	-p 8787:8787 \
	-v /home/haseong/:/home/rstudio/ \
	--name rstudio-server \
	haseong/rocker-rstudio:v0.6


