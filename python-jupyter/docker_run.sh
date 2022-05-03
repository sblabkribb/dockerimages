#!/usr/bin/env bash
sudo docker run -d --rm -it -p 7777:8888  --name python-base -v /mnt/alpha/home/haseong/:/home/python haseong/python-base:v0.2 jupyter lab --no-browser --allow-root --ip=0.0.0.0 --notebook-dir=/home/python --NotebookApp.token=
