#!/bin/sh

. ./env.sh 

$JBOSS_HOME/bin/jboss-cli.sh --connect --controller=$DOMAIN_MASTER_IP:$DOMAIN_MASTER_PORT --command=:shutdown
