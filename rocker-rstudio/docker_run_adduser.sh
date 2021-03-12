#!/bin/bash
export UID=$(id -u)
export GID=$(id -g)
sudo docker run -d --rm \
	-e USER=$USER \
	-e USERID=$UID \
	-e PASSWORD=haseong \
	-v /home/${USER}:/home/$USER \
	-v /alpha/dev:/alpha/dev \
	--name rstudio-server \
	-p 8787:8787 \
	haseong/rocker-rstudio:v0.1 

