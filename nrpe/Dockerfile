FROM debian:wheezy
MAINTAINER Nick Randell <nick@nickrandell.com>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update; \
apt-get -y install wget; \
wget -O - http://debmon.org/debmon/repo.key 2>/dev/null | apt-key add -; \
echo "deb http://debmon.org/debmon debmon-wheezy main" >> /etc/apt/sources.list; \
apt-get -y install nagios-nrpe-server; \
apt-get -qq update; \
apt-get -y install monitoring-plugins; \
apt-get -y install sysstat; \
apt-get clean

ADD check_mem check_iostat /usr/lib/nagios/plugins/
ADD coreos.cfg /etc/nagios/
ADD start.sh /opt/
EXPOSE 5666
WORKDIR /opt
ENTRYPOINT "/opt/start.sh"

