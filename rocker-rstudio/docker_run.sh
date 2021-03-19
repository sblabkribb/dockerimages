#!/bin/bash
sudo docker run -d --rm \
	-p 8787:8787 \
	-v /home/haseong/alpha/:/alpha/ \
	-v /home/haseong/alpha/dev/:/home/rstudio/alpha/dev/ \
	--name rstudio-server \
	haseong/rocker-rstudio:v0.4
	#haseong/rstudio-server-run:v02


