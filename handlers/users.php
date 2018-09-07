<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

session_start();

$con = new pdo_db();

$filter = "WHERE students.enrollment_school_year = ".$_POST['id'];

$sql = "SELECT id, (SELECT school_years.school_year FROM school_years WHERE school_years.id = students.enrollment_school_year) school_year, school_id, last_name, first_name, middle_name, (SELECT COUNT(*) FROM devices WHERE devices.student_id = students.id) no_of_devices FROM students $filter ORDER BY school_id";
$users = $con->getData($sql);

echo json_encode($users);

?>