---
layout: default
title: README
createdate: 2016/04/04 15:40:35
changedate: 2017/09/06 16:18:30

---

## 摘要

webshell，主要用来做测试。

## 说明

编译:

	make build

打镜像:

	make image

启动镜像:

	make run

监听80端口, 提供webshell服务。如图：

![webshell](./webshell.jpg)

## url

/:

	webshell 

/ping:

	health check

/cookie?v=:

	设置cookie，cookie名称为hostname。

## 文献
