<?php
// 查看访问日志页面
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

$searchQuery = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['search'])) {
    $searchQuery = $conn->real_escape_string($_POST['search_query']);
}

$sql = "SELECT * FROM pv_logs";
if (!empty($searchQuery)) {
    $sql .= " WHERE page_name LIKE '%$searchQuery%'";
}
$sql .= " ORDER BY created_at DESC";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Logs</title>
</head>
<body>
    <h1>View Logs</h1>
    <form method="POST">
        <label for="search_query">Search Logs:</label>
        <input type="text" id="search_query" name="search_query" value="<?= htmlspecialchars($searchQuery) ?>">
        <button type="submit" name="search">Search</button>
    </form>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Page Name</th>
            <th>Timestamp</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?= htmlspecialchars($row['id']) ?></td>
                <td><?= htmlspecialchars($row['page_name']) ?></td>
                <td><?= htmlspecialchars($row['created_at']) ?></td>
            </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>

<?php
$conn->close();
?>