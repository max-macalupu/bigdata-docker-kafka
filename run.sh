#!/bin/bash

if [ ! -z "$LOCAL_IP" ]; then
	sed -i -e "s|your.host.name|$LOCAL_IP|g" $KAFKA_HOME/config/server.properties
	sed -r -i "s/#(advertised.listeners.*)/\1/g" $KAFKA_HOME/config/server.properties
fi	

bin/zookeeper-server-start.sh config/zookeeper.properties &
bin/kafka-server-start.sh config/server.properties
