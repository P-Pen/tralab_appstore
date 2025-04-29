<?php
require_once '../config.php';

// 根据 appId 获取应用数据
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

$sql = "SELECT developer AS app_developer, download_num AS app_download_number, download_url AS app_download_url, like_num AS app_like_number, name AS app_name_en, pkg_name AS app_pkg_name, version_code AS app_version_code, screen_shot_urls AS app_screen_shot FROM apps WHERE id = $appId";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo json_encode($row);
} else {
    echo json_encode(["error" => "App not found"]);
}

$conn->close();
?>