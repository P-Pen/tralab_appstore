<?php
require_once '../config.php';

// 更新应用的下载次数
header('Content-Type: application/json');

// 创建连接
$conn = new mysqli($servername, $username, $password, $dbname);

// 检查连接
if ($conn->connect_error) {
    die(json_encode(["error" => "Database connection failed"]));
}

// 获取 appId 参数
$appId = isset($_POST['appId']) ? intval($_POST['appId']) : 0;

if ($appId <= 0) {
    echo json_encode(["error" => "Invalid appId"]);
    $conn->close();
    exit;
}

$sql = "UPDATE apps SET download_num = download_num + 1 WHERE id = $appId";

if ($conn->query($sql) === TRUE) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["error" => "Failed to update download number"]);
}

$conn->close();
?>