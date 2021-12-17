# Collection of docker images for SBLab at KRIBB

- docker-compose로 rocker-rstudio와 mysql:8.0이 실행. 설정파일은 docker-compose.yml 이며 mysql은 별도 Dockerfile 없이 이미지를 바로 다운로드해서 사용

- rocker-rstudio는 rstudio-server 사용을 위한 대부분의 패키지가 설치되어 있는 이미지임


# Installation

```
> git clone git@github.com:sblabkribb/dockerimages.git
> cd dockerimages
> docker-compose up -d
> ./users_sync.sh
```





