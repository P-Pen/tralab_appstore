<?php
require_once '../config.php';

// 获取分类下的所有应用
header('Content-Type: application/json');

// 创建连接
$conn = new mysqli($servername, $username, $password, $dbname);

// 检查连接
if ($conn->connect_error) {
    die(json_encode(["error" => "Database connection failed"]));
}

// 获取分类 ID
$classificationId = isset($_POST['classificationId']) ? intval($_POST['classificationId']) : 0;

if ($classificationId <= 0) {
    echo json_encode(["error" => "Invalid classification ID"]);
    $conn->close();
    exit;
}

$sql = "SELECT apps.id, apps.name, apps.developer, apps.download_num, apps.like_num FROM apps 
        JOIN app_classifications ON apps.id = app_classifications.app_id 
        WHERE app_classifications.classification_id = $classificationId";
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