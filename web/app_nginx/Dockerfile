
FROM ubuntu:latest

RUN echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu lucid main" > /etc/apt/sources.list.d/nginx-stable-lucid.list && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C && \
	apt-get -y update && \
	apt-get install -y nginx

VOLUME ["/etc/nginx/", "/var/log/nginx/", "/var/www/html/"]

WORKDIR /etc/nginx

EXPOSE 80
EXPOSE 443

