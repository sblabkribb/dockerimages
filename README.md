# Collection of docker images for SBLab at KRIBB

## python-base
Ubuntu environment for python development. If you require any additional packages, add a line of "RUN conda install [package name]" before the cleanning command at the end of the Dockerfile     

### Build 

```
docker build -t haseong/python-base:v0.1 .    
```
You can change the [ID/name:tag] as you like. The build process will take around 30min or more. You can also download the image as follows.

```
docker pull haseong/python-base:v0.1
```

OR run the following batch file in Powershell

```
docker_build.bat 
```





### Execution

```
docker run --rm -it --name python-base -v ${PWD}:/home/python/ haseong/python-base:0.1 /bin/bash    
```

OR run the following file in Powershell

```
docker_run.bat
```

This script enables to access jupyter-lab directly via web browser with 8888 port. Type "http://localhost:8888" in Chrome





