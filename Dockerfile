FROM php:5.6.40-fpm-alpine

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
                           odbc \
                           opcache\
                           pdo_dblib \
                           pdo_mysql \
                           pdo_odbc \
                           pdo_pgsql \
                           pgsql \
                           redis \
                           tidy \
                           xmlrpc \
                           zip \
                           rdkafka \
                           sockets