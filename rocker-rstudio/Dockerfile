FROM rocker/rstudio:4.1.2
#FROM rocker/rstudio:devel

SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get install -y --no-install-recommends \
	apt-utils \
	build-essential \
	bzip2 \
	ca-certificates \
	cmake \
	curl \
	gcc \
	libbz2-dev \
	libcairo2-dev \
	liblzma-dev \
	libxt-dev \
	mysql-client \
	python3-pip \
	python3-venv \
	vim \
	## for mpi
	libjpeg-dev \
	libopenmpi-dev \
	openmpi-bin \
	openmpi-common \
	## tidyverse requirements
	libxml2-dev \
	## for pdf, tex engine, texlive-xetex is required for hangule pdf
	fonts-nanum \
	ghostscript \
	language-pack-ko \
	libmysqlclient-dev \
	pandoc \
	texlive-extra-utils \
	texlive-full \
	texlive-xetex \
	## forgot why do these required...
	elfutils \
	libsodium-dev \
	libtiff-tools \
	libtiff5-dev \
	libv8-dev \
	libfftw3-dev \
	libx11-dev \
	libtiff-dev

RUN locale-gen ko_KR.UTF-8
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8



ARG PYTHON_VERSION=3.8
ARG CONDA_ENV_NAME=basic

## conda installation
RUN curl -sSLk https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -u -bfp /opt \
    && rm -rf /tmp/miniconda.sh 
    #&& conda init bash \
    #&& conda config --set allow_conda_downgrades true \
    #&& conda install conda=4.12 \
    #&& conda update -y conda \
ENV PATH /opt/bin:$PATH
RUN conda create -n $CONDA_ENV_NAME python=$PYTHON_VERSION tensorflow --yes 
ENV PATH /opt/envs/$CONDA_ENV_NAME/bin:$PATH

RUN source activate ${CONDA_ENV_NAME} 

RUN conda install -c anaconda -y pandas 
RUN conda install -c conda-forge -y jupyterlab 
RUN conda install -c conda-forge -y matplotlib 
RUN conda install -c conda-forge -y keras 
RUN conda install -c conda-forge -y scikit-image 
RUN conda install -c conda-forge -y scikit-learn 
RUN conda install -c conda-forge -y scikit-learn-intelex 
#RUN conda install -c pytorch-lts -y pytorch 
#RUN conda install -c pytorch-lts -y torchvision
RUN conda install -c conda-forge -y opencv 

RUN conda install -c conda-forge -y biopython 
RUN conda install -c bioconda -y blast 
RUN conda install -c bioconda -y bowtie2 
RUN conda install -c bioconda -y bwa 
RUN conda install -c bioconda -y bcftools
RUN conda install -c bioconda -y clustalw 
#RUN conda install -c bioconda -y cutadapt 
RUN conda install -c bioconda -y fastqc 
#RUN conda install -y khmer 
RUN conda install -c bioconda -y minimap2
RUN conda install -c bioconda -y nanofilt 
#RUN conda install -c bioconda -y pydna 
#RUN conda install -y pysam 
RUN conda install -c conda-forge -y seaborn 
RUN conda install -c bioconda -y samtools 




