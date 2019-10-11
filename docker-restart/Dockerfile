FROM centos:7
MAINTAINER lijiaocn <lijiaocn@foxmail.com>

WORKDIR   /root

ADD ./entrypoint.sh       /root/

USER root
ENV INTERNAL=15

ENTRYPOINT ["/bin/bash", "/root/entrypoint.sh"]
