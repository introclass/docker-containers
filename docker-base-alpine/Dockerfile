FROM alpine:latest

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories
RUN apk update && apk upgrade
RUN apk add --no-cache tzdata
RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
