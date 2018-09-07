<?php

require_once '../db.php';

session_start();

$con = new pdo_db(array("table"=>"settings"));

$internet_duration = $con->get(array("property_description"=>"'internet_duration'"));

echo (count($internet_duration))?$internet_duration[0]['property_value']:null;

?>