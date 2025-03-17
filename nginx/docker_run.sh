#!/usr/bin/env bash

docker run -p 60050:80 --rm --name nginx -d  \
      -v /home/haseong/dev/igvdata/:/usr/share/nginx/html:ro \
      -v /home/haseong/dev/dockerimages/nginx/default.conf:/etc/nginx/conf.d/default.conf:ro \
	nginx


