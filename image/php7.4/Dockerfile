FROM php:7.4-fpm

# Устанавливаем необходимые зависимости
RUN apt-get update && apt-get install -y \
    nginx \
    git \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libzip-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd curl zip

# Устанавливаем MySQL 5.7
RUN apt-get install -y software-properties-common && \
    apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc' && \
    add-apt-repository 'deb [arch=amd64,arm64,ppc64el] https://mariadb.mirror.nucleus.be/repo/10.7/debian buster main' && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server

# Устанавливаем ionCube Loader
RUN curl -o ioncube_loaders.tar.gz https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz && \
    tar -zxvf ioncube_loaders.tar.gz && \
    cp ioncube/ioncube_loader_lin_7.4.so $(php -r "echo ini_get('extension_dir');") && \
    rm -rf ioncube ioncube_loaders.tar.gz

RUN echo "zend_extension = ioncube_loader_lin_7.4.so" > /usr/local/etc/php/conf.d/0ioncube.ini

# Права записи на файлы движка для PHP
RUN chown -R www-data:www-data /var/www/html

# Создаем пользователя container и устанавливаем рабочую директорию
RUN useradd -m -d /home/container container
RUN chown container:container -R /home/container
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

# Копируем скрипт входа
ADD ./image/php7.4/entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]