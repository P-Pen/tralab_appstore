<?php
// 搜索应用
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

// 获取搜索关键词
$keyword = isset($_POST['keyword']) ? $conn->real_escape_string($_POST['keyword']) : '';

if (empty($keyword)) {
    echo json_encode(["error" => "Keyword is required"]);
    $conn->close();
    exit;
}

$sql = "SELECT id, name, developer, download_num, like_num FROM apps WHERE name LIKE '%$keyword%'";
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