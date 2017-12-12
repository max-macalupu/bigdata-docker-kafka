# bigdata-docker-kafka

Este proyecto me permite iniciar apache kafka con una configuración básica dentro de docker.

Para ello primero se requiere los siguientes pasos.

- 1.- git clone https://github.com/max-macalupu/bigdata-docker-kafka.git
- 2.- cd bigdata-docker-kafka
- 3.- docker build -t simple-kafka:0.0.1 .
- 4.- docker run --rm -p 9092:9092 -p 2181:2181 -e LOCAL_IP=127.0.0.1 -t simple-kafka:0.0.1
