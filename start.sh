#!/bin/bash

## Build
./dns/start-dns.sh
docker build -t proxy -f ./proxy/Dockerfile ./proxy
docker build -t www -f ./www/Dockerfile ./www

## Run
docker network create -d bridge asa-net

docker run -d --net=asa-net --name www www
docker run -dp 80:80 --net=asa-net --name proxy proxy

