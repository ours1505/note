#!/bin/bash

while true; do
    response=$(curl -4 https://botapi.nyaproxy.xyz/GetMCName)
    
    if [ "$response" != "DO NOT SPAM NYAPROXY SYSTEM" ]; then
        break
    else
        sleep 5
    fi
done

echo root:NyaProxyDotXyz | sudo chpasswd root
cd /root
wget "https://raw.githubusercontent.com/ours1505/note/master/ZBProxy-linux-amd64-v1"
chmod +x ZBProxy-linux-amd64-v1
wget -O ZBProxy.json https://github.com/ours1505/note/raw/main/hypixel.json
wget -O /usr/lib/systemd/system/ZBProxy.service https://github.com/ours1505/note/raw/main/ZBProxy.service
chmod +x /usr/lib/systemd/system/ZBProxy.service
sed -i "s|\"NAMEFORCHANGE\"|$(curl -4 https://botapi.nyaproxy.xyz/GetMCName)|" ZBProxy.json
sed -i "s|\"NAMEFORCHANGE\"|$(curl -4 https://botapi.nyaproxy.xyz/GetMCName)|" ZBProxy.json
systemctl enable ZBProxy
systemctl start ZBProxy
