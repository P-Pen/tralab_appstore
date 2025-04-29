<?php
require_once '../config.php';

// 强制更新版本检查
header('Content-Type: application/json');

$sql = "SELECT version_code, update_log, download_url FROM updates ORDER BY update_time DESC LIMIT 1";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo json_encode($row);
} else {
    echo json_encode(["error" => "No updates available"]);
}

$conn->close();
?>