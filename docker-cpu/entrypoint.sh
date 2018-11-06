#!/bin/sh

sleep 10

for i in `seq 1 $(cat /proc/cpuinfo |grep "physical id" |wc -l)`; do dd if=/dev/zero of=/dev/null & done

while true;do
	sleep 1
	echo "running@`date`"
	ls -lh /test.dat
done
