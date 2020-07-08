FROM php:7.1.33-fpm-alpine

RUN apk update\
    && apk add --no-cache \
        libmcrypt-dev \
        freetype-dev \
        freetype \
        libpng \
        libpng-dev \
        libjpeg \
        jpeg-dev \
        libjpeg-turbo \
        libjpeg-turbo-dev \
        libwebp \
        libwebp-dev \
        git \
        zip \
        zlib-dev \
        libmemcached-dev \
    && docker-php-ext-install mcrypt mysqli pdo_mysql bcmath opcache zip\
    && docker-php-ext-configure gd --with-gd --with-webp-dir --with-jpeg-dir \
       --with-png-dir --with-zlib-dir --with-freetype-dir \
       -enable-gd-native-ttf \
    && docker-php-ext-install -j$(nproc) gd \
    && pecl install memcached redis pthreads\
    && docker-php-ext-enable memcached redis pthreads