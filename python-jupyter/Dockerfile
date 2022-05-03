FROM ubuntu:18.04

RUN apt-get update --fix-missing \
    && apt-get install -y --no-install-recommends \
	build-essential \
	bzip2 \
	ca-certificates \
	cmake \
	curl \
	g++ \
        gcc \
        git \
	libgl1-mesa-glx \
	locales \
	openssl \
	pciutils \
	ssl-cert \
	unzip \
	vim \
        wget 

RUN locale-gen ko_KR.UTF-8
ENV LANG=ko_KR.UTF-8 LC_ALL=ko_KR.UTF-8


#RUN wget --no-check-certificate https://curl.haxx.se/ca/cacert.pem \
#    && cp cacert.pem /usr/lib/ssl/certs \
#    && c_rehash /usr/lib/ssl/certs

## conda installation
RUN curl -sSLk https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -u -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda config --set ssl_verify no \
    && conda init bash \
    && conda update conda \
    && conda create -n basic python=3 --yes 



SHELL ["/bin/bash", "-c"]
RUN conda config --set ssl_verify no \
    && source activate basic \
    && conda config --add channels conda-forge \
    && conda config --add channels anaconda \
    && conda config --add channels bioconda \
    && conda update --all --yes \
    && conda install biopython jupyterlab pandas matplotlib blast scikit-learn \
    && conda install openssl certifi cffi scikit-image keras nanofilt \
    && conda install pytorch torchvision seaborn pydna khmer fastqc cutadapt \
    && conda install pysam minimap2 samtools






# clean
RUN apt-get autoremove -y \
    && apt-get clean \
    && conda clean -a -y \
    && rm -rf /usr/local/src/*


RUN echo "alias ll='ls -al'" >> ~/.bashrc
RUN echo "export LS_COLORS=\"di=00;36:fi=00;37\"" >> ~/.bashrc
ENV PATH /usr/local/conda/envs/env/bin:$PATH
ENV PATH /usr/local/conda/bin:$PATH

COPY vimrc /root/.vimrc

WORKDIR /home/python/
#CMD runserver.sh
#ENTRYPOINT ["/work/entrypoint.sh"]


