#! /bin/bash

if [ ! -d "/var/run/nagios" ]
then
  mkdir -p /var/run/nagios
  chown nagios /var/run/nagios
fi

/usr/sbin/nrpe -c /etc/nagios/coreos.cfg -d
while [ ! -f "/var/run/nagios/nrpe.pid" ]
do
  sleep 1
done

while [ -f "/var/run/nagios/nrpe.pid" ]
do
  sleep 1
done
