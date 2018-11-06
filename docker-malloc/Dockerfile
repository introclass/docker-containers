FROM centos:7
MAINTAINER lijiaocn <lijiaocn@foxmail.com>

WORKDIR   /root

RUN yum install -y gcc 

ADD ./malloc.c       /root
ADD ./entrypoint.sh  /root

RUN gcc -o malloc ./malloc.c

USER root

ENTRYPOINT ["/bin/sh", "./entrypoint.sh"]
