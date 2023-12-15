#!/bin/bash

docker run --restart unless-stopped --name miner-monero -d --read-only -p 9901:9901 strm/xmrig \
           --api-worker-id strm-miner-01 --http-host 0.0.0.0 --http-port 9901 --http-access-token SECRET \
           --http-no-restricted -o pool.zephyrprotocol.com:3333  \
           -u ZEPHYR3KYTEYYERpdkYG5vcjRNrx4Vtn5EkuF5V4NwNPVRrXxcukwetTe6CRp3xo9qaff5m5hreG344TLrudobeVdTyBwdkmdh14A \
           -k --tls --rig-id strm-worker-01