RUN install2.r --error -r 'http://cran.rstudio.com' ape 
RUN install2.r --error -r 'http://cran.rstudio.com' BiocManager 
RUN install2.r --error -r 'http://cran.rstudio.com' bookdown 
RUN install2.r --error -r 'http://cran.rstudio.com' bslib 
RUN install2.r --error -r 'http://cran.rstudio.com' caret 
RUN install2.r --error -r 'http://cran.rstudio.com' config 
RUN install2.r --error -r 'http://cran.rstudio.com' DBI 
RUN install2.r --error -r 'http://cran.rstudio.com' deSolve 
RUN install2.r --error -r 'http://cran.rstudio.com' devtools 
RUN install2.r --error -r 'http://cran.rstudio.com' doParallel 
RUN install2.r --error -r 'http://cran.rstudio.com' DT 
RUN install2.r --error -r 'http://cran.rstudio.com' e1071 
RUN install2.r --error -r 'http://cran.rstudio.com' ggthemes 
RUN install2.r --error -r 'http://cran.rstudio.com' gt 
RUN install2.r --error -r 'http://cran.rstudio.com' hwriter 
#RUN install2.r --error -r 'http://cran.rstudio.com' imager 
RUN install2.r --error -r 'http://cran.rstudio.com' jpeg 
RUN install2.r --error -r 'http://cran.rstudio.com' jsonlite 
RUN install2.r --error -r 'http://cran.rstudio.com' kableExtra 
RUN install2.r --error -r 'http://cran.rstudio.com' keras 
RUN install2.r --error -r 'http://cran.rstudio.com' latticeExtra 
RUN install2.r --error -r 'http://cran.rstudio.com' minpack.lm 
RUN install2.r --error -r 'http://cran.rstudio.com' pbmcapply 
RUN install2.r --error -r 'http://cran.rstudio.com' plumber 
RUN install2.r --error -r 'http://cran.rstudio.com' pool 
RUN install2.r --error -r 'http://cran.rstudio.com' randomForest 
RUN install2.r --error -r 'http://cran.rstudio.com' reticulate 
RUN install2.r --error -r 'http://cran.rstudio.com' reutils 
RUN install2.r --error -r 'http://cran.rstudio.com' RMySQL 
RUN install2.r --error -r 'http://cran.rstudio.com' rstan 
RUN install2.r --error -r 'http://cran.rstudio.com' shiny 
RUN install2.r --error -r 'http://cran.rstudio.com' shinybusy 
RUN install2.r --error -r 'http://cran.rstudio.com' shinycssloaders 
RUN install2.r --error -r 'http://cran.rstudio.com' shinydashboard 
RUN install2.r --error -r 'http://cran.rstudio.com' shinydashboardPlus 
RUN install2.r --error -r 'http://cran.rstudio.com' shinyFeedback 
RUN install2.r --error -r 'http://cran.rstudio.com' shinyjs 
#RUN install2.r --error -r 'http://cran.rstudio.com' shinystan 
RUN install2.r --error -r 'http://cran.rstudio.com' shinytest 
RUN install2.r --error -r 'http://cran.rstudio.com' tensorflow 
RUN install2.r --error -r 'http://cran.rstudio.com' testthat 
#RUN install2.r --error -r 'http://cran.rstudio.com' tidymodel 
RUN install2.r --error -r 'http://cran.rstudio.com' tidyverse 
RUN install2.r --error -r 'http://cran.rstudio.com' tiff 
RUN install2.r --error -r 'http://cran.rstudio.com' tinytex 
RUN install2.r --error -r 'http://cran.rstudio.com' TmCalculator 
RUN install2.r --error -r 'http://cran.rstudio.com' usethis 
RUN install2.r --error -r 'http://cran.rstudio.com' vcfR 
RUN install2.r --error -r 'http://cran.rstudio.com' viridis 
RUN install2.r --error -r 'http://cran.rstudio.com' wesanderson 
RUN install2.r --error -r 'http://cran.rstudio.com' writexl 
RUN install2.r --error -r 'http://cran.rstudio.com' XML 


RUN R -e 'BiocManager::install(c( "MatrixGenerics",  "BiocParallel",   "Biostrings",  "DECIPHER",  "DNABarcodes",  "DelayedArray",  "GenomicRange",  "Rhtslib",  "Rsamtools", "ShortRead", "Structstrings", "VariantTools", "genbankr", "ggbio",  "ggtree",  "msa",  "openPrimeR",  "plyrange",  "plyranges",  "seqinr"), ask=F)'


#ENV BLASTDB /home/rstudio/alpha/blastdb

## ORFfinder
RUN cd /usr/local/bin
RUN wget https://ftp.ncbi.nlm.nih.gov/genomes/TOOLS/ORFfinder/linux-i64/ORFfinder.gz
RUN gzip -d ORFfinder.gz
RUN chmod 755 ORFfinder
# 
## shinydsembler
#RUN R -e 'devtools::install_github("[git\@github.com](mailto:git@github.com){.email}:sblabkribb/shinydsembler.git", ref="main", auth_token = "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" )'


RUN apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/local/src/*
# 
# 

RUN echo "alias ll='ls -al'" >> ~/.bashrc
RUN echo "export LS_COLORS=\"di=00;36:fi=00;37\"" >> ~/.bashrc
RUN echo "source activate ${CONDA_ENV_NAME}" >> ~/.bashrc

#ENV PATH /opt/condabin/bin:$PATH

#WORKDIR /home/python


# env info
#conda env export > environment.yaml
# package info
#conda list --explicit > package-list.txt



