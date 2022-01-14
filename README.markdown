# docker-osm2pgsql

A Docker image with [osm2pgsql](https://github.com/openstreetmap/osm2pgsql), the tool for importing OpenStreetMap data into a Postgresql database. Intended to be used with [openfirmware/docker-postgres-osm](https://github.com/openfirmware/docker-postgres-osm).

## Vorbereitung Postgis
https://registry.hub.docker.com/r/postgis/postgis/
```
# pull image
docker pull postgis/postgis
# run
docker run --name osm-postgres -e POSTGRES_HOST_AUTH_METHOD=trust -p 25060:5432 -d postgis/postgis
```

## Build Instructions

Can be built from the Dockerfile:

    # docker build -t ms-webdev/osm2pgsql github.com/ms-webdev/docker-osm2pgsql.git

This currently builds osm2pgsql for Debian from a specific tag; see the Dockerfile for the specific version. Alternatively, specify the tag and download the image from the Docker Hub.

## Running osm2pgsql

Once the image is built, you can run a single-use container with osm2pgsql. Args will be passed to bash, so you will have access to environment variables in your run command.

    # docker run -i -t --rm ms-webdev/osm2pgsql -c 'osm2pgsql -h'

When used with a postgres-osm container, it can import data directly into the database:

    # docker run -i -t --rm --link postgres-osm:pg -v ~/osm:/osm openfirmware/osm2pgsql -c 'osm2pgsql --create --slim --cache 2000 --database $PG_ENV_OSM_DB --username $PG_ENV_OSM_USER --host pg --port $PG_PORT_5432_TCP_PORT /osm/extract.osm.pbf'

For more information on running an import, please see TUTORIAL.markdown. If you have a particular scenario in mind, contact me and I will try to create a guide for that situation.

## Todo

## About

This Dockerfile was built with information from the [Ubuntu 14.04 Switch2OSM guide](http://switch2osm.org/serving-tiles/manually-building-a-tile-server-14-04/).

## Related Docker Images

* [Postgres-OSM Image](https://github.com/openfirmware/docker-postgres-osm)
* [Postgres Image](https://registry.hub.docker.com/_/postgres/)
* [Postgres Image Repo](https://github.com/docker-library/postgres)

# Extract example

```
docker run -i -t --rm --link osm-postgres:pg -v C:\Users\priva\Downloads\_data:/osm ms-webdev/osm2pgsql -c 'osm2pgsql --create --slim --cache 2000 -l --database test --username postgres --host pg --port 5432 /osm/export_old.osm'
```