FROM tensorflow/tensorflow:latest-jupyter 

RUN apt-get update && apt-get install -y --no-install-recommends \
        libgl1-mesa-glx \
        libglib2.0-0 \
        wget 

#RUN groupadd -g 1001 haseong && \
#    useradd -u 1001 -g 1001 -s /bin/bash haseong

RUN pip install torch opencv-python pandas torchvision pyyaml tqdm seaborn

RUN wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
RUN dpkg -i ./nvim-linux64.deb

#USER haseong





