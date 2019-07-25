#!/bin/bash

docker run --rm -it --network=host -e EAP_SERVER_NAME=myserverb -e EAP_SERVER_PORT_OFFSET=100 tedwon/jbcs2429-eap72-cluster
