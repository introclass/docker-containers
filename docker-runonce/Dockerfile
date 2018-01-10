FROM docker.io/centos:7
MAINTAINER lijiaocn <lijiaocn@foxmail.com>

WORKDIR   /root
ADD ./entrypoint.sh  /root/
ENTRYPOINT ["bash", "/root/entrypoint.sh" ]
USER root
