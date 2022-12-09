#!/bin/bash

# docker run --rm -d --name redis-master -p 6379:6379 \
#     -e ALLOW_EMPTY_PASSWORD=yes \
#     -e REDIS_REPLICATION_MODE=master \
#     bitnami/redis:latest

docker run --rm -d --name redis-master --net=host \
    -e ALLOW_EMPTY_PASSWORD=yes \
    -e REDIS_REPLICATION_MODE=master \
    -e BITNAMI_DEBUG=true \
    -e REDIS_ALIAS=REDIS_MASTER \
    -e REDIS_REPLICA_IP=192.168.122.105 \
    -e REDIS_MASTER_IP=192.168.122.105 \
    bitnami/redis:latest

sleep 5
docker run --rm -d --name redis-sentinel --net=host \
    -e ALLOW_EMPTY_PASSWORD=yes \
    -e REDIS_REPLICATION_MODE=slave \
    -e REDIS_MASTER_HOST=192.168.122.105 \
    -e REDIS_MASTER_PORT_NUMBER=6379 \
    -e REDIS_SENTINEL_QUORUM=2 \
    -e REDIS_SENTINEL_DOWN_AFTER_MILLISECONDS=10000 \
    -e REDIS_SENTINEL_FAILOVER_TIMEOUT=10000 \
    -e REDIS_SENTINEL_ANNOUNCE_IP=192.168.122.105 \
    bitnami/redis-sentinel:latest    


docker logs -f redis-master &    
docker logs -f redis-sentinel &