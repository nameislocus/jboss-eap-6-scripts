#!/bin/sh

. ./env.sh 

echo "======================================================="
echo " JMX URL : service:jmx:remoting-jmx://$MGMT_ADDR:$CONTROLLER_PORT"
echo "======================================================="
$JBOSS_HOME/bin/jconsole.sh
