<?php
// 数据统计页面
session_start();

if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: index.php');
    exit;
}

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "tralab_appstore";

// 创建连接
$conn = new mysqli($servername, $username, $password, $dbname);

// 检查连接
if ($conn->connect_error) {
    die("Database connection failed");
}

// 获取统计数据
$totalApps = $conn->query("SELECT COUNT(*) AS count FROM apps")->fetch_assoc()['count'];
$totalDownloads = $conn->query("SELECT SUM(download_num) AS total FROM apps")->fetch_assoc()['total'];
$totalLikes = $conn->query("SELECT SUM(like_num) AS total FROM apps")->fetch_assoc()['total'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Statistics</title>
</head>
<body>
    <h1>Statistics</h1>
    <ul>
        <li>Total Apps: <?= htmlspecialchars($totalApps) ?></li>
        <li>Total Downloads: <?= htmlspecialchars($totalDownloads) ?></li>
        <li>Total Likes: <?= htmlspecialchars($totalLikes) ?></li>
    </ul>
</body>
</html>

<?php
$conn->close();
?>