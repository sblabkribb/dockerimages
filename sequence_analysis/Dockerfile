# Use a base image with Java
# Build by Aporva Gupta SBLab KRIBB 2024
# Maintained by SBLab

FROM adoptopenjdk/openjdk11

#adoptopenjdk/openjdk11:x86_64-ubuntu-jdk-11.0.21_9

# Set the working directory
WORKDIR /usr/src/app

# Install wget
RUN apt-get update && \
    apt-get install -y wget unzip

# Download IGVTools
RUN wget https://data.broadinstitute.org/igv/projects/downloads/2.16/IGV_2.16.2.zip && \
    unzip IGV_2.16.2.zip && \
    rm IGV_2.16.2.zip

# minimap2
RUN apt-get update && \
    apt-get install -y ncurses-base zlib1g liblzma5 libbz2-1.0 curl libcurl4 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# for easy upgrade later. ARG variables only persist during image build time
ARG MINIMAP2_VER="2.25"

# install deps and cleanup apt garbage
RUN apt-get update && apt-get install -y --no-install-recommends \
 curl \
 ca-certificates \
 bzip2 \
 procps && \
 apt-get autoclean && rm -rf /var/lib/apt/lists/*

# install minimap2 binary; make /data
RUN curl -L https://github.com/lh3/minimap2/releases/download/v${MINIMAP2_VER}/minimap2-${MINIMAP2_VER}_x64-linux.tar.bz2 | tar -jxvf - && \
 mkdir /data

# for easy upgrade later. ARG variables only persist during image build
ARG SAMTOOLSVER=1.18

# install dependencies and clean up apt garbage
RUN apt-get update && apt-get install --no-install-recommends -y \
 libncurses5-dev \
 libbz2-dev \
 liblzma-dev \
 libcurl4-gnutls-dev \
 zlib1g-dev \
 libssl-dev \
 gcc \
 wget \
 make \
 perl \
 bzip2 \
 gnuplot \
 ca-certificates \
 gawk && \
 apt-get autoclean && rm -rf /var/lib/apt/lists/*

# install samtools, make /data
RUN wget https://github.com/samtools/samtools/releases/download/${SAMTOOLSVER}/samtools-${SAMTOOLSVER}.tar.bz2 && \
 tar -xjf samtools-${SAMTOOLSVER}.tar.bz2 && \
 rm samtools-${SAMTOOLSVER}.tar.bz2 && \
 cd samtools-${SAMTOOLSVER} && \
 ./configure && \
 make && \
 make install

# bedtools
ARG BEDTOOLS_VER="2.31.1"

# RUN apt-get update && apt-get install -y --no-install-recommends bedtool

# install deps via apt-get, these are mainly for compiling bedtools code and for running tests. some are for downloading files (wget, ca-certificates)
# last command is to point 'python' cmd to `python3` so that bedtools test scripts work. There are bash scripts that call 'python'
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \ 
    zlib1g-dev \
    libghc-bzlib-dev \
    liblzma-dev \
    wget \
    ca-certificates \
    python3 && \
    apt-get autoclean && rm -rf /var/lib/apt/lists/* && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 10

# python3 required when compiling via `make` command for creating old CLI executables
# dependencies listed here (albeit for v2.30.0, still should be identical): https://packages.ubuntu.com/jammy/bedtools
# requires libghc-bzlib-dev, build-essential, zlib1g-dev, and a few others
# 'make install' should place binary executable files in /usr/local/bin
RUN wget -q https://github.com/arq5x/bedtools2/releases/download/v${BEDTOOLS_VER}/bedtools-${BEDTOOLS_VER}.tar.gz && \
   tar -xzf bedtools-${BEDTOOLS_VER}.tar.gz && \
   cd bedtools2 && \
   make && \
   make install


# set final PATH and LC_ALL for singularity compatibility
ENV PATH=/opt/java/openjdk/bin:/usr/src/app/IGV_2.16.2:/usr/src/app/minimap2-${MINIMAP2_VER}_x64-linux:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin: \
LC_ALL=C

RUN apt-get update
RUN apt-get install -y python3-pip
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir pysam biopython numpy pandas

# set final working directory as /data
WORKDIR /data
