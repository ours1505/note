#!/bin/bash
iptables -t nat -A PREROUTING -p tcp --dport 25565 -j DNAT --to-destination 209.222.115.43
