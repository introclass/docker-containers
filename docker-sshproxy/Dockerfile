FROM docker.io/centos:7
MAINTAINER lijiaocn <lijiaocn@foxmail.com>

WORKDIR   /root

RUN yum install -y openssh-server && yum install -y passwd

ADD ./entrypoint.sh  /root/
ADD ./sshd_config    /root/
ADD ./pam.d/*        /etc/pam.d/

EXPOSE 22

ENTRYPOINT ["bash", "/root/entrypoint.sh" ]

USER root

ENV ROOTPASS=123456
RUN yum install -y net-tools iproute
