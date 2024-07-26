#!/bin/bash

## Build
docker build -t dns -f ./dns/Dockerfile ./dns
docker build -t proxy -f ./proxy/Dockerfile ./proxy
docker build -t www -f ./www/Dockerfile ./www
docker build -t www2 -f ./www/Dockerfile ./www2


## Run
docker network create -d bridge asa-net

docker run -d --net=asa-net --name www www
docker run -d --net=asa-net --name www2 www2
docker run -dp 80:80 --net=asa-net --name proxy proxy
docker run -d --net=asa-net -p 53:53/tcp -p 53:53/udp --name dns dns

