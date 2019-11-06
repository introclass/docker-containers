#!/bin/sh

NameServers(){
	cat /etc/resolv.conf |grep nameserver |awk '{print $2}'
}

NginxStart(){
	mkdir -p /run/nginx
	chown nginx:nginx /run/nginx
	nginx
}

SetIptables(){
	iptables -t nat -N LOCAL_PROXY
	iptables -t nat -A LOCAL_PROXY -m owner --uid-owner nginx -j RETURN
	iptables -t nat -A LOCAL_PROXY -p tcp -m tcp --dport 8080 -j REDIRECT --to-ports 8080
	iptables -t nat -A OUTPUT -p tcp -j LOCAL_PROXY
}

nameserver=`NameServers`
echo $nameserver

cat > /etc/nginx/conf.d/default.conf <<EOF
server {
    listen       8080;
    server_name  localhost;

    location / {
        resolver $nameserver;
        proxy_pass  http://\$host:8080\$request_uri;
        proxy_set_header tranproxy "true";
    }
}
EOF

NginxStart
SetIptables

while true;do
	sleep 10
	echo "running@`date`"
done
