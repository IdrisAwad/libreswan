ipsec auto --start norhtnet-eastnets
ipsec auto --status | grep norhtnet-eastnets
ping -n -c 2 -I 192.0.3.254 192.0.2.254
ping -n -c 2 -I 192.0.3.254 192.0.22.254
ipsec whack --trafficstatus
echo done
