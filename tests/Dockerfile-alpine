FROM alpine:3.15

ENV DEBIAN_FRONTEND noninteractive
ARG DEBIAN_FRONTEND=noninteractive

RUN apk --update-cache add git cmake make g++ boost-dev expat-dev \
  bzip2-dev zlib-dev libpq proj-dev lua5.3-dev postgresql-dev

ENV HOME /root
# ENV OSM2PGSQL_VERSION 1.5.2
ENV OSM2PGSQL_VERSION 1.4.2

RUN mkdir src &&\
    cd src &&\
    git clone --depth 1 --branch $OSM2PGSQL_VERSION https://github.com/openstreetmap/osm2pgsql.git &&\
    cd osm2pgsql &&\
    mkdir build && cd build &&\
    cmake .. &&\
    make &&\
    make install   

ENTRYPOINT ["/bin/sh"]
