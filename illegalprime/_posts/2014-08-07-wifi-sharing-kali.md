---
layout: post
title:  "Wifi Sharing in Kali Linux"
date:   2014-08-07
tags:
  - linux
  - code
---

# Intro

I have spent a long long while looking for solutions to this problem over the great Linux forums, and in truth its not easy to do. Most of the scripts I've come across did not work, but from all this experience I've pieced together a collection of DHCPD rules and iptable commands that should allow you to use airbase-ng to create a WiFi hotspot with optional WEP Encryption.

So here it is.

# Prerequisites

In order to have this script run successfully you will need:

## The Hardware

 - A wireless card or Ethernet card that is connected to the Internet.
 - Another wireless card that can be put into monitor mode
 - Some computer with Linux (Why not Kali Linux?)

## The Software

 - The `aircrack-ng` suite, notably `airbase-ng`.
 - `mitmproxy` available by issuing `sudo pip2 install mitmproxy`
 - `dhcpd` which is not available in Kali by default and
one can install it through `apt-get install isc-dhcp-server`

# The Script

## Variable Names


 - `LAN_IF` is the interface connected to the Internet.
 - `LAN_GATEWAY` is the IP of the main router to which `LAN_IF` connects to.
 - `AP_IF` is the monitor mode capable interface.
 - `AP_CHANNEL` specifies the wireless channel of the AP.
 - `AP_ESSID` is the AP name.
 - `AP_GATEWAY` is the router IP clients connected to the AP will see.
 - For a range of IPs of `AP_RANGE` given to the clients, `AP_SUBNET` and `AP_NETMASK` should stay the same.
 - `AP_MTU` is the [MTU](https://en.wikipedia.org/wiki/Maximum_transmission_unit).
 - Finally `MITMPROXY_FLAGS` are the arguments that get appended on to mitmproxy at runtime.

Change these arguments to fit your needs. Also if you want WPA/WPA2 encryption, use hostapd with a suitable Atheros wireless card.

## The Entire Script

```bash
#!/bin/bash
LAN_IF=wlan1
LAN_GATEWAY=$(ip -4 route list type unicast dev $LAN_IF exact 0/0 | cut -d ' ' -f 3)

AP_IF=wlan0
AP_CHANNEL=6
AP_ESSID='Do not connect to'
AP_GATEWAY='192.168.2.1'
AP_SUBNET='192.168.2.0'
AP_NETMASK='255.255.255.0'
AP_RANGE='192.168.2.2 192.168.2.255'
AP_MTU=1400

MITMPROXY_FLAGS=""
#MITMPROXY_FLAGS="-s /root/Desktop/image_local.py"

if [ "$(id -u)" != "0" ]; then
    echo "Run it as root."
    exit 1
fi

ifconfig $AP_IF down
iwconfig $AP_IF mode monitor channel $AP_CHANNEL
ifconfig $AP_IF up

if [ "$(iwconfig $AP_IF | grep -o Mode:Monitor)" = "" ]; then
    echo "[FAIL] Could not put interface $AP_IF in monitor mode."
    echo "       Exiting..."
    exit
else
    echo "[ OK ] monitor mode on interface $AP_IF."
    sleep 1
fi

xterm -geometry 75x15+1+0 -T "Airbase - $AP_ESSID - $AP_IF" \
       -e "airbase-ng -c $AP_CHANNEL -e '$AP_ESSID' $AP_IF" &
AIRBASE_PID=$!
sleep 3

if [ "$(ps -A | grep -o $AIRBASE_PID)" = "" ]; then
    echo "[FAIL] Cannot find airbase-ng, quitting."
    exit
else
    echo "[ OK ] Started airbase-ng"
fi

ifconfig lo up
ifconfig at0 up
sleep 1
ifconfig at0 $AP_GATEWAY netmask $AP_NETMASK
ifconfig at0 mtu $AP_MTU
route add -net $AP_SUBNET netmask $AP_NETMASK gw $AP_GATEWAY

iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -t nat -A PREROUTING -p udp -j DNAT --to $LAN_GATEWAY
iptables -P FORWARD ACCEPT
iptables --append FORWARD --in-interface at0 -j ACCEPT
iptables --table nat --append POSTROUTING --out-interface $LAN_IF -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp --destination-port 80 \
         -j REDIRECT --to-port 8080

echo "[ OK ] IP table rules set."

echo "authoritative;

default-lease-time 600;
max-lease-time 7200;

subnet $AP_SUBNET netmask $AP_NETMASK {
    option routers $AP_GATEWAY;
    option subnet-mask $AP_NETMASK;
    option domain-name \"$AP_ESSID\";
    option domain-name-servers $LAN_GATEWAY;
    range $AP_RANGE;
}
" > /etc/dhcpd-rogue.conf

echo "[ OK ] Adding DHCPD configuration."

touch /var/run/dhcpd.pid
xterm -geometry 75x20+1+100 -T DHCP \
      -e dhcpd -d -f -cf "/etc/dhcpd-rogue.conf" -pf "/var/run/dhcpd.pid" at0 &
DHCPD_PID=$!
sleep 3

if [ $? -ne 0 ]; then
    echo "[FAIL] DHCPD Failed to start."
    exit
else
    echo "[ OK ] Started DHCPD Server"
fi

mitmproxy -T --host --anticache -p 8080 $MITMPROXY_FLAGS
#echo "Hit Enter to tear down the network."
#read
echo "Cleaning up..."

kill -SIGINT $(cat /var/run/dhcpd.pid)
kill -SIGINT $AIRBASE_PID

ifconfig $AP_IF down
iwconfig $AP_IF mode managed
ifconfig $AP_IF up

echo 0 > /proc/sys/net/ipv4/ip_forward
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain

echo "Done."
```

This had worked for me in Kali Linux when this post was published, so please comment if anything stops working.
