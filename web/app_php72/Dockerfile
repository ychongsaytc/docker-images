FROM centos:7

RUN yum clean all && yum -y update
RUN yum -y install openssl curl

RUN curl -SLk "https://setup.ius.io/" | bash
RUN yum -y install \
  php72u-cli \
  php72u-common \
  php72u-fpm \
  php72u-mbstring \
  php72u-json \
  php72u-xml \
  php72u-pdo \
  php72u-odbc \
  php72u-mysqlnd \
  php72u-pgsql \
  php72u-pecl-mongodb \
  php72u-pecl-redis \
  php72u-pecl-memcached \
  php72u-gd \
  php72u-intl \
  php72u-process \
  php72u-opcache \
  php72u-ioncube-loader

RUN usermod -u 233 php-fpm && groupmod -g 233 php-fpm

RUN chown -R php-fpm:php-fpm /var/lib/php/fpm /var/log/php-fpm

RUN curl -SLk "https://getcomposer.org/composer.phar" > "/usr/local/bin/composer" && chmod +x "/usr/local/bin/composer"
