#!/bin/sh
mkdir -p /run/nginx
chown nginx:nginx /run/nginx

nginx
while true;do
	sleep 10
	echo "running@`date`"
done
