
FROM debian:jessie

RUN apt-get update && apt-get -y install strongswan iptables && apt-get clean

ADD "./cmd.sh" "/cmd.sh"
RUN chmod +x "/cmd.sh"

EXPOSE 500/udp 4500/udp

CMD /cmd.sh

