#!/bin/bash
echo root:NyaProxyDotXyz |sudo chpasswd root
sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config;
sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config;
sudo systemctl restart sshd
cd /root
wget "https://raw.githubusercontent.com/ours1505/note/master/ZBProxy-linux-amd64-v1"
chmod +x ZBProxy-linux-amd64-v1
wget https://github.com/ours1505/note/raw/main/ZBProxy.json
wget -O /usr/lib/systemd/system/ZBProxy.service https://github.com/ours1505/note/raw/main/ZBProxy.service
chmod +x /usr/lib/systemd/system/ZBProxy.service
sed -i "s|"NAMEFORCHANGE"|$(curl https://botapi.nyaproxy.xyz/MCName.txt)|" ZBProxy.json
systemctl enable ZBProxy
systemctl start ZBProxy
apt update
apt install iptables -y
iptables -F
iptables -P OUTPUT ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -s 154.7.180.101 -p all -j ACCEPT
iptables -A INPUT -s 159.75.98.102 -p all -j ACCEPT
iptables -A INPUT -s 175.24.181.215 -p all -j ACCEPT
iptables -A INPUT -s 16.162.93.184 -p all -j ACCEPT
iptables -A INPUT -s 54.238.208.44 -p all -j ACCEPT
iptables -A INPUT -s 103.170.233.181 -p all -j ACCEPT
iptables -A INPUT -s 103.170.233.0/24 -p all -j ACCEPT
iptables -A INPUT -s 154.23.240.188 -p all -j ACCEPT
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
