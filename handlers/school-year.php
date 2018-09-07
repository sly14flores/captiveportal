<?php

require_once '../db.php';

session_start();

$con = new pdo_db(array("table"=>"settings"));

$active_school_year = $con->get(array("property_description"=>"'school_year'"));

$school_year = [];

if (count($active_school_year)) {
	
	$con->table = "school_years";
	$school_year = $con->get(array("id"=>intval($active_school_year[0]['property_value'])),array("id","school_year"));
	
};

echo (count($school_year))?json_encode($school_year[0]):null;

?>