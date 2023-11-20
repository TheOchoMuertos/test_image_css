FROM alpine:latest

LABEL author="SIXSIXSIX666" maintainer=""

RUN apk --no-cache update
RUN apk --no-cache upgrade
RUN apk --no-cache add curl ca-certificates nginx php82 php82-fpm php82-opcache php82-gd php82-zlib php82-curl

RUN adduser -D container
RUN chown container:container -R /home/container

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

ADD ./entrypoint.sh /image/css/entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]