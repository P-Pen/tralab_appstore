<?php
// 返回版本检查的 JSON 数据
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

// 假设 build_17 是一个固定的标志位，值为 1 或 0
$build_17 = 1; // 示例值，可以根据实际需求调整

echo json_encode(["build_17" => $build_17]);

$conn->close();
?>