# DOCKER-VERSION 1.5.0
# VERSION 0.2

FROM alpine:3.14
# FROM ubuntu:20.04

#RUN apt-get update && apt-get install -y \
#    osm2pgsql

RUN apk update && apk add osm2pgsql

#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["/bin/ash"]
