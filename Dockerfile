# Используем официальный образ Nginx с поддержкой PHP
FROM ubuntu:22.04

LABEL       author="SIXSIXSIX666" maintainer="deathdeath335@gmail.com"

RUN 		apt-get update -y \
 			&& useradd -d /home/container -m container

# Set the locale
RUN apt-get -y install locales
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 
 
USER container
ENV  USER=container HOME=/home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
