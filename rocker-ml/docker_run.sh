#!/bin/bash
sudo docker run -d --rm -v /home/haseong/alpha:/home/rstudio/alpha --name rstudio -e PASSWORD=haseong -p 8787:8787 haseong/rocker-ml:v4.4

