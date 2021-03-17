#FROM rocker/ml-gpu:latest
FROM rocker/ml:4.0.4

#RUN apt-get install --reinstall -y ca-certificates
RUN apt-get update 
#RUN apt-get install -y libbz2-dev  
#RUN apt-get install -y liblzma-dev cmake 
RUN apt-get install -y libxt-dev vim 

RUN locale-gen ko_KR.UTF-8
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

## for mpi
RUN apt-get install -y openmpi-common openmpi-bin libopenmpi-dev 

## tidyverse requirements
RUN apt-get install -y libxml2-dev libcurl4-openssl-dev libssl-dev


## for pdf, tex engine, texlive-xetex is required for hangule pdf
##RUN apt-get install -y texlive-latex-extra
RUN apt-get install -y texlive-xetex
RUN apt-get install -y language-pack-ko fonts-nanum
RUN wget https://github.com/jgm/pandoc/releases/download/2.12/pandoc-2.12-1-amd64.deb
RUN dpkg -i pandoc-2.12-1-amd64.deb


RUN install2.r --error -r 'http://cran.rstudio.com' tidyverse  
RUN install2.r --error -r 'http://cran.rstudio.com' BiocManager 
RUN install2.r --error -r 'http://cran.rstudio.com' pbmcapply 
RUN install2.r --error -r 'http://cran.rstudio.com' caret futile.logger snow matrixStats 
RUN install2.r --error -r 'http://cran.rstudio.com' hwriter reutils ape deSolve latticeExtra

## The foreach ecosystem
RUN install2.r --error -r 'http://cran.rstudio.com' foreach iterators
RUN install2.r --error -r 'http://cran.rstudio.com' doParallel doMC doRNG
RUN install2.r --error -r 'http://cran.rstudio.com' future future.apply
RUN install2.r --error -r 'http://cran.rstudio.com' doFuture future.callr 
RUN install2.r --error -r 'http://cran.rstudio.com' minpack.lm 
RUN install2.r --error -r 'http://cran.rstudio.com' ranger
RUN install2.r --error -r 'http://cran.rstudio.com' RCircos


RUN R -e "BiocManager::install(c('BiocParallel', 'DelayedArray', 'Rsamtools', 'Rhtslib'), ask=FALSE)"
RUN R -e "BiocManager::install(c('Biostrings', 'ShortRead', 'GenomicRanges'), ask=FALSE)" 
RUN R -e "BiocManager::install(c('GO.db', 'Rsamtools', 'genbankr'), ask=FALSE)" 
RUN R -e 'BiocManager::install(c("ggbio", "plyranges"), ask=F)'
RUN R -e 'BiocManager::install("DNABarcodes", ask=F)'


#RUN install.r batchtools future.batchtools ## heavy set of dependencies
#RUN install.r clustermq                    ## heavy set of dependencies

#RUN echo "rsession-memory-limit-mb=32000" >> /etc/rstudio/rserver.conf
#RUN R -e "library(keras); install_keras()"
#ENV PATH /opt/conda/bin:$PATH


WORKDIR /usr/bin
RUN wget ftp://ftp.ncbi.nlm.nih.gov/genomes/TOOLS/ORFfinder/linux-i64/ORFfinder.gz  \
    && gzip -d ORFfinder.gz \
    && chmod 755 ORFfinder

RUN apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/local/src/*
# 
# 



