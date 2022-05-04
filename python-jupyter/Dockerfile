FROM tensorflow/tensorflow:devel

SHELL ["/bin/bash", "-c"]
RUN apt-get update --fix-missing \
    && apt-get install -y --no-install-recommends \
	ca-certificates \
	curl \
	gnupg \
	lsb-release \
	bzip2 \
	locales \
	unzip \
	vim \
        wget 

RUN locale-gen ko_KR.UTF-8
ENV LANG=ko_KR.UTF-8 LC_ALL=ko_KR.UTF-8

ARG PYTHON_VERSION=3
ARG CONDA_ENV_NAME=basic

## conda installation
RUN curl -sSLk https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -u -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    #&& conda init bash \
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

RUN conda install -y \
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


RUN jupyter serverextension enable --py jupyterlab --sys-prefix 

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
#CMD runserver.sh
#ENTRYPOINT ["/work/entrypoint.sh"]


# env info
#conda env export > environment.yaml
# package info
#conda list --explicit > package-list.txt

