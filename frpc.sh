#!/bin/bash
cd /root
wget https://raw.githubusercontent.com/ours1505/note/main/frpc_linux_amd64
chmod +x frpc_linux_amd64 
wget -O /usr/lib/systemd/system/frpc.service https://github.com/ours1505/note/raw/main/frpc.service
chmod +x /usr/lib/systemd/system/frpc.service
