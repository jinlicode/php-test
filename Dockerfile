FROM php:7.4.8-fpm

FROM php:7.2-cli

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/

RUN install-php-extensions gd  \
                           bcmath \
                           apcu \
                           amqp \
                           bz2 \
                           calendar \
                           dba \
                           enchant \
                           exif \
                           gettext \
                           gmagick \
                           gmp \
                           grpc \
                           http \
                           igbinary \
                           imagick \
                           imap \
                           intl \
                           ldap \
                           mailparse \
                           mcrypt \
                           memcached \
                           mongodb \
                           msgpack \
                           mysqli \
                           oauth \
                           odbc \
                           opcache\
                           pdo_dblib \
                           pdo_firebird \
                           pdo_mysql \
                           pdo_odbc \
                           pdo_pgsql \
                           pgsql \
                           propro \
                           protobuf \
                           pspell \
                           raphf \
                           rdkafka \
                           recode \
                           redis \
                           shmop \
                           snmp \
                           soap \
                           sockets \
                           solr \
                           ssh2 \
                           sysvmsg \
                           sysvsem \
                           sysvshm \
                           tidy \
                           timezonedb \
                           uopz \
                           uuid \
                           xdebug \
                           xhprof \
                           xmlrpc \
                           xsl \
                           yaml \
                           zip


    
