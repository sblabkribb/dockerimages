#!/usr/bin/env bash
sudo docker run -d --rm -it -p 8888:8888  --name python-base -v /mnt/alpha/home/haseong/:/home/python haseong/python-base:v0.2
