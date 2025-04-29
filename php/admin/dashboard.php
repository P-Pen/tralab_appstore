<?php
// 管理后台主界面
session_start();

if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: index.php');
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['logout'])) {
    session_destroy();
    header('Location: index.php');
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
</head>
<body>
    <h1>Admin Dashboard</h1>
    <nav>
        <ul>
            <li><a href="manage_apps.php">Manage Apps</a></li>
            <li><a href="manage_classifications.php">Manage Classifications</a></li>
            <li><a href="manage_updates.php">Manage Updates</a></li>
            <li><a href="view_logs.php">View Logs</a></li>
            <li><a href="manage_users.php">Manage Users</a></li>
            <li><a href="statistics.php">Statistics</a></li>
        </ul>
    </nav>
    <form method="POST">
        <button type="submit" name="logout">Logout</button>
    </form>
</body>
</html>