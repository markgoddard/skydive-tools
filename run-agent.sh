#!/bin/sh -ex

docker run \
  -it -d \
  --name skydive-agent-dev \
  -v /etc/kolla/skydive-agent/skydive.conf:/etc/skydive/skydive.conf \
  -v /var/run/openvswitch/db.sock:/var/run/openvswitch/db.sock:ro \
  --net=host skydive-dev \
  /go/bin/skydive agent --conf /etc/skydive/skydive.conf --listen=192.168.7.11:8090
