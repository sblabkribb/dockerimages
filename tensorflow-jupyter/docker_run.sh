#!/usr/bin/env bash

#docker run -d --rm -p 7777:8888 -u 1000:1000 -e USER="haseong"  -e JUPYTER_ENABLE_LAB=yes --name tf-jupyter -v /mnt/alpha/home/haseong/:/tf haseong/tensorflow-jupyter:v0.1  
docker run -d --rm -p 7777:8888 -p 5000:5000 --name tf-jupyter \
  -v /mnt/alpha:/mnt/alpha \
  haseong/tensorflow-jupyter:v0.1  

sudo bash /mnt/alpha/dockerimages/bin/docker_user_sync.sh tf-jupyter
