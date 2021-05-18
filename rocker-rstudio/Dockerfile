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
RUN apt-get install -y texlive-xetex language-pack-ko fonts-nanum pandoc
RUN apt-get install -y texlive-full texlive-extra-utils ghostscript
RUN apt-get install -y libmysqlclient-dev


## shiny
#RUN apt-get install -y r-base
#RUN apt-get install -y gdebi-core
#RUN wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.16.958-amd64.deb
#RUN gdebi shiny-server-1.5.16.958-amd64.deb

RUN install2.r --error -r 'http://cran.rstudio.com' testthat usethis devtools bookdown
RUN install2.r --error -r 'http://cran.rstudio.com' pbmcapply reticulate tidyverse BiocManager tinytex
RUN install2.r --error -r 'http://cran.rstudio.com' deSolve reutils minpack.lm
RUN install2.r --error -r 'http://cran.rstudio.com' XML DT shiny
RUN install2.r --error -r 'http://cran.rstudio.com' RMySQL gt kableExtra
RUN install2.r --error -r 'http://cran.rstudio.com' caret viridis e1071 randomForest

RUN apt-get install -y libtiff5-dev libtiff-tools
RUN install2.r --error -r 'http://cran.rstudio.com' doParallel tiff jpeg wesanderson
RUN install2.r --error -r 'http://cran.rstudio.com' hwriter ape latticeExtra

RUN R -e 'BiocManager::install(c("BiocParallel", "DelayedArray", "Rsamtools", "Rhtslib"), ask=F)'
RUN R -e 'BiocManager::install(c("Biostrings", "ShortRead", "GenomicRange"), ask=F)'
RUN R -e 'BiocManager::install(c("genbankr", "ggbio", "plyranges"), ask=F)'
RUN R -e 'BiocManager::install("DNABarcodes", ask=F)'
RUN R -e 'BiocManager::install("DECIPHER", ask=F)'


RUN apt-get install -y python3-pip
RUN pip3 install nanofilt


#RUN install2.r --error -r 'http://cran.rstudio.com' futile.logger snow matrixStats 

RUN apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/local/src/*
# 
# 



