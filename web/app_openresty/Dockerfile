FROM openresty/openresty:bionic

RUN /usr/local/openresty/luajit/bin/luarocks install lua-resty-auto-ssl

RUN openssl req -new -newkey rsa:2048 -days 3650 -nodes -x509 \
  -subj '/CN=sni-support-required-for-valid-ssl' \
  -keyout '/etc/ssl/resty-auto-ssl-fallback.key' \
  -out '/etc/ssl/resty-auto-ssl-fallback.crt'

RUN usermod -u 233 www-data && groupmod -g 233 www-data
