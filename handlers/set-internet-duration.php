<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

$con = new pdo_db(array("table"=>"settings"));

$internet_duration = $con->get(array("property_description"=>"'internet_duration'"));

if (count($internet_duration)) {
	
	$set_internet_duration = $con->updateData(array("id"=>$internet_duration[0]['id'],"property_value"=>$_POST['internet_duration'],"system_log"=>"CURRENT_TIMESTAMP"),"id");
	
} else {
	
	$set_internet_duration = $con->insertData(array("property_description"=>"internet_duration","property_value"=>$_POST['internet_duration'],"system_log"=>"CURRENT_TIMESTAMP"));

};

?>