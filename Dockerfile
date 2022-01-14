# DOCKER-VERSION 1.5.0
# VERSION 0.2

FROM scratch
# FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    osm2pgsql
    

ENTRYPOINT ["/bin/bash"]
