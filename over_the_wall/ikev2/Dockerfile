
FROM debian:latest

RUN apt-get update && apt-get -y install strongswan iptables && apt-get clean

RUN ["rm", "-f", "/etc/ipsec.secrets"]

ADD "./run" "/usr/bin/run"

EXPOSE 500/udp 4500/udp

CMD ["/usr/bin/run"]

