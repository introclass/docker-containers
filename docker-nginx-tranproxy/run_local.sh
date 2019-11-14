#! /bin/sh
#
# run_local.sh
# Copyright (C) 2019 lijiaocn <lijiaocn@foxmail.com wechat:lijiaocn>
#
# Distributed under terms of the GPL license.
#

docker rm -f nginx-tranproxy
docker run -itd --cap-add NET_ADMIN --name nginx-tranproxy lijiaocn/nginx-tranproxy:0.1 \
	-P 80 \
	-P 8080 \
	-H tranproxy:true \
	-H tranproxy2:true \
	-N 114.114.114.114 \
	-N 8.8.8.8 \
	--Set-Forwarded-For default \
	--Set-Client-Hostname default \
	-- tail -f /dev/null

docker logs nginx-tranproxy
