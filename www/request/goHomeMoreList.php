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

$tId = $_GET['tId'];

$sql = "SELECT * FROM movies WHERE tId=".$tId;
$result = $mysqli->query($sql);
$arr = array();
if ($result) {
    // Fetch and store the data in the array
    while ($rs = mysqli_fetch_assoc($result)) {
        $arr[] = $rs;
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