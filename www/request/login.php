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

$uName = $_POST['uName'];
$uPwd = $_POST['uPwd'];
$sql = "SELECT * FROM users WHERE uName='{$uName}'";
$result = $mysqli->query($sql);
$rs = mysqli_fetch_assoc($result);
if($rs["uPwd"] == $uPwd){
    echo json_encode($rs);
}else{
    echo "404";
}


// Close the connection when you're done
$mysqli->close();
?>
