FROM php:7.1.33-fpm

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

RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' >/etc/timezone

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
    && curl -O https://packages.baidu.com/app/openrasp/release/1.3.4/rasp-php-linux.tar.bz2 \
    && tar -jxvf rasp-php-linux.tar.bz2 \
    && cd /tmp/rasp-php-2020-07-07 \
    && php install.php -d /opt/rasp \
    && rm -rf /tmp/* \
    && rm -rf /opt/rasp/plugins/official.js \
    && rm -rf /opt/rasp/conf/openrasp.yml \
    && cd /opt/rasp/conf/ \
    && curl -O https://raw.githubusercontent.com/jinlicode/SecurityRule/master/openrasp.yml \
    && cd /opt/rasp/plugins/ \
    && curl -O https://raw.githubusercontent.com/jinlicode/SecurityRule/master/plugin.js