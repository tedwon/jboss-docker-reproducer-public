#!/bin/bash

export JBCS_HOME="/opt/rh/jbcs-httpd24-2.4/httpd"
export EAP_HOME="/opt/eap/jboss-eap-6.4.19"

$JBCS_HOME/sbin/apachectl start

$EAP_HOME/bin/standalone.sh -c standalone-ha.xml -Dserver.name=myservera -Djboss.node.name=myservera \
-Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0 \
-Djboss.socket.binding.port-offset=0 \
-Dserver=myservera

# sleep 5

# $EAP_HOME/bin/jboss-cli.sh --connect --command="/subsystem=web/valve=RequestDumperValve:add(class-name=org.apache.catalina.valves.RequestDumperValve,module=org.jboss.as.web,enabled=true)"

##################################################
# Here follows whatever additional service you
# want to run in this image
##################################################
# $JBCS_HOME/appStarterScript.sh
