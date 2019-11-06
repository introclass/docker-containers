#! /bin/sh
#
# run_local.sh
# Copyright (C) 2019 lijiaocn <lijiaocn@foxmail.com wechat:lijiaocn>
#
# Distributed under terms of the GPL license.
#

docker rm -f nginx-tranproxy
docker run --rm -itd    \
	--cap-add NET_ADMIN \
	--name nginx-tranproxy lijiaocn/nginx-tranproxy:0.1
