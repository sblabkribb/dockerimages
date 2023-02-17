#!/bin/bash

userdatadir="/mnt/alpha/dockerimages/userdata"

if [ $# -eq 0 ]; then
  dockername="rstudio"
else
  dockername="$1"
fi

sudo mkdir -p "$userdatadir"

sudo cp -p /etc/{gshadow,shadow,passwd,group} "$userdatadir"

docker exec "$dockername" bash -c "cp -p $userdatadir/* /etc/"

#rm -rf "$userdatadir"

