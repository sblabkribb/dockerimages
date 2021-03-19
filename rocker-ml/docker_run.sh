#!/bin/bash
sudo docker run -d --rm -v /home/haseong/share:/home/rstudio/share -v /home/haseong/alpha:/home/rstudio/alpha --name rstudio -e USER=haseong -p 8787:8787 haseong/rocker-ml:v4.5

