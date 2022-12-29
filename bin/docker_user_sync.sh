#!/bin/bash

# create a temporary folder
userdatadir="/mnt/alpha/dockerimages/rstudio-userdata"
dockername="rstudio"
mkdir -p $userdatadir
# copy user files to userdatadir
sudo cp -p /etc/gshadow $userdatadir/
sudo cp -p /etc/shadow $userdatadir/
sudo cp -p /etc/passwd $userdatadir/
sudo cp -p /etc/group $userdatadir/
# copy user files to docker container /etc/
docker exec -i $dockername /bin/bash -c "cp -p $userdatadir/* /etc/"
# delete the folder
rm -rf $userdatadir
