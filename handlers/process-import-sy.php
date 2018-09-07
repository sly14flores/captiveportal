<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

$con = new pdo_db(array("table"=>"school_years"));

$check = $con->get(array("id"=>$_POST['sy']['id']));

if (count($check)===0) {
	
	$import = $con->insertData(array("id"=>$_POST['sy']['id'],"school_year"=>$_POST['sy']['school_year'],"system_log"=>"CURRENT_TIMESTAMP"));
	
}

?>