#!/bin/bash
sudo docker run -d --rm -v /home/haseong/alpha/dev:/home/rstudio/dev --name rstudio -e PASSWORD=haseong -p 8787:8787 haseong/rocker-ml:v4.5

