<?php
// 获取首页推荐的应用列表
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

$sql = "SELECT id, name, developer, download_num, like_num FROM apps ORDER BY download_num DESC LIMIT 10";
$result = $conn->query($sql);

$apps = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $apps[] = $row;
    }
}

echo json_encode(["apps" => $apps]);

$conn->close();
?>