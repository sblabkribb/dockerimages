#!/bin/bash
sudo docker run -d --rm \
	-p 8787:8787 \
	-v /home/haseong/:/home/rstudio/ \
	-v /mnt/153_share/:/home/rstudio/153_share \
	-v /mnt/153_SeqDB/:/home/rstudio/153_SeqDB \
	--name rstudio-server \
	haseong/rocker-rstudio:v0.8


