# DOCKER-VERSION 1.5.0
# VERSION 0.2

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    git-core \
    make cmake g++ libboost-dev libboost-system-dev \
    libboost-filesystem-dev libexpat1-dev zlib1g-dev \
    libbz2-dev libpq-dev libproj-dev lua5.3 liblua5.3-dev pandoc

ENV HOME /root
ENV OSM2PGSQL_VERSION 1.5.2

RUN mkdir src &&\
    cd src &&\
    git clone --depth 1 --branch $OSM2PGSQL_VERSION https://github.com/openstreetmap/osm2pgsql.git &&\
    cd osm2pgsql &&\
    mkdir build && cd build &&\
    cmake .. &&\
    make &&\
    make install   

ENTRYPOINT ["/bin/bash"]
