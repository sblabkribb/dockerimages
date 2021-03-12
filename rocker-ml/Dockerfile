#FROM rocker/ml-gpu:latest
FROM rocker/ml:3.6.0

RUN apt-get update \
&& apt-get install -y liblzma-dev libbz2-dev wget git cmake build-essential \
                      gcc bzip2 ca-certificates curl libpython2.7 python-pip python-virtualenv \
                      libcairo2-dev libxt-dev vim

## for mpi
RUN apt-get install -y libcr-dev openmpi-common openmpi-bin libopenmpi-dev libcurl4-openssl-dev libjpeg-dev

RUN install2.r --error -r 'http://cran.rstudio.com' tidyverse BiocManager pbmcapply 
RUN install2.r --error -r 'http://cran.rstudio.com' caret futile.logger snow matrixStats 
RUN install2.r --error -r 'http://cran.rstudio.com' hwriter reutils ape deSolve latticeExtra

WORKDIR /usr/bin
RUN wget ftp://ftp.ncbi.nlm.nih.gov/genomes/TOOLS/ORFfinder/linux-i64/ORFfinder.gz  \
    && gzip -d ORFfinder.gz \
    && chmod 755 ORFfinder

RUN R -e "if (!requireNamespace('BiocManager', quietly = TRUE)){ install.packages('BiocManager')}; chooseBioCmirror(ind=2); BiocManager::install(c('BiocParallel', 'DelayedArray', 'Rsamtools', 'Rhtslib'), ask=FALSE)"
RUN R -e "if (!requireNamespace('BiocManager', quietly = TRUE)){ install.packages('BiocManager')}; chooseBioCmirror(ind=2); BiocManager::install(c('Biostrings', 'ShortRead', 'GenomicRanges'), ask=FALSE)" 
RUN R -e "if (!requireNamespace('BiocManager', quietly = TRUE)){ install.packages('BiocManager')}; chooseBioCmirror(ind=2); BiocManager::install(c('GO.db', 'Rsamtools', 'genbankr'), ask=FALSE)" 

## The foreach ecosystem
RUN install2.r --error -r 'http://cran.rstudio.com' foreach iterators
RUN install2.r --error -r 'http://cran.rstudio.com' doParallel doMC doRNG
RUN install2.r --error -r 'http://cran.rstudio.com' future future.apply
RUN install2.r --error -r 'http://cran.rstudio.com' doFuture future.callr 
RUN install2.r --error -r 'http://cran.rstudio.com' minpack.lm 
RUN install2.r --error -r 'http://cran.rstudio.com' ranger


RUN R -e 'BiocManager::install(c("ggbio", "plyranges"), ask=F)'
RUN R -e 'BiocManager::install("DNABarcodes", ask=F)'

RUN local-gen ko_KR.UTF-8
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8


#RUN install.r batchtools future.batchtools ## heavy set of dependencies
#RUN install.r clustermq                    ## heavy set of dependencies

#RUN echo "rsession-memory-limit-mb=32000" >> /etc/rstudio/rserver.conf
#RUN R -e "library(keras); install_keras()"
#ENV PATH /opt/conda/bin:$PATH


RUN install2.r --error -r 'http://cran.rstudio.com' RCircos

RUN apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/local/src/*
# 
# 



