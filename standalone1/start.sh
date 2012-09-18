#!/bin/sh

DATE=`date +%Y%m%d%H%M%S`

. ./env.sh

PID=`ps -ef | grep java | grep "=$SERVER_NAME " | awk '{print $2}'`
echo $PID

if [ e$PID != "e" ]
then
    echo "JBoss SERVER - $SERVER_NAME is already RUNNING..."
    exit;
fi

UNAME=`id -u -n`
if [ e$UNAME != "e$JBOSS_USER" ]
then
    echo "Use $JBOSS_USER account to start JBoss SERVER - $SERVER_NAME..."
    exit;
fi

echo $JAVA_OPTS

if [ ! -d "./nohup" ];
then
    mkdir nohup
fi  

mv $SERVER_NAME.out ./nohup/$SERVER_NAME.out.$DATE

#nohup $JBOSS_HOME/bin/standalone.sh -DSERVER=$SERVER_NAME -b $BIND_ADDR -u $MULTICAST_ADDR -P=$DOMAIN_BASE/$SERVER_NAME/env.properties -c $CONFIG_FILE >> $SERVER_NAME.out &
nohup $JBOSS_HOME/bin/standalone.sh -DSERVER=$SERVER_NAME -P=$DOMAIN_BASE/$SERVER_NAME/env.properties -c $CONFIG_FILE >> $SERVER_NAME.out &

if [ e$1 = "enotail" ]
then
    echo "Starting... $SERVER_NAME"
    exit;
fi

#tail -f log/server.log
tail -f $SERVER_NAME.out
