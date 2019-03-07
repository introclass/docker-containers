FROM lijiaocn/openresty:centos
LABEL maintainer="https://www.lijiaocn.com"

ENV KONG_VERSION 1.0.3

COPY ./kong  /kong
COPY ./kong.sh /kong.sh
COPY ./kong.conf /kong.conf
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN useradd --uid 1337 kong && pushd /kong && make install && popd && chmod +x /kong.sh && ln -s  /kong.sh /usr/bin/kong

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8000 8443 8001 8444

STOPSIGNAL SIGTERM

CMD ["kong", "docker-start"]
