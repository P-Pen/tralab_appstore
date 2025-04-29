<?php
require_once '../../config.php';

// 记录页面访问量
header('Content-Type: application/json');

$page_name = 'check_update_activity';
$sql = "INSERT INTO pv_logs (page_name) VALUES ('$page_name')";

if ($conn->query($sql) === TRUE) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["error" => "Failed to record page view"]);
}

$conn->close();
?>