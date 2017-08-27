
FROM openresty/openresty:xenial

RUN /usr/local/openresty/luajit/bin/luarocks install lua-resty-auto-ssl

RUN openssl req -new -newkey rsa:2048 -days 36500 -nodes -x509 \
	-subj '/CN=sni-support-required-for-valid-ssl' \
	-keyout '/etc/ssl/resty-auto-ssl-fallback.key' \
	-out '/etc/ssl/resty-auto-ssl-fallback.crt'

