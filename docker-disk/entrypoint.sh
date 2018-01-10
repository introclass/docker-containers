#!/bin/sh

sleep 10

dd if=/dev/zero of=/test.dat bs=1M count=1000000 &

while true;do
	sleep 1
	echo "running@`date`"
	ls -lh /test.dat
done
