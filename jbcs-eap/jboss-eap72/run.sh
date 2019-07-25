#!/bin/bash

docker stop jboss-eap72
# docker run --rm --name jboss-eap72 -h jboss-eap72 -it -d -p 2080:2080 -p 8080:8080 -p 9990:9990 tedwon/jboss-eap72
docker run --rm --name jboss-eap72 -h jboss-eap72 -it -p 2080:2080 -p 8080:8080 -p 9990:9990 tedwon/jboss-eap72

#docker start jboss-eap72
# docker exec -it jboss-eap72 bash 
