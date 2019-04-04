FROM centos:7

RUN yum clean all && yum -y update
RUN yum -y install openssl curl

RUN curl -SLk "https://setup.ius.io/" | bash
RUN yum -y install \
  php71u-cli \
  php71u-common \
  php71u-fpm \
  php71u-mbstring \
  php71u-mcrypt \
  php71u-json \
  php71u-xml \
  php71u-pdo \
  php71u-odbc \
  php71u-mysqlnd \
  php71u-pgsql \
  php71u-pecl-mongodb \
  php71u-pecl-redis \
  php71u-gd \
  php71u-process \
  php71u-opcache

RUN usermod -u 33 php-fpm && \
  groupmod -g 33 php-fpm

RUN chown -R php-fpm:php-fpm /var/lib/php/fpm /var/log/php-fpm

RUN curl -SLk "https://getcomposer.org/composer.phar" > "/usr/local/bin/composer" \
  && chmod +x "/usr/local/bin/composer"
