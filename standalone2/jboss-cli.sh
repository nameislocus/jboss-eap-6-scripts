#!/bin/sh

. ./env.sh 

export JAVA_OPTS=" -Djava.awt.headless=false $JAVA_OPTS"

$JBOSS_HOME/bin/jboss-cli.sh  --controller=$CONTROLLER_IP:$CONTROLLER_PORT --connect $@
