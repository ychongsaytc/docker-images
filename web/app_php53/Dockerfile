FROM centos:6

RUN yum clean all && yum -y update

RUN rpm -U http://ftp.cuhk.edu.hk/pub/linux/fedora-epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum -y install \
  php-cli \
  php-fpm \
  php-gd \
  php-imap \
  php-intl \
  php-ldap \
  php-mbstring \
  php-mcrypt \
  php-mysql \
  php-odbc \
  php-pdo \
  php-pecl-mongo \
  php-pgsql \
  php-php-gettext \
  php-process \
  php-soap \
  php-xml

RUN usermod -u 233 php-fpm && groupmod -g 233 php-fpm

RUN chown -R php-fpm:php-fpm /var/lib/php/fpm /var/log/php-fpm
