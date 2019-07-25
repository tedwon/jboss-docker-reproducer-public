#!/bin/bash

docker stop jbcs2429-eap64
# docker rm jbcs2429-eap64
# docker run --rm --name jbcs2429-eap64 -h jbcs2429-eap64 -it -d -p 2080:2080 -p 8080:8080 -p 9990:9990 tedwon/jbcs2429-eap64

#docker start jbcs2429-eap64
# docker exec -it jbcs2429-eap64 bash 


docker run --rm --name jbcs2429-eap64 -h jbcs2429-eap64 -it -p 2080:2080 -p 8080:8080 -p 9990:9990 tedwon/jbcs2429-eap64
