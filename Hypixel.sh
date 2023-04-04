#!/bin/bash
cd /root
wget "https://raw.githubusercontent.com/ours1505/note/master/ZBProxy-linux-amd64-v1"
chmod +x ZBProxy-linux-amd64-v1
wget https://github.com/ours1505/note/raw/main/ZBProxy.json
wget -O /usr/lib/systemd/system/ZBProxy.service https://github.com/ours1505/note/raw/main/ZBProxy.service
chmod +x /usr/lib/systemd/system/ZBProxy.service
sed -i "s|"NAMEFORCHANGE"|$(curl https://api.zsshop.cf/MCName.txt)|" ZBProxy.json
systemctl enable ZBProxy
systemctl start ZBProxy
