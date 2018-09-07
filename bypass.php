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

exec("sudo iptables -I internet 1 -t mangle -m mac --mac-source ".strtoupper($mac)." -j RETURN");
exec("sudo rmtrack " . $ip);

sleep(3);

header('Location: activated.html');

?>

