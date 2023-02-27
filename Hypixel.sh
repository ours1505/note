#!/bin/bash
cd /root
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
lsmod | grep bbr
wget "https://raw.githubusercontent.com/ours1505/note/master/ZBProxy-linux-amd64-v1"
chmod +x ZBProxy-linux-amd64-v1
wget https://github.com/ours1505/note/raw/main/ZBProxy.json
wget -O /usr/lib/systemd/system/ZBProxy.service https://github.com/ours1505/note/raw/main/ZBProxy.service
chmod +x /usr/lib/systemd/system/ZBProxy.service
sed "s|"NameForChange"|$(curl https://api.zsshop.cf/MCName.txt)|" ZBProxy.json
echo $(curl https://api.zsshop.cf/MCName.txt)
systemctl enable ZBProxy
systemctl start ZBProxy
