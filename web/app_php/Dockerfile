
FROM centos:latest

RUN yum clean all && yum -y update
RUN yum -y install curl openssl git
RUN curl -SLk "https://setup.ius.io/" | bash
RUN yum -y install \
	php70u-cli \
	php70u-common \
	php70u-fpm \
	php70u-mbstring \
	php70u-mcrypt \
	php70u-pdo \
	php70u-mysqlnd \
	php70u-pgsql \
	php70u-json \
	php70u-xml \
	php70u-gd \
	java-1.8.0-openjdk
RUN curl -SLk "https://getcomposer.org/composer.phar" > "/usr/local/bin/composer" \
	&& chmod +x "/usr/local/bin/composer"

