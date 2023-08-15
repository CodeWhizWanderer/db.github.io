<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-type, Accept, Authorization");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS, PATCH");


$host = 'localhost'; // MySQL server host
$username = 'root'; // MySQL username
$password = 'root'; // MySQL password
$database = 'mo'; // MySQL database name

$mysqli = new mysqli($host, $username, $password, $database);

// Check the connection for errors
if ($mysqli->connect_error) {
    die('Connection Error: ' . $mysqli->connect_error);
}

// Set the character set for the connection
mysqli_set_charset($mysqli, 'utf8');

// 根据mId 获取电影的详细信息，返回json字符串
$mId=$_GET['mId'];
$sql = "SELECT * FROM movies WHERE mId=".$mId;
$result = $mysqli->query($sql);
$rs = mysqli_fetch_assoc($result);
echo json_encode($rs);

// Close the connection when you're done
$mysqli->close();
?>