#! /bin/bash

set -e

docker build --rm -t $(etcdctl get /announce/services/docker-registry/host)/health-check:latest .

docker push $(etcdctl get /announce/services/docker-registry/host)/health-check:latest
