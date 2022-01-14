#!/bin/bash
docker run -d --rm \
	-v /mnt/alpha:/mnt/alpha \
	-p 8787:8787 \
	--name rstudio \
	haseong/rocker-rstudio:v1.8


