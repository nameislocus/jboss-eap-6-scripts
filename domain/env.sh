#!/bin/sh

DATE=`date +%Y%m%d%H%M%S`

##### JBOSS Directory Setup #####
export JBOSS_HOME=/home/jjeon/jboss/eap/jboss-eap-6.0
export DOMAIN_BASE=/home/jjeon/jboss/eap/domains.600
export SERVER_NAME=domain

export DOMAIN_BASE_DIR=$DOMAIN_BASE/$SERVER_NAME

##### Configration File #####
export DOMAIN_CONFIG_FILE=domain.xml
export HOST_CONFIG_FILE=host-master.xml

export HOST_NAME=master
export NODE_NAME=$SERVER_NAME

export JBOSS_USER=jjeon

##### Bind Address #####
export BIND_ADDR=0.0.0.0

export MULTICAST_ADDR=230.1.0.1
export MULTICAST_PORT=55200
export JMS_MULTICAST_ADDR=231.7.0.1
export MODCLUSTER_MULTICAST_ADDR=224.0.1.105

export MGMT_ADDR=127.0.0.1
export DOMAIN_MASTER_ADDR=127.0.0.1
export DOMAIN_MASTER_PORT=9999

export HOST_CONTROLLER_PORT=9999

export LAUNCH_JBOSS_IN_BACKGROUND=true

##### JBoss System module and User module directory #####
export JBOSS_MODULEPATH=$JBOSS_HOME/modules:$JBOSS_HOME/modules.ext

# JVM Options : Server
export JAVA_OPTS="-server $JAVA_OPTS"

# JVM Options : Memory 
export JAVA_OPTS=" $JAVA_OPTS -Xms64m -Xmx128m -XX:MaxPermSize=256m"

export JAVA_OPTS=" $JAVA_OPTS -XX:+PrintGCTimeStamps "
export JAVA_OPTS=" $JAVA_OPTS -XX:+PrintGCDetails "
export JAVA_OPTS=" $JAVA_OPTS -Xloggc:log/gc_$DATE.log "
export JAVA_OPTS=" $JAVA_OPTS -XX:+UseParallelGC "
#export JAVA_OPTS=" $JAVA_OPTS -XX:+UseConcMarkSweepGC "
export JAVA_OPTS=" $JAVA_OPTS -XX:+ExplicitGCInvokesConcurrent "
export JAVA_OPTS=" $JAVA_OPTS -XX:-HeapDumpOnOutOfMemoryError "

# Linux Large Page Setting
#export JAVA_OPTS=" $JAVA_OPTS  -XX:+UseLargePages "

#export JAVA_OPTS=" $JAVA_OPTS -verbose:gc"
export JAVA_OPTS=" $JAVA_OPTS -Djava.net.preferIPv4Stack=true"
export JAVA_OPTS=" $JAVA_OPTS -Dorg.jboss.resolver.warning=true"
export JAVA_OPTS=" $JAVA_OPTS -Dsun.rmi.dgc.client.gcInterval=3600000 "
export JAVA_OPTS=" $JAVA_OPTS -Dsun.rmi.dgc.server.gcInterval=3600000"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.modules.system.pkgs=org.jboss.byteman"
export JAVA_OPTS=" $JAVA_OPTS -Djava.awt.headless=true"

export JAVA_OPTS=" $JAVA_OPTS -Djboss.domain.default.config=$DOMAIN_CONFIG_FILE"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.host.default.config=$HOST_CONFIG_FILE"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.domain.base.dir=$DOMAIN_BASE_DIR"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.domain.master.address=$DOMAIN_MASTER_ADDR"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.domain.master.port=$DOMAIN_MASTER_PORT"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.node.name=$NODE_NAME"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.bind.address.management=$MGMT_ADDR"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.bind.address=$BIND_ADDR"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.management.native.port=$HOST_CONTROLLER_PORT"
#export JAVA_OPTS=" $JAVA_OPTS -Djava.nio.channels.spi.SelectorProvider=sun.nio.ch.KQueueSelectorProvider"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.default.multicast.address=$MULTICAST_ADDR"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.default.multicast.port=$MULTICAST_PORT"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.messaging.group.address=$JMS_MULTICAST_ADDR"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.modcluster.multicast.address=$MODCLUSTER_MULTICAST_ADDR"
#export JAVA_OPTS=" $JAVA_OPTS -Djboss.default.jgroups.stack=tcp"


echo "================================================"
echo "JBOSS_HOME=$JBOSS_HOME"
echo "DOMAIN_BASE=$DOMAIN_BASE"
echo "SERVER_NAME=$SERVER_NAME"
echo "DOMAIN_CONFIG_FILE=$DOMAIN_CONFIG_FILE"
echo "HOST_CONFIG_FILE=$HOST_CONFIG_FILE"
echo "DOMAIN_CONTROLLER=$DOMAIN_MASTER_ADDR:$DOMAIN_MASTER_PORT"
echo "================================================"
