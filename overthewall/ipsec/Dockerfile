
FROM debian:latest

RUN apt-get update && apt-get -y install strongswan xl2tpd iptables supervisor && apt-get clean

ADD "./entrypoint.sh" "/entrypoint.sh"
RUN chmod +x "/entrypoint.sh"

ADD "./supervisord.conf" "/supervisord.conf"

EXPOSE 500/udp 4500/udp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]

