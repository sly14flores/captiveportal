<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';
require_once '../classes/devices.php';

$con = new pdo_db("students");

$account = $_POST;

$account['date_of_birth'] = date("Y-m-d",strtotime($account['date_of_birth']));

$student = $con->getData("SELECT * FROM students WHERE school_id = '$account[school_id]' AND date_of_birth = '$account[date_of_birth]'");

$response = [];

if (count($student)) {

	$ip = $_SERVER['REMOTE_ADDR'];

	$response["has_record"]=true;

	$device = new devices($con,$ip);
	$response["status"] = $device->check_device($student[0]);

} else {
	
	$response = array("has_record"=>false);

};

echo json_encode($response);

?>