#!/bin/bash

userfile="/home/rstudio/a/dockerimages/rstudio-userdata/users.txt"
#userfile="/root/a/dockerimages/rstudio-userdata/users.txt"

while IFS= read -r line;
do
	var=$(getent passwd | grep $line | wc -l)
	echo $var
	if (($var == 0))
	then
		adduser --disabled-password -gecos "" -home /home/$line/ $line
		echo $line:$line | chpasswd
		cd /home/$line
		cd ~
	fi
done < "$userfile"


