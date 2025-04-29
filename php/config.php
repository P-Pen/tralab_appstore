<?php
// 数据库配置文件
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "tralab_appstore";

// 创建数据库连接
$conn = new mysqli($servername, $username, $password, $dbname);

// 检查连接
if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}
?>