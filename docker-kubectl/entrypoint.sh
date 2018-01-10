#!/bin/bash
passwd <<EOF
${ROOTPASS}
${ROOTPASS}
EOF

env >/root/env.init

/usr/sbin/sshd-keygen
/usr/sbin/sshd -E /root/sshd_log  -f /root/sshd_config -p 22

while true;
do 
	sleep 60; 
	echo "running @ " `date`
done
