FROM alpine
MAINTAINER lijiaocn <lijiaocn@foxmail.com>

WORKDIR   /root

RUN apk update && apk add nginx

ADD ./entrypoint.sh /root/
ADD ./conf.d/default.conf /etc/nginx/conf.d/
ADD ./index.html /var/www/localhost/htdocs/

EXPOSE 80

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
