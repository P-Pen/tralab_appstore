<?php
require_once '../config.php';

// 管理用户页面
session_start();

if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: index.php');
    exit;
}

// 创建连接
$conn = new mysqli($servername, $username, $password, $dbname);

// 检查连接
if ($conn->connect_error) {
    die("Database connection failed");
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['delete_user'])) {
        $userId = intval($_POST['user_id']);
        $conn->query("DELETE FROM users WHERE id = $userId");
    } elseif (isset($_POST['add_user'])) {
        $username = $conn->real_escape_string($_POST['username']);
        $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
        $conn->query("INSERT INTO users (username, password) VALUES ('$username', '$password')");
    } elseif (isset($_POST['edit_user'])) {
        $userId = intval($_POST['user_id']);
        $username = $conn->real_escape_string($_POST['username']);
        $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
        $conn->query("UPDATE users SET username = '$username', password = '$password' WHERE id = $userId");
    }
}

$result = $conn->query("SELECT * FROM users");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
</head>
<body>
    <h1>Manage Users</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Actions</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?= htmlspecialchars($row['id']) ?></td>
                <td><?= htmlspecialchars($row['username']) ?></td>
                <td>
                    <form method="POST" style="display:inline;">
                        <input type="hidden" name="user_id" value="<?= $row['id'] ?>">
                        <button type="submit" name="delete_user">Delete</button>
                    </form>
                    <form method="POST" style="display:inline;">
                        <input type="hidden" name="user_id" value="<?= $row['id'] ?>">
                        <input type="text" name="username" value="<?= htmlspecialchars($row['username']) ?>" required>
                        <input type="password" name="password" placeholder="New Password" required>
                        <button type="submit" name="edit_user">Edit</button>
                    </form>
                </td>
            </tr>
        <?php endwhile; ?>
    </table>

    <h2>Add New User</h2>
    <form method="POST">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <br>
        <button type="submit" name="add_user">Add User</button>
    </form>
</body>
</html>

<?php
$conn->close();
?>