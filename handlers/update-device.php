<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

$con = new pdo_db(array("table"=>"devices"));

$device = $_POST;
$device['is_active'] = ($device['is_active'])?1:0;
$device['unlimited'] = ($device['unlimited'])?1:0;

unset($device['edit']);

$update = $con->updateData($device,"id");

?>