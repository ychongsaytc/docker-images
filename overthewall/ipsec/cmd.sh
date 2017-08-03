#!/bin/bash

set -e

echo "# strongSwan configuration file

charon {
	load_modular = yes
	duplicheck.enable = no # 关闭冗余检查
	dns1 = ${DNS_ADDR_1}
	dns2 = ${DNS_ADDR_2}
	nbns1 = ${DNS_ADDR_1} # NBNS (Windows NetBIOS)
	nbns2 = ${DNS_ADDR_2} # NBNS (Windows NetBIOS)
	plugins {
		include strongswan.d/charon/*.conf
	}
}

include strongswan.d/*.conf

" > "/etc/strongswan.conf"


echo "# strongSwan IPsec configuration file

config setup
	uniqueids = no # 允许多设备同时在线

conn %default
	authby = secret
	lifetime = 24h
	inactivity = 24h
	rekey = yes # 过期前重新协商
	dpdaction = hold
	dpdtimeout = 300s # IKEv1
	left = %defaultroute
	leftsubnet = 0.0.0.0/0
    leftfirewall = yes
	right = %any
	auto = add

conn vpn-ikev2
	keyexchange = ikev2
	ikelifetime = 24h
	leftid = ${REMOTE_ID}
	rightsourceip = 10.99.20.0/16

" > "/etc/ipsec.conf"


echo "
: PSK \"${PASSWORD}\"
: XAUTH \"${PASSWORD}\"
%any ${USERNAME} : EAP \"${PASSWORD}\"
" > "/etc/ipsec.secrets"

chmod 664 "/etc/ipsec.secrets"


sysctl "net.ipv4.ip_forward=1"
sysctl "net.ipv6.conf.all.forwarding=1"

iptables -t nat -I POSTROUTING -s 10.99.20.0/16 -o eth0 -m policy --dir out --pol ipsec -j ACCEPT
iptables -t nat -A POSTROUTING -s 10.99.20.0/16 -o eth0 -j MASQUERADE

rm -f /var/run/starter.charon.pid

/usr/sbin/ipsec start --nofork

