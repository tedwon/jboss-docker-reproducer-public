#!/bin/bash

docker stop jbcs2429-eap72
# docker rm jbcs2429-eap72
# docker run --rm --name jbcs2429-eap72 -h jbcs2429-eap72 -it -d -p 2080:2080 -p 8080:8080 -p 9990:9990 tedwon/jbcs2429-eap72

#docker start jbcs2429-eap72
# docker exec -it jbcs2429-eap72 bash 


docker run --rm --name jbcs2429-eap72 -h jbcs2429-eap72 -p 2080:2080 -p 8080:8080 -p 9990:9990 tedwon/jbcs2429-eap72
