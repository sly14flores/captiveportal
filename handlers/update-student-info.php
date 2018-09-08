<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

$con = new pdo_db(array("table"=>"students"));

$update = $con->updateData(array("enrollment_id"=>$_POST['student']['id'],"school_id"=>$_POST['student']['school_id'],"date_of_birth"=>$_POST['student']['date_of_birth'],"system_log"=>"CURRENT_TIMESTAMP"),"enrollment_id");

?>