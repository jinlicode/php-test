FROM php:7.1.33-fpm-alpine

RUN apk update\
    && apk add --no-cache \
        libmcrypt-dev \
        freetype-dev \
        libjpeg-turbo-dev \
        freetype \
        freetype-dev \
        libpng \
        libpng-dev \
        libjpeg-turbo \
        git \
        libmemcached-dev \
    && docker-php-ext-install mcrypt mysqlnd pdo pdo_mysql mbstring bcmath zip opcache\
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && pecl install memcached \
    && docker-php-ext-enable memcached