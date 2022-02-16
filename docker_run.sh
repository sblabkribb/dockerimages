#! /bin/bash

sudo docker run --rm -d	-e PASSWORD=sblab -v /mnt/alpha/home:/home/ \
	-v /etc/passwd:/etc/passwd \
	-v /etc/shadow:/etc/shadow \
	-p 1000:8787 \
	--name test_server \
	haseong/rocker-rstudio:v1.8 
