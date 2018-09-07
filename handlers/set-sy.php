<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

$con = new pdo_db(array("table"=>"settings"));

$active_school_year = $con->get(array("property_description"=>"'school_year'"));

if (count($active_school_year)) {
	
	$school_year = $con->updateData(array("id"=>$active_school_year[0]['id'],"property_value"=>$_POST['id'],"system_log"=>"CURRENT_TIMESTAMP"),"id");
	
} else {
	
	$school_year = $con->insertData(array("property_description"=>"school_year","property_value"=>$_POST['id'],"system_log"=>"CURRENT_TIMESTAMP"));
	
};

?>