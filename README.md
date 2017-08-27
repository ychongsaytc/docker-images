
## [Web Server](https://github.com/ychongsaytc/docker-images/tree/master/web)

An LNMP server including nginx, PHP-FPM, MySQL, PostgreSQL and MongoDB.

- [Docker Compose](https://github.com/ychongsaytc/docker-images/blob/master/web/docker-compose.yml)

- nginx `ssl_dhparam`

  ```shell
  $ openssl dhparam -out /volume1/docker/ssl/dhparam.pem 4096
  ```

- nginx `ssl_session_ticket_key`

  ```shell
  $ bash web/config/nginx/ssl/session-ticket-key/regenerate.sh
  ```

## [Over the Wall](https://github.com/ychongsaytc/docker-images/tree/master/overthewall)

你懂的。

- [Docker Compose](https://github.com/ychongsaytc/docker-images/blob/master/overthewall/docker-compose.yml)

## [NAS Server](https://github.com/ychongsaytc/docker-images/tree/master/nas)

[Xunlei Remote Download (迅雷远程下载)](http://yuancheng.xunlei.com/) and Cron job trigger (supports by [devcron](https://pypi.python.org/pypi/devcron)).

- [Docker Compose](https://github.com/ychongsaytc/docker-images/blob/master/nas/docker-compose.yml)

## [Mail Server](https://github.com/ychongsaytc/docker-images/tree/master/mail)

A single-domain mail server, Postfix as MTA (SMTP), Dovecot as LDA (IMAP) + sieve. Based on [robbertkl/mail](https://github.com/robbertkl/docker-mail).

- [Docker Compose](https://github.com/ychongsaytc/docker-images/blob/master/mail/docker-compose.yml)


