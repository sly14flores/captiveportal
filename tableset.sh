IPTABLES=/sbin/iptables

# Create internet chain
# This is used to authenticate users who have already signed up
$IPTABLES -N internet -t mangle

# First send all traffic via newly created internet chain
# At the prerouting NAT stage this will DNAT them to the local
# webserver for them to signup if they aren't authorised
# Packets for unauthorised users are marked for dropping later
$IPTABLES -t mangle -A PREROUTING -j internet

###### INTERNET CHAIN ##########
# MAC address not found. Mark the packet 99
$IPTABLES -t mangle -A internet -j MARK --set-mark 99
################################

# Accepts encrypted traffic
#$IPTABLES -A OUTPUT -o wlan0 -p tcp --dport 443 -j ACCEPT
#$IPTABLES -I INPUT 1 -m conntrack -j ACCEPT  --ctstate RELATED,ESTABLISHED

$IPTABLES -t nat -A OUTPUT -o lo -p tcp --dport 443 -j REDIRECT --to-port 80

#$IPTABLES -A FORWARD -p tcp -m tcp -m multiport -d 192.168.10.1/24 -j ACCEPT --dports 80

# Redirects web requests from Unauthorised users to logon Web Page
#$IPTABLES -t nat -A PREROUTING -m mark --mark 99 -p tcp --dport 443 -j REDIRECT --to-port 80
$IPTABLES -t nat -A PREROUTING -m mark --mark 99 -p tcp --dport 80 -j DNAT --to-destination 192.168.10.1 # redirect http
$IPTABLES -t nat -A PREROUTING -m mark --mark 99 -p tcp --dport 1:21 -j DNAT --to-destination 192.168.10.1 # to be sure redirect all ports
$IPTABLES -t nat -A PREROUTING -m mark --mark 99 -p tcp --dport 23:65535 -j DNAT --to-destination 192.168.10.1 # to be sure redirect all ports

# Now that we've got to the forward filter, drop all packets
# marked 99 - these are unknown users. We can't drop them earlier
# as there's no filter table
$IPTABLES -t filter -A FORWARD -m mark --mark 99 -j DROP
