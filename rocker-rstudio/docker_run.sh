#!/bin/bash
getent passwd {1000..6000} | cut -d: -f1 > users.txt

sudo docker run -d --rm \
	-e PASSWORD=blablabla \
	-v /home/haseong/:/home/rstudio/ \
	-v /mnt/153_share/:/home/rstudio/153_share \
	-v /mnt/153_SeqDB/:/home/rstudio/153_SeqDB \
	-p 8787:8787 \
	--name rstudio-server \
	haseong/rocker-rstudio:v1.4


