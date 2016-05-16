#!/bin/bash


echo "
# /etc/strongswan.conf - strongSwan configuration file

# https://www.strongswan.org/uml/testresults/ikev2/rw-psk-ipv4/moon.strongswan.conf
# https://wiki.strongswan.org/projects/strongswan/wiki/Attrplugin

charon {
    load_modular = yes
    plugins {
        include strongswan.d/charon/*.conf
        attr {
            dns = ${RESOLVER_ADDR_LIST}
        }
    }
}

include strongswan.d/*.conf

" > "/etc/strongswan.conf"


echo "
# /etc/ipsec.conf - strongSwan IPsec configuration file

# https://www.strongswan.org/uml/testresults/ikev2/rw-psk-ipv4/moon.ipsec.conf
# https://wiki.strongswan.org/projects/strongswan/wiki/ForwardingAndSplitTunneling

config setup

conn %default
    left=%defaultroute
    ikelifetime=60m
    keylife=20m
    rekeymargin=3m
    keyingtries=1
    keyexchange=ikev2
    authby=secret

conn rw
    leftsubnet=0.0.0.0/0
    leftfirewall=yes
    right=%any
    rightsourceip=10.8.0.0/16
    auto=add

" > "/etc/ipsec.conf"


# https://wiki.strongswan.org/projects/strongswan/wiki/ForwardingAndSplitTunneling
# https://wiki.strongswan.org/projects/strongswan/wiki/VirtualIP

sysctl net.ipv4.ip_forward=1
sysctl net.ipv6.conf.all.forwarding=1
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o eth0 -m policy --dir out --pol ipsec -j ACCEPT
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o eth0 -j MASQUERADE

# hotfix for openssl `unable to write 'random state'` stderr
echo ": PSK \"${SHARED_SECRET}\"" > /etc/ipsec.secrets

# hotfix for https://github.com/gaomd/docker-ikev2-vpn-server/issues/7
rm -f /var/run/starter.charon.pid

# http://wiki.loopop.net/doku.php?id=server:vpn:strongswanonopenvz
/usr/sbin/ipsec start --nofork

