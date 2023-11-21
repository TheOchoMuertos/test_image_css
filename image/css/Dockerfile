FROM        ubuntu:22.04

LABEL       author="SIXSIXSIX666" maintainer=""

RUN         dpkg --add-architecture i386 \
            && apt-get update \
            && apt-get upgrade -y \
            && apt-get install -y ca-certificates git python3-apt xterm xz-utils zenity wget dbus-x11 locales tar curl gcc g++ lib32gcc-s1 libgcc1 libcurl4-gnutls-dev:i386 libssl3:i386 libcurl4:i386 libtinfo5 libtinfo5:i386 lib32z1 lib32stdc++6 libncurses5:i386 libcurl3-gnutls:i386 iproute2 gdb libsdl1.2debian libfontconfig telnet net-tools netcat-traditional xvfb psmisc zip unzip \
            && useradd -m -d /home/container container

RUN         localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV         LANG en_US.utf8
 
USER        container
ENV         HOME /home/container
WORKDIR     /home/container

COPY        ./image/css/entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
