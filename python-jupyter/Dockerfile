FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]
RUN apt-get update --fix-missing \
    && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata \
    && apt-get install -y --no-install-recommends \
	curl \
	gnupg \
	lsb-release \
	bzip2 \
	locales \
	unzip \
	vim \
        wget \
	net-tools \
	git-core \
	sudo \
	kmod \
	build-essential \
	cmake \
	pkg-config \
	libgl1-mesa-glx

RUN locale-gen ko_KR.UTF-8
ENV LANG=ko_KR.UTF-8 LC_ALL=ko_KR.UTF-8

ARG PYTHON_VERSION=3.8
ARG CONDA_ENV_NAME=basic

## conda installation
RUN curl -sSLk https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -u -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh 
    #&& conda init bash \
    #&& conda config --set allow_conda_downgrades true \
    #&& conda install conda=4.12 \
    #&& conda update -y conda \
RUN conda create -n $CONDA_ENV_NAME python=$PYTHON_VERSION tensorflow --yes 
ENV PATH /usr/local/envs/$CONDA_ENV_NAME/bin:$PATH
RUN source activate ${CONDA_ENV_NAME} 

# install tensorflow.. check version compatablility
# https://www.tensorflow.org/install/source#tested_build_configurations


#RUN conda config --add channels conda-forge \
#    && conda config --add channels anaconda \
#    && conda config --add channels bioconda 
    #&& conda config --set ssl_verify no  \
    #&& conda config --set channel_priority false


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
RUN conda install -c conda-forge -y mesalib


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
#RUN conda install -c bioconda -y nanofilt 
#RUN conda install -c bioconda -y pydna 
#RUN conda install -y pysam 
RUN conda install -c conda-forge -y seaborn 
RUN conda install -c bioconda -y samtools 

RUN python -m pip install ipykernel 
#RUN conda install -c conda-forge -y ipykernel

RUN jupyter serverextension enable --py jupyterlab --sys-prefix 

#RUN python -m ipykernel install --user

# clean
RUN apt-get autoremove -y \
    && apt-get clean 
    #&& conda clean -a -y \
    #&& rm -rf /usr/local/src/*


RUN echo "alias ll='ls -al'" >> ~/.bashrc
RUN echo "export LS_COLORS=\"di=00;36:fi=00;37\"" >> ~/.bashrc
RUN echo "source activate ${CONDA_ENV_NAME}" >> ~/.bashrc
#ENV PATH /usr/local/condabin/bin:$PATH

#COPY vimrc /root/.vimrc

WORKDIR /home/python
#RUN ipython kernel install --user 
RUN python -m ipykernel install --user 
#CMD runserver.sh
#ENTRYPOINT ["/work/entrypoint.sh"]


# env info
#conda env export > environment.yaml
# package info
#conda list --explicit > package-list.txt

