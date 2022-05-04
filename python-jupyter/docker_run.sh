#!/usr/bin/env bash
sudo docker run -d --rm -it -p 7777:8888  --name jupyter -v /mnt/alpha/home/haseong/:/home/python haseong/python-jupyter:v0.1 jupyter lab --no-browser --allow-root --ip=0.0.0.0 --notebook-dir=/home/python --NotebookApp.token=
