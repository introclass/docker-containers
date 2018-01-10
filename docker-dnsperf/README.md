---
layout: default
title: README
author: lijiaocn
createdate: 2017/08/02 16:28:08
changedate: 2017/08/02 16:34:15

---

dnsperf来自[https://github.com/cobblau/dnsperf](https://github.com/cobblau/dnsperf)

生成cscope符号文件:

	./cscope.sh

目标域名:

	文件domains.txt: 

编译:

	make compile  

编译得到的目标文件:

	./bin目录中。

打包到容器:

	make image
