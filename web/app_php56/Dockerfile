FROM centos:7

RUN yum clean all && yum -y update
RUN yum -y install openssl curl

RUN curl -SLk "https://setup.ius.io/" | bash
RUN yum -y install \
  php56u-cli \
  php56u-common \
  php56u-fpm \
  php56u-mbstring \
  php56u-mcrypt \
  php56u-pecl-jsonc \
  php56u-xml \
  php56u-pdo \
  php56u-odbc \
  php56u-mysqlnd \
  php56u-pgsql \
  php56u-pecl-mongo \
  php56u-gd \
  php56u-process

RUN usermod -u 33 php-fpm && \
  groupmod -g 33 php-fpm

RUN chown -R php-fpm:php-fpm /var/lib/php/fpm /var/log/php-fpm

RUN curl -SLk "https://getcomposer.org/composer.phar" > "/usr/local/bin/composer" \
  && chmod +x "/usr/local/bin/composer"
