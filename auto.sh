#!/bin/bash

apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev automake libtool autoconf -y

mkdir build 
cd build

cmake ..

make -j$(nproc)

cp ../config.json /root/config.json
cp xmrig /root/xmrig

chmod +x /tmp/xmrig-nofee/setup_service.sh

bash /tmp/xmrig-nofee/setup_service.sh
