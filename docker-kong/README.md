# 使用Kong的源代码制作Kong镜像

直接通过Kong的源代码生成镜像，可以简化开发测试过程，避免繁琐的打包过程，[API网关Kong学习笔记（二十）：Kong 1.0.3的安装部署和与Kubernetes的对接](https://www.lijiaocn.com/%E9%A1%B9%E7%9B%AE/2019/03/05/kong-1-0-3-install.html)中使用了这里的文件。

## 制作基础镜像

	make base

base镜像基于CentOS7，对应的Dockerfile是Dockerfile.base，在里面安装了kong依赖的openresty以及安装kong时用到的工具。

## 制作Kong镜像

	make prod

使用本目录中的Dockerfile，将Kong的源代码拷贝到base镜像中，在base镜像中完成安装。

## 存在的问题

base镜像基于CentOS7，并且在里面安装了gcc等工具，最后生成的Kong镜像比较大（400多兆），Kong官方提供的基于alpine镜像不到100兆。

## 使用方法

初始化：

```sh
docker run -it --rm $enviroments \
-e KONG_PREFIX=/usr/local/kong
-e ONG_DATABASE=postgres     
-e KONG_PG_HOST=127.0.0.1   
-e KONG_PG_PORT=5432          
-e KONG_PG_USER=kong          
-e KONG_PG_PASSWORD=kong-dev  
-e KONG_PG_DATABASE=kong      
-e KONG_PROXY_LISTEN='0.0.0.0:8000, 0.0.0.0:8443 ssl'  \
-e KONG_ADMIN_LISTEN='0.0.0.0:8001, 0.0.0.0:8444 ssl'  \
lijiaocn/kong:1.0.3  kong migrations bootstrap
```

启动：

```sh
docker run -it --rm $enviroments \
-e KONG_PREFIX=/usr/local/kong
-e ONG_DATABASE=postgres     
-e KONG_PG_HOST=127.0.0.1   
-e KONG_PG_PORT=5432          
-e KONG_PG_USER=kong          
-e KONG_PG_PASSWORD=kong-dev  
-e KONG_PG_DATABASE=kong      
-e KONG_PROXY_LISTEN='0.0.0.0:8000, 0.0.0.0:8443 ssl'  \
-e KONG_ADMIN_LISTEN='0.0.0.0:8001, 0.0.0.0:8444 ssl'  \
-p 8000:8000 -p 8443:8443 -p 8001:8001 -p 8444:8444    \
lijiaocn/kong:1.0.3
```
