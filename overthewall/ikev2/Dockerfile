
FROM debian:latest

RUN apt-get update && apt-get -y install strongswan iptables && apt-get clean

ADD "./entrypoint.sh" "/entrypoint.sh"
RUN chmod +x "/entrypoint.sh"

EXPOSE 500/udp 4500/udp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/ipsec", "start", "--nofork"]

