#!/bin/sh

. ./env.sh 

$JBOSS_HOME/bin/jboss-cli.sh --connect --controller=$CONTROLLER_IP:$CONTROLLER_PORT --command=:shutdown
