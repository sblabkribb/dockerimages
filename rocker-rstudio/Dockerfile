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
	vim 


RUN locale-gen ko_KR.UTF-8
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
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
	## blast
	bcftools \
	bowtie2 \
	bwa \
	clustalw \
	ncbi-blast+ \
	samtools \
	## forgot why do these required...
	elfutils \
	libsodium-dev \
	libtiff-tools \
	libtiff5-dev \
	libv8-dev 


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
	tiff \
	tinytex \
	usethis \
	vcfR \
	viridis \
	wesanderson \
	writexl 


RUN R -e 'BiocManager::install(c("MatrixGenerics", "BiocParallel",  "Biostrings",  "DECIPHER",  "DNABarcodes",  "DelayedArray",  "GenomicRange",  "Rhtslib",  "Rsamtools", "ShortRead", "Structstrings", "VariantTools", "genbankr", "ggbio",  "ggtree",  "msa",  "openPrimeR",  "plyrange",  "plyranges",  "seqinr"), ask=F)'

RUN pip3 install \
	nanofilt \
	biopython 


ENV BLASTDB /home/rstudio/alpha/blastdb

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



