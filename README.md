# Collection of Docker images for KRIBB SBlab 

## python-base
Ubuntu environment for python development  
If any packages is required, add a line of "RUN conda install ..." before the clean command in the Dockerfile     

### build 
> docker build -t haseong/python-base:v0.1 .    
OR RUN "docker_build.bat" in Powershell

### execution
> docker run --rm -it --name python-base -v ${PWD}:/home/python/ haseong/python-base:0.1 /bin/bash    
OR RUN "docker_run.bat" in Powershell (it enables to access jupyter-lab via web browser with 8888 port. "http://localhost:8888")





