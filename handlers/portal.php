<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

$con = new pdo_db();
$sql = "SELECT id, IFNULL(CONCAT(nickname, ' ', lastname),'') staff FROM staffs WHERE username = '$_POST[username]' AND password = '$_POST[password]'";
$account = $con->getData($sql);

$login = array(
	"login"=>false,
);

if (($con->rows) > 0) {
	session_start();
	$_SESSION['id'] = $account[0]['id'];
	$_SESSION['staff'] = $account[0]['staff'];
	$login['login'] = true;
}

echo json_encode($login);

?>