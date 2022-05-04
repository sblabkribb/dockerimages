FROM rocker/rstudio:4.1.2
#FROM rocker/rstudio:devel

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

ARG PYTHON_VERSION=3
ARG CONDA_ENV_NAME=basic

RUN curl -sSLk https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -u -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda config --set allow_conda_downgrades true \
    && conda install conda=4.12 \
    #&& conda update -y conda \
    && conda update --all --yes \
    && conda create -n $CONDA_ENV_NAME python=$PYTHON_VERSION --yes 
ENV PATH /usr/local/envs/$CONDA_ENV_NAME/bin:$PATH

RUN source activate ${CONDA_ENV_NAME} 

RUN conda config --add channels conda-forge \
    && conda config --add channels anaconda \
    && conda config --add channels bioconda \
    && conda config --set ssl_verify no  \
    && conda config --set channel_priority false

RUN conda install -y 
	bcftools \
 	biopython \
	blast \
	bowtie2 \
	bwa \
	certifi \
	cffi \
	clustalw \
	cutadapt \ 
	fastqc \
	jupyterlab \
	keras \
	khmer \
	matplotlib \
	minimap2 \
	nanofilt \ 
	openssl \
	pandas \
	pydna \
	pysam \
	pytorch \
	samtools \
	scikit-image \
	scikit-learn \
	seaborn \
	tensorflow \
	torchvision 


RUN install2.r --error -r 'http://cran.rstudio.com' \
	BiocManager \
	DBI \
	DT \
	RMySQL \
	TmCalculator \
	XML \
	ape \
	bookdown \
	bslib \
	caret \
	config \
	deSolve \
	devtools \
	doParallel \
	e1071 \
	ggthemes \
	gt \
	hwriter \
	jpeg \
	jsonlite \
	kableExtra \
	keras \
	latticeExtra \
	imager \
	minpack.lm \
	pbmcapply \
	plumber \
	pool \
	randomForest \
	reticulate \
	reutils \
	rstan \
	shiny \
	shinyFeedback \
	shinybusy \
	shinycssloaders \
	shinydashboard \
	shinydashboardPlus \
	shinyjs \
	shinystan \
	shinytest \
	tensorflow \
	testthat \
	tidyverse \
	## tidymodel \
	tiff \
	tinytex \
	usethis \
	vcfR \
	viridis \
	wesanderson \
	writexl 


RUN R -e 'BiocManager::install(c( "MatrixGenerics",  "BiocParallel",   "Biostrings",  "DECIPHER",  "DNABarcodes",  "DelayedArray",  "GenomicRange",  "Rhtslib",  "Rsamtools", "ShortRead", "Structstrings", "VariantTools", "genbankr", "ggbio",  "ggtree",  "msa",  "openPrimeR",  "plyrange",  "plyranges",  "seqinr"), ask=F)'


#ENV BLASTDB /home/rstudio/alpha/blastdb

## ORFfinder
RUN cd /usr/local/bin
RUN wget https://ftp.ncbi.nlm.nih.gov/genomes/TOOLS/ORFfinder/linux-i64/ORFfinder.gz
RUN gzip -d ORFfinder.gz
RUN chmod 755 ORFfinder

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

ENV PATH /usr/local/condabin/bin:$PATH

#WORKDIR /home/python


# env info
#conda env export > environment.yaml
# package info
#conda list --explicit > package-list.txt



