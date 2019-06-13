FROM alpine:latest
MAINTAINER lijiaocn <lijiaocn@foxmail.com>

WORKDIR   /root

ADD ./Server/Server  /root/
ADD ./Server/webshell.gtpl  /root/

CMD ["./Server"]

ENV IDLE_TIMEOUT 60

EXPOSE 8080
