#!/bin/bash

# docker run --rm -d --name redis-sentinel-1 -p 26379:26379 \
#     -e ALLOW_EMPTY_PASSWORD=yes \
#     -e REDIS_REPLICATION_MODE=slave \
#     -e REDIS_MASTER_HOST=192.168.122.105 \
#     -e REDIS_MASTER_PORT_NUMBER=6379 \
#     -e REDIS_SENTINEL_ANNOUNCE_IP=192.168.122.105 \
#     bitnami/redis-sentinel:latest


docker run --rm -d --name redis-sentinel --net=host \
    -e ALLOW_EMPTY_PASSWORD=yes \
    -e REDIS_REPLICATION_MODE=slave \
    -e REDIS_MASTER_HOST=192.168.122.105 \
    -e REDIS_MASTER_PORT_NUMBER=6379 \
    -e REDIS_SENTINEL_ANNOUNCE_IP=192.168.122.105 \
    bitnami/redis-sentinel:latest