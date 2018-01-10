---
layout: default
title: README
author: lijiaocn
createdate: 2017/03/24 10:49:47
changedate: 2017/04/27 13:28:17
categories:
tags:
keywords:
description: 

---

## 摘要

在[docker-sshproxy](https://github.com/lijiaocn/docker-sshproxy)的基础上添加了kubectl，用于测试。

需要手动设置环境变量，例如:

	export KUBERNETES_SERVICE_HOST=10.0.0.1
	export KUBERNETES_SERVICE_PORT=443

环境变量的取值可以在env.init中找到:

	for i in `cat env.init`;do export  $i;done
