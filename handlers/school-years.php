<?php

require_once '../db.php';

session_start();

$con = new pdo_db();

$sql = "SELECT id, school_year FROM school_years";
$school_years = $con->getData($sql);

echo json_encode($school_years);

?>