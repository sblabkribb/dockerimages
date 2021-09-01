#!/bin/bash

userdatadir="rstudio-userdata"
mkdir -p $userdatadir
#getent passwd {1000..6000} | cut -d: -f1 > $userdatadir/users.txt

# copy user files to userdatadir
cp -p /etc/gshadow $userdatadir/
cp -p /etc/shadow $userdatadir/
cp -p /etc/passwd $userdatadir/
cp -p /etc/group $userdatadir/

# copy user files to docker container /etc/
docker exec -it rstudio /bin/bash -c "cp -p /home/rstudio/a/dockerimages/$userdatadir/* /etc/"
#docker exec -it rstudio /bin/bash -c "/home/rstudio/a/dockerimages/users_add.sh"

rm -rf $userdatadir

