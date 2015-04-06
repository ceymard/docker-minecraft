
FROM phusion/baseimage:0.9.16
MAINTAINER christophe.eymard@gmail.com

RUN apt-get update -y; apt-get upgrade -y
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update -y; apt-get upgrade -y
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN apt-get install -y curl oracle-java8-installer oracle-java8-set-default supervisor pwgen

RUN mkdir /minecraft-install; mkdir /minecraft; mkdir /etc/service/minecraft
ADD server /minecraft-install
ADD server/run /etc/service/minecraft/run

VOLUME [ "/minecraft" ]
EXPOSE 25565

