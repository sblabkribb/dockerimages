#!/usr/bin/env bash
docker run -d --rm -it -p 7777:7777  --name jupyter -v /mnt/alpha/home/haseong/:/home/python haseong/python-jupyter:v0.2
