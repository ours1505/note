#!/bin/bash
echo root:NyaProxyDotXyz |sudo chpasswd root
cd /root
wget "https://raw.githubusercontent.com/ours1505/note/master/ZBProxy-linux-amd64-v1"
chmod +x ZBProxy-linux-amd64-v1
wget -O ZBProxy.json https://github.com/ours1505/note/raw/main/hypixel-without-idcheck.json
wget -O /usr/lib/systemd/system/ZBProxy.service https://github.com/ours1505/note/raw/main/ZBProxy.service
chmod +x /usr/lib/systemd/system/ZBProxy.service
systemctl enable ZBProxy
systemctl start ZBProxy
