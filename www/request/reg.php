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

$uName = $_GET['uName'];
$uPwd = $_GET['uPwd'];
$uToken = time();
$uMovieSys = 0;
$uBookSys = 0;
$uMusicSys = 0;
$uMovieMark = 0;
$uBookMark = 0;
$uMusicMark = 0;

$sql = "INSERT INTO users(uName, uPwd, uToken, uMovieSys, uBookSys, uMusicSys, uMovieMark, uBookMark, uMusicMark) VALUES('{$uName}', '{$uPwd}', '{$uToken}', '{$uMovieSys}', '{$uBookSys}', '{$uMusicSys}', '{$uMovieMark}', '{$uBookMark}', '{$uMusicMark}')";

if ($mysqli->query($sql)) {
    echo "200";
} else {
    echo "404";
}

// Close the connection when you're done
$mysqli->close();
?>
