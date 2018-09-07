<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

session_start();

$con = new pdo_db();

$sql = "SELECT id, mac_address, unlimited, is_active, hours_allowed FROM devices WHERE student_id = ".$_POST['id'];
$devices = $con->getData($sql);

foreach ($devices as $i => $device) {
	
	$devices[$i]['unlimited'] = ($device['unlimited']==1)?true:false;
	$devices[$i]['is_active'] = ($device['is_active']==1)?true:false;
	$devices[$i]['edit'] = false;
	
};

echo json_encode($devices);

?>