FROM docker.io/centos:7
MAINTAINER lijiaocn <lijiaocn@foxmail.com>

WORKDIR   /root

RUN yum install -y net-tools iproute telnet which

ADD ./entrypoint.sh  /root/
ENTRYPOINT ["bash", "/root/entrypoint.sh" ]

USER root
