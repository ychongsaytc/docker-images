
FROM python:2

RUN pip install shadowsocks

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8388
ENV METHOD      aes-256-cfb
ENV PASSWORD    password
ENV TIMEOUT     3000
ENV WORKERS     10

EXPOSE $SERVER_PORT/tcp $SERVER_PORT/udp

CMD ssserver \
	-s "$SERVER_ADDR"    \
	-p "$SERVER_PORT"    \
	-k "$PASSWORD"       \
	-m "$METHOD"         \
	-t "$TIMEOUT"        \
	--workers "$WORKERS" \
	-q                   \
	--fast-open

