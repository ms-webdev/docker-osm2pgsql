# DOCKER-VERSION 1.5.0
# VERSION 0.2

FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    osm2pgsql
    

ENTRYPOINT ["/bin/bash"]
