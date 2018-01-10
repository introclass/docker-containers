FROM centos:7
MAINTAINER lijiaocn <lijiaocn@foxmail.com>

WORKDIR  /root
ADD ./bin/dnsperf /root/
ADD ./domains.txt /root/
ADD ./entrypoint.sh  /root

ENV NAMESERVER  8.8.8.8
ENV PORT 53
ENV CURRENT 100
ENV MAXQUERY 1000

ENTRYPOINT ["/bin/sh", "./entrypoint.sh"]
