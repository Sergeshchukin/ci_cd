#!/bin/bash

echo "Build docker image"
docker build . -t my_nginx > /dev/null

echo "Run docker container"
docker run --name check-site -p 9889:80 my_nginx > /dev/null 2>&1 &
sleep 5

echo "Remove docker"
docker stop check-site > /dev/null
docker rm check-site > /dev/null
docker rmi my_nginx -f > /dev/null

