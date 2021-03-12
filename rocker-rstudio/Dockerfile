FROM rocker/rstudio:4.0.4

RUN apt-get update \
&& apt-get install -y liblzma-dev libbz2-dev wget git cmake build-essential \
                      gcc bzip2 ca-certificates curl \
                      libcairo2-dev libxt-dev vim

RUN locale-gen ko_KR.UTF-8
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

## for mpi
RUN apt-get install -y openmpi-common openmpi-bin libopenmpi-dev libcurl4-openssl-dev libjpeg-dev
#RUN apt-get install -y libcr-dev

RUN install2.r --error -r 'http://cran.rstudio.com' pbmcapply 
RUN install2.r --error -r 'http://cran.rstudio.com' tidyverse BiocManager 
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



