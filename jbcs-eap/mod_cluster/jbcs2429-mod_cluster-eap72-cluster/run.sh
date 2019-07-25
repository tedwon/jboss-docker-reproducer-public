#!/bin/bash

docker stop jbcs2429-mod_cluster-eap72-cluster
# docker run --rm --name jbcs2429-mod_cluster-eap72-cluster -h jbcs2429-mod_cluster-eap72-cluster -it -d -p 2080:2080 -p 8080:8080 -p 9990:9990 -p 16666:16666 -p 8180:8180 -p 10090:10090 tedwon/jbcs2429-mod_cluster-eap72-cluster
docker run --rm --name jbcs2429-mod_cluster-eap72-cluster -h jbcs2429-mod_cluster-eap72-cluster -p 2080:2080 -p 8080:8080 -p 9990:9990 -p 16666:16666 -p 8180:8180 -p 10090:10090 tedwon/jbcs2429-mod_cluster-eap72-cluster

#docker start jbcs2429-mod_cluster-eap72-cluster
# docker exec -it jbcs2429-mod_cluster-eap72-cluster bash 
