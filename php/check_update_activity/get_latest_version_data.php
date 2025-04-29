<?php
require_once '../../config.php';

// 获取最新版本数据
header('Content-Type: application/json');

$sql = "SELECT version_code FROM updates ORDER BY update_time DESC LIMIT 1";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo json_encode(["version_code" => $row["version_code"]]);
} else {
    echo json_encode(["version_code" => null]);
}

$conn->close();
?>