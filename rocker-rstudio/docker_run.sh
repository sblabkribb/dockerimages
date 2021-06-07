#!/bin/bash
sudo docker run -d --rm \
	-e PASSWORD=haseong \
	-v /home/haseong/:/home/rstudio/ \
	-v /mnt/153_share/:/home/rstudio/153_share \
	-v /mnt/153_SeqDB/:/home/rstudio/153_SeqDB \
	-p 8787:8787 \
	--name rstudio-server \
	haseong/rocker-rstudio:v1.0


