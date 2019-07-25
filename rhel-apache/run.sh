#!/bin/bash

docker stop rhel-apache
# docker rm rhel-apache
docker run --rm --name rhel-apache -h rhel-apache -it -d -p 80:80 tedwon/rhel-apache

#docker start rhel-apache
docker exec -it rhel-apache bash 
