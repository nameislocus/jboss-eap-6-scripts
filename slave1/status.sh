#!/bin/sh

. ./env.sh 

ps -ef | grep java | grep "SERVER=$SERVER_NAME "
