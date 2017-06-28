FROM quantumobject/docker-baseimage:16.04

MAINTAINER Richard Silver "rsilver@uoregon.edu"

RUN echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list
RUN echo "deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib" >> /etc/apt/sources.list
#RUN wget -q http://www.webmin.com/jcameron-key.asc -O- | apt-key add -
#Currently webmin.com is down lol
RUN sed -i 's/true/false/g' /etc/apt/apt.conf.d/docker-gzip-indexes
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D97A3AE911F63C51
RUN apt-get update && apt-get -y install webmin nano curl git bind9 bind9utils dnsutils && apt-get clean
RUN echo "root:Docker!" | chpasswd
RUN echo "#!/bin/bash" >> /etc/my_init.d/webmin.sh
RUN echo "/usr/bin/perl /usr/share/webmin/miniserv.pl /etc/webmin/miniserv.conf" >> /etc/my_init.d/webmin.sh
RUN echo "/etc/init.d/bind9 start" >> /etc/my_init.d/webmin.sh

RUN chmod +x /etc/my_init.d/webmin.sh


EXPOSE 53 10000

VOLUME /etc/bind /etc/webmin
CMD ["/sbin/my_init"]