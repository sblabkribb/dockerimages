docker run -d --rm -it -p 8888:8888  --name cudadl -v c:\mydocs\2020\dev:/home/dev haseong/cuda-dl:v1 jupyter lab --no-browser --allow-root --ip=0.0.0.0 --notebook-dir=/haseong/dev --NotebookApp.token=
