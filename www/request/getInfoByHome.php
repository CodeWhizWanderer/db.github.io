<?php
require_once "comm.php";

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

$sql = "SELECT * FROM types";
$result = $mysqli->query($sql);
$arr = array();
$i = 0;

if ($result) {
    // Fetch and store the data in the array
    while ($rs = mysqli_fetch_assoc($result)) {
        $arr[] = $rs;
        // 通过类型id访问相对应的电影
        $sql1 = "SELECT * FROM movies WHERE tId=".$rs["tId"];
        $result1 = $mysqli->query($sql1);
        $arr1 = array();
        while($rs1 = mysqli_fetch_assoc($result1)){
        	$arr1[] = $rs1;
        }
        // 融合$arr和$arr1
        $arr[$i][] = $arr1;
        $i++;
    }

    // Close the result set
    $result->close();

    // Convert the array to a JSON string and echo it
    echo json_encode($arr);
} else {
    // If the query failed, handle the error
    echo 'Query Error: ' . $mysqli->error;
}

// Close the connection when you're done
$mysqli->close();
?>
