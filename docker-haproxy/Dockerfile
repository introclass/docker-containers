FROM alpine
MAINTAINER lijiaocn <lijiaocn@foxmail.com>

WORKDIR   /root

RUN apk update && apk add haproxy

ADD ./entrypoint.sh  /root
ADD ./haproxy.cfg    /root

EXPOSE 5000
EXPOSE 5001
EXPOSE 8889

ENTRYPOINT ["/bin/sh", "./entrypoint.sh"]
