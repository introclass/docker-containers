FROM centos:7
MAINTAINER lijiaocn <lijiaocn@foxmail.com>

WORKDIR   /root

ADD ./entrypoint.sh  /root

USER root

ENTRYPOINT ["/bin/bash", "./entrypoint.sh"]
