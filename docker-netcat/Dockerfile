FROM alpine:latest

RUN apk update && apk add netcat-openbsd

EXPOSE 1567

CMD ["nc", "-v", "-l", "1567"]
