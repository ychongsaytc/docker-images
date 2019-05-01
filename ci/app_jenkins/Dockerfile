FROM jenkins/jenkins:lts

USER root

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs gcc g++ make

USER jenkins
