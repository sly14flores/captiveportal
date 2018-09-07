<?php

// get the user IP address from the query string
$ip = $_GET['ip'];

// this is the path to the arp command used to get user MAC address 
// from it's IP address in linux environment.
$arp = "/usr/sbin/arp";

// execute the arp command to get their mac address
$mac = shell_exec("$arp -an " . $ip);
preg_match('/..:..:..:..:..:../',$mac , $matches);
$mac = @$matches[0];

// if MAC Address couldn't be identified.
if( $mac === NULL) {
  echo "Error: Can't retrieve user's MAC address.";
  exit;
}

// Delete it from iptables bypassing rules entry.
exec("sudo iptables -D internet -t mangle -m mac --mac-source ".strtoupper($mac)." -j RETURN");

// remove their connection track.
exec("sudo rmtrack " . $ip); // remove their connection track if any

header('Location: expired.html');

?>
