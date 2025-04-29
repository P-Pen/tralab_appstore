<?php
require_once '../config.php';

session_start();

if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: index.php');
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['delete_app'])) {
        $appId = intval($_POST['app_id']);
        $conn->query("DELETE FROM apps WHERE id = $appId");
    } elseif (isset($_POST['add_app'])) {
        $name = $conn->real_escape_string($_POST['name']);
        $developer = $conn->real_escape_string($_POST['developer']);
        $conn->query("INSERT INTO apps (name, developer) VALUES ('$name', '$developer')");
    } elseif (isset($_POST['edit_app'])) {
        $appId = intval($_POST['app_id']);
        $name = $conn->real_escape_string($_POST['name']);
        $developer = $conn->real_escape_string($_POST['developer']);
        $conn->query("UPDATE apps SET name = '$name', developer = '$developer' WHERE id = $appId");
    }
}

$result = $conn->query("SELECT * FROM apps");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Apps</title>
</head>
<body>
    <h1>Manage Apps</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Developer</th>
            <th>Actions</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?= htmlspecialchars($row['id']) ?></td>
                <td><?= htmlspecialchars($row['name']) ?></td>
                <td><?= htmlspecialchars($row['developer']) ?></td>
                <td>
                    <form method="POST" style="display:inline;">
                        <input type="hidden" name="app_id" value="<?= $row['id'] ?>">
                        <button type="submit" name="delete_app">Delete</button>
                    </form>
                    <form method="POST" style="display:inline;">
                        <input type="hidden" name="app_id" value="<?= $row['id'] ?>">
                        <input type="text" name="name" value="<?= htmlspecialchars($row['name']) ?>" required>
                        <input type="text" name="developer" value="<?= htmlspecialchars($row['developer']) ?>" required>
                        <button type="submit" name="edit_app">Edit</button>
                    </form>
                </td>
            </tr>
        <?php endwhile; ?>
    </table>

    <h2>Add New App</h2>
    <form method="POST">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <br>
        <label for="developer">Developer:</label>
        <input type="text" id="developer" name="developer" required>
        <br>
        <button type="submit" name="add_app">Add App</button>
    </form>
</body>
</html>

<?php
$conn->close();
?>