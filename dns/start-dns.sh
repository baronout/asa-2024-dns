#!/bin/bash

docker build -t dns -f Dockerfile .
docker run -d -p 53:53/tcp -p 53:53/udp --name dns dns