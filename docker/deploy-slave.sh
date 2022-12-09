#!/bin/bash

# docker run --rm -d --name redis-slave -p 6379:6379 \
#     -e ALLOW_EMPTY_PASSWORD=yes \
#     -e REDIS_REPLICATION_MODE=slave \
#     -e REDIS_MASTER_HOST=192.168.122.105 \
#     -e REDIS_MASTER_PORT_NUMBER=6379 \
#     -e REDIS_REPLICA_IP=192.168.122.231 \
#     bitnami/redis:latest


docker run --rm -d --name redis-slave --net=host \
    -e ALLOW_EMPTY_PASSWORD=yes \
    -e REDIS_REPLICATION_MODE=slave \
    -e REDIS_MASTER_HOST=192.168.122.105 \
    -e REDIS_MASTER_PORT_NUMBER=6379 \
    -e REDIS_REPLICA_IP=192.168.122.144 \
    -e BITNAMI_DEBUG=true \
    -e REDIS_ALIAS=REDIS_SLAVE \
    bitnami/redis:latest

docker run --rm -d --name redis-sentinel --net=host \
    -e ALLOW_EMPTY_PASSWORD=yes \
    -e REDIS_REPLICATION_MODE=slave \
    -e REDIS_MASTER_HOST=192.168.122.105 \
    -e REDIS_MASTER_PORT_NUMBER=6379 \
    -e REDIS_SENTINEL_ANNOUNCE_IP=192.168.122.144 \
    -e BITNAMI_DEBUG=true \
    bitnami/redis-sentinel:latest    