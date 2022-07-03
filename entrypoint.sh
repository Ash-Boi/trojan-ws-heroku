#!/bin/sh

#Config xray

rm -rf /etc/xray/config.json
cat << EOF >  /usr/src/app/etc/xray/config.json
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

xray -c  /usr/src/app/etc/xray/config.json
