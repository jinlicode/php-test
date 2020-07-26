FROM php:7.4.8-fpm-alpine

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
        libzip-dev \
        zlib-dev \
        libmemcached-dev \
        autoconf \
        gcc \
        g++ \
        make 
RUN docker-php-ext-install mysqli pdo_mysql bcmath opcache zip

RUN docker-php-ext-configure gd --with-gd --with-webp --with-jpeg 

RUN --with-zlib --with-freetype --with-libzip\
       -enable-gd-native-ttf 

RUN docker-php-ext-install -j$(nproc) gd 

RUN pecl install memcached redis mcrypt-1.0.1 

RUN docker-php-ext-enable memcached redis mcrypt
    
