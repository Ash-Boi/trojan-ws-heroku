#!/bin/sh

#Config xray

rm -rf /etc/xray/config.json
cat << EOF >  /okteto/src/etc/xray/config.json
{
  "inbounds": [
    {
      "port": $PORT,
      "protocol": "trojan",
      "settings": {
        "clients": [
          {
            "password": "$PASSWORD"
          }
        ]
      },
      "streamSettings": {
        "network": "ws"
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
EOF

#run xray

xray -c  /okteto/src/etc/xray/config.json
