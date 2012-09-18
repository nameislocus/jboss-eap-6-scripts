#!/bin/sh

java -cp jgroups-3.0.14.Final.jar org.jgroups.tests.McastReceiverTest -mcast_addr 224.10.10.10 -port 5555
