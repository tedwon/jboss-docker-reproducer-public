#!/bin/bash

if [ -z $EAP_SERVER_NAME ]; then
  exit 1
fi

if [ -z $EAP_SERVER_PORT_OFFSET ]; then
  exit 1
fi

# echo $EAP_SERVER_NAME
# echo $EAP_SERVER_PORT_OFFSET

export EAP_HOME="/opt/eap/jboss-eap-7.2"

# https://goldmann.pl/blog/2013/10/07/wildfly-cluster-using-docker-on-fedora/
IPADDR=$(ip a s | sed -ne '/127.0.0.1/!{s/^[ \t]*inet[ \t]*\([0-9.]\+\)\/.*$/\1/p}'| head -n 1)

# echo $IPADDR

echo $EAP_HOME/bin/standalone.sh -c standalone-ha.xml -Dserver.name=$EAP_SERVER_NAME -Djboss.node.name=$EAP_SERVER_NAME \
-Djboss.bind.address=$IPADDR -Djboss.bind.address.management=$IPADDR \
-Djboss.socket.binding.port-offset=$EAP_SERVER_PORT_OFFSET \
-Dserver=$EAP_SERVER_NAME

$EAP_HOME/bin/standalone.sh -c standalone-ha.xml -Dserver.name=$EAP_SERVER_NAME -Djboss.node.name=$EAP_SERVER_NAME \
-Djboss.bind.address=$IPADDR -Djboss.bind.address.management=$IPADDR \
-Djboss.socket.binding.port-offset=$EAP_SERVER_PORT_OFFSET \
-Dserver=$EAP_SERVER_NAME

#sleep 5

#$EAP_HOME/bin/jboss-cli.sh --connect --command="/subsystem=undertow/configuration=filter/expression-filter=requestDumperExpression:add(expression='dump-request')"
#$EAP_HOME/bin/jboss-cli.sh --connect --command="/subsystem=undertow/server=default-server/host=default-host/filter-ref=requestDumperExpression:add"
