#! /bin/sh

ZOOKEEPER_DIR=/opt/zookeeper-3.4.6
cp $ZOOKEEPER_DIR/conf/zoo.cfg.template $ZOOKEEPER_DIR/conf/zoo.cfg
ID=1
for server in $ZK_SERVERS
do
  echo "server.$ID=$server:2888:3888" >> $ZOOKEEPER_DIR/conf/zoo.cfg
  ID=$(expr $ID + 1)
done
cat $ZOOKEEPER_DIR/conf/zoo.cfg


printf "${ZK_SERVER_NUMBER}" > /data/myid
printf "Starting zookeeper server $(cat /data/myid)\n"
export JMXDISABLE=true

$ZOOKEEPER_DIR/bin/zkServer.sh start-foreground

