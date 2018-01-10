FROM docker.io/centos:7
MAINTAINER lijiaocn <lijiaocn@foxmail.com>

WORKDIR   /root

RUN yum install -y openssh-clients && yum install -y expect && yum install -y openssh-server && yum install -y passwd

ADD ./entrypoint.sh  /root/
ADD ./sshd_config    /root/
ADD ./pam.d/*        /etc/pam.d/


EXPOSE 22
EXPOSE 1111

ENTRYPOINT ["bash", "/root/entrypoint.sh" ]

USER root

ENV ROOTPASS=dd13427
ENV SSHPROXYPASS=dd13427
ENV SSHPROXYADDR=172.17.0.1
ENV SSHPROXYPORT=22
