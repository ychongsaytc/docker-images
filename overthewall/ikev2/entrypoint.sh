#!/bin/bash

set -e

echo "# strongSwan configuration file

charon {
	load_modular = yes
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

conn vpn
	keyexchange = ikev2
	authby = secret
	auto = add
	left = %defaultroute
	leftid = ${REMOTE_ID}
	leftsubnet = 0.0.0.0/0
	right = %any
	rightsourceip = 10.99.20.0/16

" > "/etc/ipsec.conf"


echo "
: PSK \"${SHARED_SECRET}\"
" > "/etc/ipsec.secrets"

chmod 664 "/etc/ipsec.secrets"


sysctl "net.ipv4.ip_forward=1"
sysctl "net.ipv6.conf.all.forwarding=1"

iptables -t nat -A POSTROUTING -s 10.99.20.0/16 -o eth0 -j MASQUERADE

exec "$@"

