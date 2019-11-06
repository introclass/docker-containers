FROM alpine
MAINTAINER lijiaocn <lijiaocn@foxmail.com>

WORKDIR   /root

RUN apk update 
RUN apk add -u nginx iptables curl --no-cache

ADD ./entrypoint.sh /root/

EXPOSE 80

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
