
FROM debian:latest

RUN apt-get update && apt-get install -y python python-pip mercurial && apt-get clean

RUN pip install devcron

RUN mkdir -p /cron && touch /cron/crontab

VOLUME ["/cron"]

CMD ["devcron.py", "/cron/crontab"]

