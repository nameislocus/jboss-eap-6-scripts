#!/bin/sh

. ./env.sh

#JAVA_OPTS="$JAVA_OPTS -Djboss.domain.config.user.dir=../domain/configuration"
JAVA_OPTS="$JAVA_OPTS -Djboss.server.config.user.dir=$DOMAIN_BASE/$SERVER_NAME/configuration "

$JBOSS_HOME/bin/add-user.sh $@
