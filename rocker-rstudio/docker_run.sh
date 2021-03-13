#!/bin/bash
sudo docker run -d --rm \
	-p 8787:8787 \
	-e PASSWORD=haseong \
	-v /home/haseong/alpha/:/alpha/ \
	--name rstudio-server \
	haseong/rocker-rstudio:v0.3
	#haseong/rstudio-server-run:v02


docker exec rstudio-server /bin/bash -c "cp -p /alpha/class/2021-1-researchE/shadow /etc/"
docker exec rstudio-server /bin/bash -c "cp -p /alpha/class/2021-1-researchE/gshadow /etc/"
docker exec rstudio-server /bin/bash -c "cp -p /alpha/class/2021-1-researchE/passwd /etc/"
docker exec rstudio-server /bin/bash -c "cp -p /alpha/class/2021-1-researchE/group /etc/"
