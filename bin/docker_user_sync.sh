#!/bin/bash

userdatadir="/mnt/alpha/dockerimages/rstudio-userdata"
dockername="rstudio"
mkdir -p "$userdatadir"

sudo cp -p /etc/{gshadow,shadow,passwd,group} "$userdatadir"

docker exec "$dockername" bash -c "cp -p $userdatadir/* /etc/"

rm -rf "$userdatadir"

