---
layout: default
title: README
author: lijiaocn
createdate: 2017/03/24 10:49:47
changedate: 2017/03/24 10:50:38
categories:
tags:
keywords:
description: 

---

## 摘要

制作一个镜像，用这个镜像创建的容器运行的时候，对外提供ssh登录功能。

如果这个容器运行在国外，那么就可以利用sshd的转发功能成功翻墙。

## 目录说明

	SSHProxy/
	|-- build.sh             //制作镜像
	|-- Dockerfile           //dockerfile
	|-- entrypoint.sh        //entrypoint
	|-- pam.d                //注释掉了: session required pam_loginuid.so          
	|   |-- login
	|   |-- remote
	|   `-- sshd
	|-- Readme.md
	`-- sshd_config          //sshd的配置文件

## 事项0 -- entrypoint.sh

entrypoint.sh首先从环境变量${ROOTPASS}中读取root的密码, 然后设置root的密码, 这样以后可以通过密码进行ssh登录。

然后启动sshd服务, 日志保存在容器的/root/sshd_log文件中, 配置文件是/root/sshd_config。

最后entrypoint.sh进入睡眠，不然容器会因为entrypoint.sh运行结束而停止。

## 事项1 -- pam.d/中的文件注释掉了pam_loginuid.so

如果没有注释掉pam_loginuid.so，ssh登录时可能会遇到下面的提示:

	Cannot make/remove an entry for the specified session

sshd日志中会有如下记录:

	Accepted password for root from 172.17.42.1 port 35077 ssh2
	syslogin_perform_logout: logout() returned an error
	Received disconnect from 172.17.42.1: 11: disconnected by user)

[文章](http://www.linuxweblog.com/blogs/sandip/20090203/setloginuid-failed-opening-loginuid)说是因为内核没有enabled AUDIT, 需要重新编译内核。但可以通过把下面的一行注释掉，规避这个问题:

	session required        pam_loginuid.so

>注意: 需要把/etc/pam.d/目录中login、remote、sshd三个文件中的这一行全部注释掉。网上很多解决方法中只处理了sshd文件，这样是不行的, 需要三个文件全部处理。

## 文献

1. http://www.linuxweblog.com/blogs/sandip/20090203/setloginuid-failed-opening-loginuid
