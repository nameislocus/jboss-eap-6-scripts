#!/bin/sh

. ./env.sh 

echo "======================================================="
echo " JMX URL : service:jmx:remoting-jmx://$MGMT_ADDR:4447 (+OFFSET)"
echo "======================================================="


JBOSS_MODULEPATH="$JBOSS_HOME/modules"

CLASSPATH=$JAVA_HOME/lib/jconsole.jar
CLASSPATH=$CLASSPATH:$JAVA_HOME/lib/tools.jar

#MODULES="org/jboss/remoting3/remoting-jmx org/jboss/remoting3 org/jboss/logging org/jboss/xnio org/jboss/xnio/nio org/jboss/sasl org/jboss/marshalling org/jboss/marshalling/river org/jboss/as/cli org/jboss/staxmapper org/jboss/as/protocol org/jboss/dmr org/jboss/as/controller-client org/jboss/threads org/jboss/as/controller"
MODULES="org/jboss/remoting3/remoting-jmx org/jboss/remoting3 org/jboss/logging org/jboss/xnio org/jboss/xnio/nio org/jboss/sasl org/jboss/marshalling org/jboss/marshalling/river org/jboss/staxmapper org/jboss/as/protocol org/jboss/dmr org/jboss/as/controller-client org/jboss/threads org/jboss/as/controller"

for MODULE in $MODULES
do
    for JAR in `cd "$JBOSS_MODULEPATH/$MODULE/main/" && ls -1 *.jar`
    do
        CLASSPATH="$CLASSPATH:$JBOSS_MODULEPATH/$MODULE/main/$JAR"
    done
done


echo CLASSPATH $CLASSPATH

jconsole -J-Djava.class.path="$CLASSPATH"

#$JBOSS_HOME/bin/jconsole.sh
