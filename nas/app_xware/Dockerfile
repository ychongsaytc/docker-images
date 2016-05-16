
FROM debian:latest

RUN apt-get update && apt-get -y install zlib1g-dev lib32z1 lib32ncurses5 && apt-get clean

ADD "./run.sh" "/run.sh"
ADD "./thunder" "/thunder"

VOLUME ["/TDDOWNLOAD"]

CMD ["/run.sh"]

