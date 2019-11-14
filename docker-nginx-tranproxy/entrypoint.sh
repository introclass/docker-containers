#!/bin/bash

declare -a PORTS
HEADERS=""
NAMESERVER=""
ip=""
hostname=""

Help(){
	echo "Usage: $0"
	echo "-h/--help        print this usage"
	echo "-P/--port port   proxy traffic to this port, this option can repeat"
	echo "                 eg: -P 80 -P 8080"
	echo "-H/--header      headers add by tranproxy, this option can repeat"
	echo "                 eg: -H header1:value1 -H header2:value2"
	echo "-N/--nameserver  nameserver used by tranproxy, this option can repeat"
	echo "                 eg: -N 114.114.114.114 -N 8.8.8.8"
	echo "                 default value is nameservers in /etc/resolve.conf"
	echo ""
	echo "--Set-Forwarded-For   tranproxy will add X-Forwarded-For header"
	echo "                      if value is not provided, use env PODIP"
	echo "                      if env PODIP is empty, use primary nic ip"
	echo "--Set-Client-Hostname tranproxy will add X-Client-Hostname header"
	echo "                      if value is not provided, get by command hostname"
	echo "-- cmd arg arg...     execute cmd at last, may be empty"
}

NameServers(){
	cat /etc/resolv.conf |grep nameserver |awk '{print $2}'
}

PrimaryIP(){
	local nic=`ip route |grep default |awk '{print $5}'`
	ip addr show $nic |grep inet|awk '{print $2}' |grep -Eo '([0-9]*\.){3}[0-9]*'
}

NginxStart(){
	mkdir -p /run/nginx
	chown nginx:nginx /run/nginx
	nginx
}

SetIptables(){
	iptables -t nat -N LOCAL_PROXY
	iptables -t nat -A LOCAL_PROXY -m owner --uid-owner nginx -j RETURN

	if [[ ${#PORTS[@]} == 0 ]];then
		port=80
		iptables -t nat -A LOCAL_PROXY -p tcp -m tcp --dport $port -j REDIRECT --to-ports $port
	else
		for i in ${!PORTS[@]};do
			port=$i
			iptables -t nat -A LOCAL_PROXY -p tcp -m tcp --dport $port -j REDIRECT --to-ports $port
		done
	fi

	iptables -t nat -A OUTPUT -p tcp -j LOCAL_PROXY
}


#$1: PORT
ServerConfig(){
port=$1
cat >> /etc/nginx/conf.d/default.conf <<EOF
server {
    listen       127.0.0.1:$port;
    server_name  localhost;

    location / {
        access_log /var/log/nginx/access.$port.log tranproxy;
        resolver $NAMESERVER;
        proxy_pass  http://\$host:$port\$request_uri;
        $HEADERS
    }
}
EOF
}

echo "############# Start ##########"
echo `date`
while :; do
	case $1 in
		-h|-\?|--help)
			help
			exit
			;;
		-P|--port)
			if [[ $2 == "" || ${2:0:1} == "-" ]];then
				echo 'ERROR: "-P/--port" requires a non-empty option argument.' 2>&1
				exit 1
			fi
			PORTS["$2"]=$2
			shift
			;;
		-H|--header)
			if [[ $2 == "" || ${2:0:1} == "-" ]];then
				echo 'ERROR: "-H/--header" requires a non-empty option argument.' 2>&1
				exit 1
			fi
			read name value <<< "${2//:/ }";
			HEADERS="$HEADERS\n\tproxy_set_header $name \"$value\";"
			shift
			;;
		-N|--nameserver)
			if [[ $2 == "" || ${2:0:1} == "-" ]];then
				echo 'ERROR: "-N/--nameserver" requires a non-empty option argument.' 2>&1
				exit 1
			fi
			NAMESERVER="$NAMESERVER $2"
			shift
			;;
		--Set-Forwarded-For)
			if [[ $2 == "" || ${2:0:1} == "-" ]];then
				echo 'ERROR: "--Set-Forwarded-For" requires a non-empty option argument, support "default".' 2>&1
				exit 1
			fi
			if [[ $2 == "default" ]];then
				if [ "$PODIP" ];then
					IP=$PODIP
					HEADERS="$HEADERS\n\tproxy_set_header X-Forwarded-For \"$IP\";"
				else
					IP=`PrimaryIP`
					HEADERS="$HEADERS\n\tproxy_set_header X-Forwarded-For \"$IP\";"
				fi
			else
				IP=$2
				HEADERS="$HEADERS\n\tproxy_set_header X-Forwarded-For \"$IP\";"
			fi
			shift
			;;
		--Set-Client-Hostname)
			if [[ $2 == "" || ${2:0:1} == "-" ]];then
				echo 'ERROR: "--Set-Client-Hostname" requires a non-empty option argument, support "default".' 2>&1
				exit 1
			fi
			if [[ $2 == "default" ]];then
				host=`hostname`
				HEADERS="$HEADERS\n\tproxy_set_header X-Client-Hostname \"$host\";"
			else
				host=$2
				HEADERS="$HEADERS\n\tproxy_set_header X-Client-Hostname \"$host\";"
			fi
			shift
			;;
		-|--)
			shift
			break
			;;
		*)
			break
			;;
	esac
	shift
done

echo "############# Setting: Proxy Port ##########"
echo ${!PORTS[@]}

if [[ $NAMESERVER == "" ]];then
	NAMESERVER=`NameServers`
fi
echo "############# Setting: Proxy Nameserver ##########"
echo $NAMESERVER

HEADERS=`echo -e $HEADERS`
echo "############# Setting: Set Headers ##########"
echo $HEADERS

echo "" >/etc/nginx/conf.d/default.conf
if [[ ${#PORTS[@]} == 0 ]];then
	echo "use default port: 80"
	ServerConfig 80
else
	for i in ${!PORTS[@]};do
		ServerConfig $i
	done
fi
echo "############# Nginx Final Config ##########"
echo "/etc/nginx/conf.d/default.conf is"
cat /etc/nginx/conf.d/default.conf

echo "############# NginxStart ##########"
NginxStart
echo "############# SetIptables ##########"
SetIptables

if [ "$*" ];then
	echo "############# ExecuteCmd ##########"
	echo "execute cmds: $*"
	$*
fi

while true;do
	sleep 10
	echo "running@`date`"
done
