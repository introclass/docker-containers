FROM alpine
MAINTAINER lijiaocn <lijiaocn@foxmail.com>

WORKDIR   /root

ADD ./entrypoint.sh  /root

USER root

ENTRYPOINT ["/bin/sh", "./entrypoint.sh"]
