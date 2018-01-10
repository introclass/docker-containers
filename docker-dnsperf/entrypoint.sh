#!/bin/bash

./dnsperf -s ${NAMESERVER} -p ${PORT} -c ${CURRENT} -Q ${MAXQUERY} -d ./domains.txt
while true
do
	echo "running@`date`"
	sleep 10
done
