#!/bin/bash

cp -p /etc/shadow /mnt/a/dev/rstudio_users/
cp -p /etc/gshadow /mnt/a/dev/rstudio_users/
cp -p /etc/passwd /mnt/a/dev/rstudio_users/
cp -p /etc/group /mnt/a/dev/rstudio_users/

docker exec rstudio /bin/bash -c "cp -p /home/rstudio/dev/rstudio_users/shadow /etc/"
docker exec rstudio /bin/bash -c "cp -p /home/rstudio/dev/rstudio_users/gshadow /etc/"
docker exec rstudio /bin/bash -c "cp -p /home/rstudio/dev/rstudio_users/passwd /etc/"
docker exec rstudio /bin/bash -c "cp -p /home/rstudio/dev/rstudio_users/group /etc/"
