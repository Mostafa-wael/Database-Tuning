#!/bin/bash
set -e
# remove all running containers
list=$(docker ps -a -q)
# docker rm -f $list
# run docker image postgres_adb
# docker run -it --name postgres_adb -p 5432:5432 postgres_adb  /bin/bash
docker run -it \
        --name postgresql \
        -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres \
        -p 5432:5432 \
        --mount type=bind,source="$(pwd)"/data/,target=/docker-entrypoint-initdb.d/ \
        postgres 

# docker cp ./sql/data pg_test:/docker-entrypoint-initdb.d/
# docker exec -u postgres pg_test psql postgres postgres -f docker-entrypoint-initdb.d/dump.sql
# docker exec -it postgresql psql -U postgres -W postgres
# docker exec -it postgresql /bin/bash

