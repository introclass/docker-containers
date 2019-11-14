FROM alpine
MAINTAINER lijiaocn <lijiaocn@foxmail.com>

WORKDIR   /root

RUN apk update 
RUN apk add -u nginx iptables curl bash --no-cache

ADD ./entrypoint.sh /root/
ADD ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
