#!/bin/bash
cd /root/
wget -O /root/ZBProxy.json https://raw.githubusercontent.com/ours1505/note/main/mushmc.json
sed -i "s|"NAMEFORCHANGE"|$(curl -4 https://botapi.nyaproxy.xyz/GetMCName)|" ZBProxy.json
systemctl restart ZBProxy
