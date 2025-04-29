<?php
// 获取开发者的所有应用
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

// 获取开发者名称
$developer = isset($_POST['developer']) ? $conn->real_escape_string($_POST['developer']) : '';

if (empty($developer)) {
    echo json_encode(["error" => "Developer name is required"]);
    $conn->close();
    exit;
}

$sql = "SELECT id, name, download_num, like_num FROM apps WHERE developer = '$developer'";
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