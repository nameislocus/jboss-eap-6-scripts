#!/bin/sh

. ./env.sh 

ps -ef | grep java | grep "SERVER=$SERVER_NAME " | awk {'print "kill -9 " $2'} | sh -x
