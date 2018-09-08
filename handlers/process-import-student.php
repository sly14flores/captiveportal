<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

$con = new pdo_db(array("table"=>"students"));

$check = $con->get(array("enrollment_id"=>$_POST['student']['id']));

if (count($check)===0) {
	
	$data = array(
		"enrollment_id"=>$_POST['student']['id'],
		"school_id"=>$_POST['student']['school_id'],
		"enrollment_school_year"=>$_POST['student']['enrollment_school_year'],
		"last_name"=>$_POST['student']['lastname'],
		"first_name"=>$_POST['student']['firstname'],
		"middle_name"=>$_POST['student']['middlename'],
		"date_of_birth"=>$_POST['student']['date_of_birth'],
		"system_log"=>"CURRENT_TIMESTAMP",
	);
	
	$import = $con->insertData($data);
	
} else {
	
	$update = $con->updateData(array("enrollment_id"=>$_POST['student']['id'],"school_id"=>$_POST['student']['school_id'],"date_of_birth"=>$_POST['student']['date_of_birth'],"system_log"=>"CURRENT_TIMESTAMP"),"enrollment_id");
	
};

?>