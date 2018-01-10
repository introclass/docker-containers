FROM harbor.enncloud.cn/lijiaob/centos:7
MAINTAINER lijiaocn <lijiaocn@foxmail.com>

WORKDIR   /root

RUN yum install -y gcc 

ADD ./oom.c          /root
ADD ./entrypoint.sh  /root

RUN gcc -o oom oom.c

USER root

ENTRYPOINT ["/bin/sh", "./entrypoint.sh"]
