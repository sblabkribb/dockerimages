# Collection of docker images for SBLab at KRIBB

## python-base
Ubuntu environment for python development  
If any packages is required, add a line of "RUN conda install ..." before the clean command in the Dockerfile     

### Build 

```
docker build -t haseong/python-base:v0.1 .    
```

OR RUN the following in Powershell

```
docker_build.bat 
```

You can change the ID/name:tag as you like. The build process will take around 30min or more. You can download the image as follows.

```
docker pull haseong/python-base:v0.1
```


### Execution

```
docker run --rm -it --name python-base -v ${PWD}:/home/python/ haseong/python-base:0.1 /bin/bash    
```

OR RUN in Powershell

```
docker_run.bat
```

It enables to access jupyter-lab via web browser with 8888 port. Type "http://localhost:8888" in Chrome





