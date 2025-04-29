<?php
// 管理分类页面
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

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['delete_classification'])) {
        $classificationId = intval($_POST['classification_id']);
        $conn->query("DELETE FROM classifications WHERE id = $classificationId");
    } elseif (isset($_POST['add_classification'])) {
        $name = $conn->real_escape_string($_POST['name']);
        $conn->query("INSERT INTO classifications (name) VALUES ('$name')");
    } elseif (isset($_POST['edit_classification'])) {
        $classificationId = intval($_POST['classification_id']);
        $name = $conn->real_escape_string($_POST['name']);
        $conn->query("UPDATE classifications SET name = '$name' WHERE id = $classificationId");
    }
}

$result = $conn->query("SELECT * FROM classifications");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Classifications</title>
</head>
<body>
    <h1>Manage Classifications</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Actions</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?= htmlspecialchars($row['id']) ?></td>
                <td><?= htmlspecialchars($row['name']) ?></td>
                <td>
                    <form method="POST" style="display:inline;">
                        <input type="hidden" name="classification_id" value="<?= $row['id'] ?>">
                        <button type="submit" name="delete_classification">Delete</button>
                    </form>
                    <form method="POST" style="display:inline;">
                        <input type="hidden" name="classification_id" value="<?= $row['id'] ?>">
                        <input type="text" name="name" value="<?= htmlspecialchars($row['name']) ?>" required>
                        <button type="submit" name="edit_classification">Edit</button>
                    </form>
                </td>
            </tr>
        <?php endwhile; ?>
    </table>

    <h2>Add New Classification</h2>
    <form method="POST">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <br>
        <button type="submit" name="add_classification">Add Classification</button>
    </form>
</body>
</html>

<?php
$conn->close();
?>