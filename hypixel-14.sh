#!/bin/bash
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
lsmod | grep bbr
apt update
apt upgrade -y
wget https://github.com/layou233/ZBProxy/releases/download/3.0-rc.4/ZBProxy-linux-amd64
chmod +x ZBProxy-linux-amd64
cat << EOF > /usr/lib/systemd/system/ZBProxy.service
[Unit]
Description=ZBProxy

[Service]
Type=simple
WorkingDirectory=/root/
ExecStart=/root/ZBProxy-linux-amd64

[Install]
WantedBy=multi-user.target
EOF

systemctl enable ZBProxy
systemctl start ZBProxy
