FROM alpine
MAINTAINER lijiaocn <lijiaocn@foxmail.com>

WORKDIR   /root

RUN apk update && apk add iperf

EXPOSE 5001

ENTRYPOINT ["/usr/bin/iperf", "-p", "5001", "-s" ]
