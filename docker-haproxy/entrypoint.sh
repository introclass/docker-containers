#!/bin/sh

haproxy -f  ./haproxy.cfg
while true;do
	sleep 10
	echo "running@`date`"
done
