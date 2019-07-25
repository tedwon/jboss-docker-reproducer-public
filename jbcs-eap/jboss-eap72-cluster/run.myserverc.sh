#!/bin/bash

docker run --rm -it --network=host -e EAP_SERVER_NAME=myserverc -e EAP_SERVER_PORT_OFFSET=200 tedwon/jbcs2429-eap72-cluster
