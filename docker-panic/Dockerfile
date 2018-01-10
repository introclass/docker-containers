FROM centos:7
MAINTAINER lijiaocn <lijiaocn@foxmail.com>

WORKDIR   /root

RUN yum install -y gcc 

ADD ./panic.c       /root/

RUN gcc -o panic panic.c

USER root

ENTRYPOINT ["/root/panic"]
