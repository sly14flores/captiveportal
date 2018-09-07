<?php

require_once 'db.php';

$con = new pdo_db();

$get_current_sy = $con->getData("SELECT property_value FROM settings WHERE property_description = 'school_year'");

$current_sy = (count($get_current_sy))?$get_current_sy[0]['property_value']:1;

$sql = "SELECT devices.mac_address, devices.ip_address, DATE_ADD(devices.session_datetime, INTERVAL devices.hours_allowed HOUR) expiration FROM devices LEFT JOIN students ON devices.student_id = students.id WHERE students.enrollment_school_year = $current_sy AND devices.unlimited = 0";
$devices = $con->getData($sql);

foreach ($devices as $device) {

	if (strtotime($device['expiration'])>date("Y-m-d H:i:s")) continue;

	exec("sudo iptables -D internet -t mangle -m mac --mac-source ".$device['mac_address']." -j RETURN");
	exec("sudo rmtrack ".$device['ip_address']);

	sleep(1);

};

?>