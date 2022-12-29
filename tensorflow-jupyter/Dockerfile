FROM tensorflow/tensorflow:latest-jupyter 

RUN apt-get update && apt-get install -y --no-install-recommends \
        libgl1-mesa-glx \
        libglib2.0-0

RUN pip install torch opencv-python pandas torchvision pyyaml tqdm seaborn

