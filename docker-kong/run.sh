#!/bin/sh
#
# run.sh
# Copyright (C) 2019 lijiaocn <lijiaocn@foxmail.com>
#
# Distributed under terms of the GPL license.

enviroments="
-e KONG_PREFIX=/usr/local/kong
-e ONG_DATABASE=postgres     
-e KONG_PG_HOST=127.0.0.1   
-e KONG_PG_PORT=5432          
-e KONG_PG_USER=kong          
-e KONG_PG_PASSWORD=kong-dev  
-e KONG_PG_DATABASE=kong      
"

# 初始化数据库
docker run -it --rm $enviroments \
-e KONG_PROXY_LISTEN='0.0.0.0:8000, 0.0.0.0:8443 ssl'  \
-e KONG_ADMIN_LISTEN='0.0.0.0:8001, 0.0.0.0:8444 ssl'  \
lijiaocn/kong:1.0.3  kong migrations bootstrap


# 启动kong
docker run -it --rm $enviroments \
-e KONG_PROXY_LISTEN='0.0.0.0:8000, 0.0.0.0:8443 ssl'  \
-e KONG_ADMIN_LISTEN='0.0.0.0:8001, 0.0.0.0:8444 ssl'  \
-p 8000:8000 -p 8443:8443 -p 8001:8001 -p 8444:8444    \
lijiaocn/kong:1.0.3
