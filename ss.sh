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
