#!/bin/bash

docker stop jboss-eap64:15
# docker run --rm --name jboss-eap64 -h jboss-eap64 -it -d -p 2080:2080 -p 8080:8080 -p 9990:9990 tedwon/jboss-eap64:15
docker run --rm --name jboss-eap64 -h jboss-eap64 -it -p 2080:2080 -p 8080:8080 -p 9990:9990 tedwon/jboss-eap64:15

#docker start jboss-eap64
# docker exec -it jboss-eap64 bash 
