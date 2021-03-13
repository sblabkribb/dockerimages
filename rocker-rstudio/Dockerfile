FROM rocker/rstudio:4.0.4

#RUN apt-get update 
#RUN apt-get install -y liblzma-dev libbz2-dev wget git cmake build-essential gcc bzip2 ca-certificates curl libcairo2-dev libxt-dev vim

RUN locale-gen ko_KR.UTF-8
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

## shiny
RUN apt-get install -y r-base
RUN apt-get install -y gdebi-core
RUN wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.16.958-amd64.deb
RUN gdebi shiny-server-1.5.16.958-amd64.deb

## for mpi
#RUN apt-get install -y openmpi-common openmpi-bin libopenmpi-dev libcurl4-openssl-dev libjpeg-dev
RUN apt-get install -y openmpi-common openmpi-bin libopenmpi-dev libjpeg-dev
#RUN apt-get install -y libcr-dev
RUN apt-get install -y libxml2-dev libcurl4-openssl-dev libssl-dev

#RUN install2.r --error -r 'http://cran.rstudio.com' pbmcapply 
#RUN install2.r --error -r 'http://cran.rstudio.com' tidyverse BiocManager 
RUN install2.r --error -r 'http://cran.rstudio.com' tidyverse  
RUN install2.r --error -r 'http://cran.rstudio.com' BiocManager 
RUN install2.r --error -r 'http://cran.rstudio.com' pbmcapply 

RUN install2.r --error -r 'http://cran.rstudio.com' tinytex
RUN apt-get install -y texlive-latex-extra
RUN apt-get install -y language-pack-ko fonts-nanum
RUN wget https://github.com/jgm/pandoc/releases/download/2.12/pandoc-2.12-1-amd64.deb
RUN dpkg -i pandoc-2.12-1-amd64.deb


#RUN install2.r --error -r 'http://cran.rstudio.com' caret futile.logger snow matrixStats 
#RUN install2.r --error -r 'http://cran.rstudio.com' hwriter reutils ape deSolve latticeExtra

#RUN R -e 'BiocManager::install(c("BiocParallel", "DelayedArray", "Rsamtools", "Rhtslib"), ask=F)'
#RUN R -e 'BiocManager::install(c("Biostrings", "ShortRead", "GenomicRange"), ask=F)'
#RUN R -e 'BiocManager::install(c("genbankr", "ggbio", "plyranges"), ask=F)'
#RUN R -e 'BiocManager::install("DNABarcodes", ask=F)'




RUN apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/local/src/*
# 
# 


