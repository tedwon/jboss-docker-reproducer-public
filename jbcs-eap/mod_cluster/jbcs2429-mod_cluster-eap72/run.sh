#!/bin/bash

docker stop jbcs2429-mod_cluster-eap72
# docker run --rm --name jbcs2429-mod_cluster-eap72 -h jbcs2429-mod_cluster-eap72 -it -d -p 2080:2080 -p 8080:8080 -p 9990:9990 -p 16666:16666 tedwon/jbcs2429-mod_cluster-eap72

#docker start jbcs2429-mod_cluster-eap72
# docker exec -it jbcs2429-mod_cluster-eap72 bash

docker run --rm --name jbcs2429-mod_cluster-eap72 -h jbcs2429-mod_cluster-eap72 -it -p 2080:2080 -p 8080:8080 -p 9990:9990 -p 16666:16666 tedwon/jbcs2429-mod_cluster-eap72

