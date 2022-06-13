#!/bin/bash


echo "Delete container..."
dockerps=$(docker ps --filter status=exited -q)
for line in $dockerps 
do
	echo $line
	docker rm $line
done

echo "Delete images..."
dockerimgps=$(docker images -f "dangling=true" -q)
for line in $dockerimgps
do
	echo $line
	docker rmi $line
done

#$dockerps | while read lines; do
#	echo $line
#done 


#docker rm $(docker ps --filter status=exited -q)

#echo "Delete <none> images..."
#docker rmi $(docker images -f "dangling=true" -q)
