#!/bin/bash
docker run -d --rm --name analysis -it \
	-v /home/haseong/dev/design_build_python:/design_build \
	-v /etc/localtime:/etc/localtime \
	-w /design_build \
	haseong/sequence_analysis:v0.1

#sudo bash /mnt/alpha/dockerimages/bin/rstudio_users_sync.sh ml
