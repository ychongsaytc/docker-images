#!/bin/bash

set -e

echo "# strongSwan configuration file

charon {
	load_modular = yes
	dns1 = ${DNS_ADDR_1}
	dns2 = ${DNS_ADDR_2}
	plugins {
		include strongswan.d/charon/*.conf
		attr {
			dns = ${DNS_ADDR_1}, ${DNS_ADDR_2}
		}
	}
}

include strongswan.d/*.conf

" > "/etc/strongswan.conf"


echo "# strongSwan IPsec configuration file

config setup
	uniqueids = no

conn vpn-ikev2
	keyexchange = ikev2
	ikelifetime = 24h
	lifetime = 24h
	authby = secret
	auto = add
	left = %defaultroute
	leftid = ${REMOTE_ID}
	leftsubnet = 0.0.0.0/0
	right = %any
	rightsourceip = 10.99.20.0/8

conn vpn-l2tp
	lifetime = 24h
	authby = secret
	auto = add
	type = transport
	left = %defaultroute
	leftprotoport = 17/1701
	right = %any
	rightprotoport = 17/%any

" > "/etc/ipsec.conf"


echo "

[global]
ipsec saref = yes
saref refinfo = 30

[lns default]
ip range = 10.99.30.1-10.99.30.254
local ip = 10.99.30.0
require chap = yes
refuse pap = yes
require authentication = yes
pppoptfile = /etc/ppp/xl2tpd-options
length bit = yes

" > "/etc/xl2tpd/xl2tpd.conf"


echo "

require-mschap-v2
ms-dns ${DNS_ADDR_1}
ms-dns ${DNS_ADDR_2}
auth
mtu 1200
mru 1000
crtscts
hide-password
modem
name l2tpd
proxyarp
lcp-echo-interval 30
lcp-echo-failure 4

" > "/etc/ppp/xl2tpd-options"


echo "
: PSK \"${SHARED_SECRET}\"
" > "/etc/ipsec.secrets"

echo "
# client	server	secret	IP addresses
${CLIENT_NAME}	*	${PASSWORD}	*
" > "/etc/ppp/chap-secrets"

chmod 664 "/etc/ipsec.secrets"
chmod 664 "/etc/ppp/chap-secrets"


mkdir -p "/var/run/xl2tpd"


sysctl "net.ipv4.ip_forward=1"
sysctl "net.ipv6.conf.all.forwarding=1"

iptables -t nat -A POSTROUTING -s 10.99.20.0/8 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.99.30.0/8 -o eth0 -j MASQUERADE

exec "$@"

