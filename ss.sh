#!/bin/bash
cd /root
wget https://github.com/shadowsocks/shadowsocks-rust/releases/download/v1.15.3/shadowsocks-v1.15.3.x86_64-unknown-linux-gnu.tar.xz
tar -xvJf shadowsocks-v1.15.3.x86_64-unknown-linux-gnu.tar.xz
wget -O /root/config.json https://raw.githubusercontent.com/ours1505/note/main/ssconfig.json
sed -i "s|"PassWordToChange"|$(curl -4 https://botapi.nyaproxy.xyz/GetMCName)|" config.json
wget -O /usr/lib/systemd/system/ssserver.service https://raw.githubusercontent.com/ours1505/note/main/ssserver.service
chmod +x /usr/lib/systemd/system/ssserver.service
systemctl enable ssserver
systemctl start ssserver
iptables -F
iptables -P INPUT ACCEPT
iptables -A OUTPUT -p tcp -d 172.65.0.0/16 --dport 25565 -j ACCEPT
iptables -A OUTPUT -p tcp -d 209.222.114.0/24 --dport 25565 -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT
iptables -P OUTPUT DROP
