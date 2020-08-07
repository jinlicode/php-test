FROM php:7.1.33-fpm-alpine

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/

# 暂时不用的组件

#    bcmath \
#    apcu \
#    amqp \
#    enchant \
#    calendar \
#    gettext \
#    gmagick \
#    gmp \
#    grpc \
#    http \
#    igbinary \
#    intl \
#    ldap \
#    mailparse \
#    msgpack \
#    oauth \
#    pdo_firebird \
#    propro \
#    protobuf \
#    pspell \
#    raphf \
#    recode \
#    shmop \
#    snmp \
#    soap \
#    solr \
#    ssh2 \
#    sysvmsg \
#    sysvsem \
#    sysvshm \
#    timezonedb \
#    uopz \
#    uuid \
#    xdebug \
#    xhprof \
#    xsl \
#    yaml \
# pgsql \
RUN install-php-extensions gd  \
    bz2 \
    dba \
    exif \
    imagick \
    imap \
    mcrypt \
    memcached \
    mongodb \
    mysqli \
    opcache\
    pdo_mysql \
    pdo_pgsql \
    redis \
    tidy \
    xmlrpc \
    zip \
    sockets
RUN    cd /tmp \
    && apk add --no-cache libc6-compat \
    && wget https://github.com/baidu/openrasp/releases/download/v1.3.4/rasp-php-linux.tar.bz2 \
    && tar -jxvf rasp-php-linux.tar.bz2 \
    && cd /tmp/rasp-php-2020-07-07 \
    && php install.php -d /opt/rasp \
    && rm -rf /tmp/* 