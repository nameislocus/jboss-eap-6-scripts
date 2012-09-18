#!/bin/sh

. ./env.sh 

export JAVA_OPTS=" $JAVA_OPTS -Djava.awt.headless=false "

echo "$JBOSS_HOME/bin/jboss-cli.sh  --controller=$DOMAIN_MASTER_ADDR:$DOMAIN_MASTER_PORT --connect $@"
$JBOSS_HOME/bin/jboss-cli.sh  --controller=$DOMAIN_MASTER_ADDR:$DOMAIN_MASTER_PORT --connect $@
