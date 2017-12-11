FROM openjdk:8-jre-alpine
MAINTAINER Max Macalupu max.macalupu@avantica.net

ENV KAFKA_HOME=/kafka
ENV PATH=/kafka:$PATH
ENV LOCAL_IP=127.0.0.1

RUN apk add --update bash zip curl java-gcj-compat&& \
    curl http://www-eu.apache.org/dist/kafka/1.0.0/kafka_2.11-1.0.0.tgz| tar -xzf - && \
    mv kafka_2.11-1.0.0 /kafka && \
    rm /var/cache/apk/*
RUN mkdir /tmp/zookeeper
RUN mkdir /tmp/kafka-logs

WORKDIR ${KAFKA_HOME}
ADD run.sh ${KAFKA_HOME}/run.sh
RUN chmod a+x ${KAFKA_HOME}/run.sh
ADD create-topics.sh ${KAFKA_HOME}/create-topics.sh

EXPOSE 9092 2181
CMD ["create-topics.sh"]
CMD ["run.sh"]

