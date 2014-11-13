#! /bin/bash


./build.sh

docker push nrandell/nrpe

fleetctl stop nrpe
sleep 4
fleetctl destroy nrpe
sleep 4
fleetctl start nrpe.service



