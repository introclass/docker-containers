FROM alpine:latest

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories
RUN apk update
RUN apk add --no-cache tzdata iptables curl bash

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
