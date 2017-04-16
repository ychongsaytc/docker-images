
FROM python:2

RUN git clone https://github.com/shadowsocksr/shadowsocksr.git /shadowsocksr

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8488
ENV PASSWORD    password
ENV METHOD      aes-256-cfb
ENV OBFS        http_simple
ENV TIMEOUT     3000
ENV WORKERS     10
ENV PROTOCOL    auth_sha1_v4

EXPOSE $SERVER_PORT/tcp $SERVER_PORT/udp

CMD python /shadowsocksr/shadowsocks/server.py -s "$SERVER_ADDR"    \
                                               -p "$SERVER_PORT"    \
                                               -k "$PASSWORD"       \
                                               -m "$METHOD"         \
                                               -o "$OBFS"           \
                                               -t "$TIMEOUT"        \
                                               --workers "$WORKERS" \
                                               -O "$PROTOCOL"       \
                                               --fast-open

