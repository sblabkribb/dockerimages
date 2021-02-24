FROM ubuntu:18.04

RUN apt-get update --fix-missing \
    && apt-get install -y vim locales cmake build-essential \
                          gcc g++ openssl libgl1-mesa-glx \
                          wget bzip2 ca-certificates curl \
                          git pciutils unzip ssl-cert \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN locale-gen ko_KR.UTF-8
ENV LANG=ko_KR.UTF-8 LC_ALL=ko_KR.UTF-8

RUN wget --no-check-certificate https://curl.haxx.se/ca/cacert.pem \
    && cp cacert.pem /usr/lib/ssl/certs \
    && c_rehash /usr/lib/ssl/certs

## conda installation
RUN apt-get -qq update && apt-get -qq -y install ca-certificates \
    && curl -sSLk https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -u -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda config --set ssl_verify no \
    && conda install -y python=3 \
    && conda update conda \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \
    && conda clean --all --yes
ENV PATH /opt/conda/bin:$PATH

## conda packages
SHELL ["/bin/bash", "-c"]
RUN conda config --set ssl_verify no \
    && source activate \
    && conda config --add channels conda-forge \
    && conda config --add channels anaconda \
    && conda config --add channels bioconda \
    && conda install biopython jupyterlab pandas \
                     matplotlib blast scikit-learn \
                     openssl certifi cffi scikit-image \
                     keras

RUN pip install torch torchvision seaborn 
RUN pip install pydna reportlab

#RUN conda config --set ssl_verify no \
#    && source activate \
#    && conda config --add channels bioconda \
RUN  conda install khmer fastqc cutadapt
RUN  conda install pysam nanofilt
RUN  conda install minimap2 samtools

# clean
RUN apt-get autoremove -y \
    && apt-get clean \
    && conda clean -a -y \
    && rm -rf /usr/local/src/*


RUN echo "alias ll='ls -al'" >> ~/.bashrc
RUN echo "export LS_COLORS=\"di=00;36:fi=00;37\"" >> ~/.bashrc
ENV PATH /opt/conda/envs/env/bin:$PATH

COPY vimrc /root/.vimrc

WORKDIR /home/python/dev
#CMD runserver.sh
#ENTRYPOINT ["/work/entrypoint.sh"]


