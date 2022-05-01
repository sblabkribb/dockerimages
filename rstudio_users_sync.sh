#!/bin/bash

if [ $# -eq 0 ]
  then
    echo -e "\nNo arguments supplied! Please specify docker image name.\n"
    exit 1
fi

userdatadir="/mnt/alpha/dockerimages/rstudio-userdata"
mkdir -p $userdatadir
#getent passwd {1000..6000} | cut -d: -f1 > $userdatadir/users.txt

# copy user files to userdatadir
cp -p /etc/gshadow $userdatadir/
cp -p /etc/shadow $userdatadir/
cp -p /etc/passwd $userdatadir/
cp -p /etc/group $userdatadir/

# copy user files to docker container /etc/
docker exec -i $1 /bin/bash -c "cp -p $userdatadir/* /etc/"
#docker exec -it rstudio /bin/bash -c "/home/rstudio/alpha/dockerimages/users_add.sh"

echo "added"
rm -rf $userdatadir

