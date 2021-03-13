docker run  --rm -v c:\mydocs\2020\dev:/home/rstudio/dev --name rstudio -e USER=rstudio -e ROOT=TRUE  -e PASSWORD=haseong -p 8787:8787 haseong/rocker-ml:v6

