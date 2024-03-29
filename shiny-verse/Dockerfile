FROM rocker/shiny-verse:4.1.2
#FROM rocker/rstudio:devel

RUN apt-get update 
RUN apt-get install -y apt-utils
RUN apt-get install -y liblzma-dev libbz2-dev 
RUN apt-get install -y cmake build-essential gcc 
RUN apt-get install -y bzip2 ca-certificates curl 
RUN apt-get install -y libcairo2-dev libxt-dev vim
RUN apt-get install -y python3-venv
RUN apt-get install -y python3-pip

RUN locale-gen ko_KR.UTF-8
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

## for mpi
RUN apt-get install -y openmpi-common openmpi-bin libopenmpi-dev libjpeg-dev


## for pdf, tex engine, texlive-xetex is required for hangule pdf
RUN apt-get install -y texlive-xetex language-pack-ko fonts-nanum pandoc
RUN apt-get install -y texlive-full texlive-extra-utils ghostscript
RUN apt-get install -y libmysqlclient-dev


RUN install2.r --error -r 'http://cran.rstudio.com' testthat usethis devtools bookdown
RUN install2.r --error -r 'http://cran.rstudio.com' pbmcapply reticulate tidyverse BiocManager tinytex
RUN install2.r --error -r 'http://cran.rstudio.com' deSolve reutils minpack.lm
RUN install2.r --error -r 'http://cran.rstudio.com' XML DT shiny
RUN install2.r --error -r 'http://cran.rstudio.com' RMySQL gt kableExtra
RUN install2.r --error -r 'http://cran.rstudio.com' caret viridis e1071 randomForest

RUN apt-get install -y libtiff5-dev libtiff-tools
RUN install2.r --error -r 'http://cran.rstudio.com' doParallel tiff jpeg wesanderson
RUN install2.r --error -r 'http://cran.rstudio.com' hwriter ape latticeExtra

RUN install2.r --error -r 'http://cran.rstudio.com' BiocManager
RUN R -e 'BiocManager::install(c("MatrixGenerics"), ask=F)'
RUN R -e 'BiocManager::install(c("BiocParallel", "DelayedArray", "Rsamtools", "Rhtslib"), ask=F)'
RUN R -e 'BiocManager::install(c("Biostrings", "ShortRead", "GenomicRange"), ask=F)'
RUN R -e 'BiocManager::install(c("genbankr", "ggbio", "plyranges"), ask=F)'
RUN R -e 'BiocManager::install("DNABarcodes", ask=F)'
RUN R -e 'BiocManager::install("DECIPHER", ask=F)'

RUN pip3 install nanofilt biopython XlsxWriter progressbar

## v1.1
#RUN install2.r --error -r 'http://cran.rstudio.com' taxonomizer  
RUN apt-get install -y ncbi-blast+
RUN R -e 'BiocManager::install(c("plyrange", "seqinr", "msa"), ask=F)'
ENV BLASTDB /home/rstudio/alpha/blastdb

# v1.2
## apt-get
RUN apt-get install -y bwa bowtie2 samtools bcftools clustalw
## R package CRAN, bioconductor
RUN install2.r --error -r 'http://cran.rstudio.com' vcfR
RUN R -e 'BiocManager::install(c("VariantTools", "Structstrings"), ask=F)'

# v1.3
RUN apt-get install -y elfutils
RUN cd /usr/local/bin
RUN wget https://ftp.ncbi.nlm.nih.gov/genomes/TOOLS/ORFfinder/linux-i64/ORFfinder.gz
RUN gzip -d ORFfinder.gz
RUN chmod 755 ORFfinder
RUN R -e 'BiocManager::install(c("ggtree"), ask=F)'


# v1.4
RUN apt-get install -y mysql-client
RUN install2.r --error -r 'http://cran.rstudio.com' RMySQL bslib shinydashboard shinydashboardPlus

# v1.5
RUN install2.r --error -r 'http://cran.rstudio.com' shinyjs shinyFeedback 
RUN install2.r --error -r 'http://cran.rstudio.com' shinycssloaders shinyFeedback 
RUN install2.r --error -r 'http://cran.rstudio.com' config 

# v1.6
RUN apt-get install -y libv8-dev libsodium-dev
RUN install2.r --error -r 'http://cran.rstudio.com' rstan shinystan ggthemes pool jsonlite plumber shinybusy
#RUN install2.r --error -r 'http://cran.rstudio.com' futile.logger snow matrixStats 


# v1.7
RUN install2.r --error -r 'http://cran.rstudio.com' tensorflow keras

## 
#COPY --chown=rstudio:rstudio /mnt/alpha/dockerimages/rstudio-prefs.json /home/rstudio/.config/rstudio/rstudio-prefs.json


RUN apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/local/src/*
# 
# 



