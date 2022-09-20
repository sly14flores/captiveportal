<?php

require_once 'db.php';

$con = new pdo_db();

$get_current_school_year = $con->getData("SELECT * FROM settings WHERE id = 1");
$current_sy = $get_current_school_year[0]['property_value'];

$get_global_internet_duration = $con->getData("SELECT * FROM settings WHERE id = 2");
$global_internet_duration = $get_global_internet_duration[0]['property_value'];

$devices = $con->getData("SELECT devices.id, devices.student_id, devices.tok, devices.mac_address, devices.is_active, devices.hours_allowed, devices.unlimited, devices.session_datetime FROM devices LEFT JOIN students ON devices.student_id = students.id WHERE devices.system_log LIKE '".date("Y-m-d")."%' AND students.enrollment_school_year = $current_sy AND devices.unlimited = 0");

foreach ($devices as $device) {
	
	$hours_allowed = ($device['hours_allowed']>$global_internet_duration)?$device['hours_allowed']:$global_internet_duration;
	
	$mac = strtolower($device['mac_address']);
	
	$blocked = ($device['is_active']==0)?true:false;
	
	# check expiration
	$now = date("Y-m-d H:i:s");
	$session_datetime = date("Y-m-d H:i:s",strtotime("+$hours_allowed Hour",strtotime($device['session_datetime'])));

	$expired = false;
	if ( (strtotime($session_datetime)<strtotime($now)) && ($device['unlimited']==0) ) {				
		
		$expired = true;
		
	};
	
	$deauth = $blocked || $expired;

	if ($deauth) {
		shell_exec("sudo ndsctl deauth $mac");
		echo $mac." was deauthenticated...\n";
	};

};

?>
