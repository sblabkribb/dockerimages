FROM rocker/rstudio:4.0.4

RUN apt-get update 
RUN apt-get install -y liblzma-dev libbz2-dev 
RUN apt-get install -y cmake build-essential gcc 
RUN apt-get install -y bzip2 ca-certificates curl 
RUN apt-get install -y libcairo2-dev libxt-dev vim

RUN locale-gen ko_KR.UTF-8
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

## for mpi
RUN apt-get install -y openmpi-common openmpi-bin libopenmpi-dev libjpeg-dev

## tidyverse requirements
RUN apt-get install -y libxml2-dev 

## for pdf, tex engine, texlive-xetex is required for hangule pdf
#RUN apt-get install -y texlive-latex-extra
RUN apt-get install -y texlive-xetex
RUN apt-get install -y language-pack-ko fonts-nanum
RUN apt-get install -y pandoc

## shiny
#RUN apt-get install -y r-base
#RUN apt-get install -y gdebi-core
#RUN wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.16.958-amd64.deb
#RUN gdebi shiny-server-1.5.16.958-amd64.deb

RUN install2.r --error -r 'http://cran.rstudio.com' pbmcapply 
RUN install2.r --error -r 'http://cran.rstudio.com' reticulate  
RUN install2.r --error -r 'http://cran.rstudio.com' tidyverse  
RUN install2.r --error -r 'http://cran.rstudio.com' BiocManager 
RUN install2.r --error -r 'http://cran.rstudio.com' pbmcapply 
RUN install2.r --error -r 'http://cran.rstudio.com' tinytex
RUN install2.r --error -r 'http://cran.rstudio.com' deSolve reutils minpack.lm

RUN install2.r --error -r 'http://cran.rstudio.com' XML
RUN install2.r --error -r 'http://cran.rstudio.com' DT shiny
RUN apt-get install -y libmysqlclient-dev
RUN install2.r --error -r 'http://cran.rstudio.com' RMySQL
RUN install2.r --error -r 'http://cran.rstudio.com' gt kableExtra
RUN apt-get install -y texlive-extra-utils ghostscript
RUN apt-get install -y texlive-full


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



