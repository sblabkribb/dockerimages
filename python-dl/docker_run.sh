#!/usr/bin/env bash
sudo docker run -d --rm -it -p 8888:8888  --name jl -v /home/haseong/alpha/dev:/home/python/dev haseong/python-dl:v3 jupyter lab --no-browser --allow-root --ip=0.0.0.0 --notebook-dir=/home/python/dev --NotebookApp.token=
