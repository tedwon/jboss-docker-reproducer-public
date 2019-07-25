#!/bin/bash

export EAP_HOME="/opt/eap/jboss-eap-7.2"

$EAP_HOME/bin/standalone.sh -c standalone-ha.xml -Dserver.name=myservera -Djboss.node.name=myservera \
-Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0 \
-Djboss.socket.binding.port-offset=0 \
-Dserver=myservera
