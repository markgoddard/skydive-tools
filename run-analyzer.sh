#!/bin/sh -ex

docker run \
  -it -d \
  --name skydive-analyzer-dev \
  -v /etc/kolla/skydive-analyzer/skydive.conf:/etc/skydive/skydive.conf \
  --net=host skydive-dev \
  /go/bin/skydive analyzer --conf /etc/skydive/skydive.conf --listen=192.168.7.11:8085
