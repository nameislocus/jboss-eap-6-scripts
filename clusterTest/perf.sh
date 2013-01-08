#!/bin/sh

ARGV="$*"
if [ "x$ARGV" = "x" ] ; then
    echo "Usage : perf.sh <host_ip_address> <name>"
    echo " ex) ./perf.sh 123.123.123.123 NodeA"
    exit 0;  
fi

echo java -cp jgroups-3.2.5.Final.jar -Djava.net.preferIPv4Stack=true -Djgroups.bind_addr=$1 org.jgroups.tests.perf.MPerf -name $2
java -cp jgroups-3.2.5.Final.jar -Djava.net.preferIPv4Stack=true -Djgroups.bind_addr=$1 org.jgroups.tests.perf.MPerf -name $2

