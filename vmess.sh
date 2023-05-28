#!/bin/bash
curl -slSL https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh | bash
wget -O /usr/local/etc/v2ray/config.json https://raw.githubusercontent.com/ours1505/note/main/vmessconfig.json
sed -i "s|"PassWordForChange"|$(curl -4 https://botapi.nyaproxy.xyz/GetMCName)|" /usr/local/etc/v2ray/config.json
systemctl enable v2ray
systemctl start v2ray
