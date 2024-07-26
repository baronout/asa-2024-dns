#!/bin/bash

## Build
docker build -t proxy -f ./proxy
docker build -t web -f ./web

## Run
docker network create -d bridge asa-net

docker run -d --net=asa-net --name web web
docker run -dp 80:80 --net=asa-net --name proxy proxy