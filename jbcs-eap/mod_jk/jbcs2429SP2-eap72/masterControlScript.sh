#!/bin/bash

export JBCS_HOME="/opt/rh/jbcs-httpd24-2.4/httpd"
export EAP_HOME="/opt/eap/jboss-eap-7.2"

$JBCS_HOME/sbin/apachectl start

$EAP_HOME/bin/standalone.sh -c standalone-ha.xml -Dserver.name=myservera -Djboss.node.name=myservera \
-Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0 \
-Djboss.socket.binding.port-offset=0 \
-Dserver=myservera &

sleep 5

$EAP_HOME/bin/jboss-cli.sh --connect --command="/subsystem=undertow/configuration=filter/expression-filter=requestDumperExpression:add(expression='dump-request')"
$EAP_HOME/bin/jboss-cli.sh --connect --command="/subsystem=undertow/server=default-server/host=default-host/filter-ref=requestDumperExpression:add"

##################################################
# Here follows whatever additional service you
# want to run in this image
##################################################
$JBCS_HOME/appStarterScript.sh
