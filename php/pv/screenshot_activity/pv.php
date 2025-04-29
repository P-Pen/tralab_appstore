<?php
// 记录页面访问量
header('Content-Type: application/json');

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "tralab_appstore";

// 创建连接
$conn = new mysqli($servername, $username, $password, $dbname);

// 检查连接
if ($conn->connect_error) {
    die(json_encode(["error" => "Database connection failed"]));
}

$page_name = 'screenshot_activity';
$sql = "INSERT INTO pv_logs (page_name) VALUES ('$page_name')";

if ($conn->query($sql) === TRUE) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["error" => "Failed to record page view"]);
}

$conn->close();
?>