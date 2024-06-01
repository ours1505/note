#!/bin/bash
echo root:NyaProxyDotXyz | sudo chpasswd root
cd /root
wget "https://cdn.jsdelivr.net/gh/ours1505/note/ZBProxy-linux-amd64-v1"
chmod +x ZBProxy-linux-amd64-v1
wget -O ZBProxy.json https://cdn.jsdelivr.net/gh/ours1505/note/hypixel.json
wget -O /usr/lib/systemd/system/ZBProxy.service https://cdn.jsdelivr.net/gh/ours1505/note/ZBProxy.service
chmod +x /usr/lib/systemd/system/ZBProxy.service

while true; do
    response=$(curl -4 https://botapi.nyaproxy.xyz/GetMCName)
    
    if [[ "$response" == *"DO NOT SPAM NYAPROXY SYSTEM"* ]]; then
        sleep 5
    else
        echo "$response"
        break
    fi
done

sed -i "s|"NAMEFORCHANGE"|$response|" ZBProxy.json
systemctl enable ZBProxy
systemctl start ZBProxy
