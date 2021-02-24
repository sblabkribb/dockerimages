#!/usr/bin/env bash
sudo docker run -d --rm -it -p 8888:8888  --name python-base -v /home/haseong/alpha:/home/python haseong/python-base:v0.1 jupyter lab --no-browser --allow-root --ip=0.0.0.0 --notebook-dir=/home/python --NotebookApp.token=
