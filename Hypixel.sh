#!/bin/bash
cd /root
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
lsmod | grep bbr
wget https://raw.githubusercontent.com/ours1505/note/master/ZBProxy-linux-amd64-v1
chmod +x ZBProxy-linux-amd64-v1
wget https://raw.githubusercontent.com/ours1505/note/main/ZBProxy.json
cat << EOF > /usr/lib/systemd/system/ZBProxy.service
[Unit]
Description=ZBProxy

[Service]
Type=simple
WorkingDirectory=/root/
ExecStart=/root/ZBProxy-linux-amd64-v1

[Install]
WantedBy=multi-user.target
EOF

systemctl enable ZBProxy
systemctl start ZBProxy
reboot
