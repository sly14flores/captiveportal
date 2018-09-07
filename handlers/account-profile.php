<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

session_start();

$con = new pdo_db();

$profile = [];

$profile['profile']['staff'] = $_SESSION['staff'];

$dir = "pictures/";
$avatar = $dir."avatar.png";

$picture = $avatar;

$profile['profile']['picture'] = $picture;


echo json_encode($profile);

?>