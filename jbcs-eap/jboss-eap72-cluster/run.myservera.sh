#!/bin/bash

docker run --rm -it --network=host -e EAP_SERVER_NAME=myservera -e EAP_SERVER_PORT_OFFSET=0 tedwon/jbcs2429-eap72-cluster
