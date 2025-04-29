<?php
require_once '../config.php';

session_start();

if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: index.php');
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['delete_update'])) {
        $updateId = intval($_POST['update_id']);
        $conn->query("DELETE FROM updates WHERE id = $updateId");
    } elseif (isset($_POST['add_update'])) {
        $appId = intval($_POST['app_id']);
        $versionCode = $conn->real_escape_string($_POST['version_code']);
        $updateLog = $conn->real_escape_string($_POST['update_log']);
        $downloadSize = $conn->real_escape_string($_POST['download_size']);
        $downloadUrl = $conn->real_escape_string($_POST['download_url']);
        $conn->query("INSERT INTO updates (app_id, version_code, update_log, download_size, download_url) VALUES ($appId, '$versionCode', '$updateLog', '$downloadSize', '$downloadUrl')");
    } elseif (isset($_POST['edit_update'])) {
        $updateId = intval($_POST['update_id']);
        $versionCode = $conn->real_escape_string($_POST['version_code']);
        $updateLog = $conn->real_escape_string($_POST['update_log']);
        $downloadSize = $conn->real_escape_string($_POST['download_size']);
        $downloadUrl = $conn->real_escape_string($_POST['download_url']);
        $conn->query("UPDATE updates SET version_code = '$versionCode', update_log = '$updateLog', download_size = '$downloadSize', download_url = '$downloadUrl' WHERE id = $updateId");
    }
}

$result = $conn->query("SELECT updates.*, apps.name AS app_name FROM updates JOIN apps ON updates.app_id = apps.id");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Updates</title>
</head>
<body>
    <h1>Manage Updates</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>App Name</th>
            <th>Version Code</th>
            <th>Update Log</th>
            <th>Download Size</th>
            <th>Download URL</th>
            <th>Actions</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?= htmlspecialchars($row['id']) ?></td>
                <td><?= htmlspecialchars($row['app_name']) ?></td>
                <td><?= htmlspecialchars($row['version_code']) ?></td>
                <td><?= htmlspecialchars($row['update_log']) ?></td>
                <td><?= htmlspecialchars($row['download_size']) ?></td>
                <td><?= htmlspecialchars($row['download_url']) ?></td>
                <td>
                    <form method="POST" style="display:inline;">
                        <input type="hidden" name="update_id" value="<?= $row['id'] ?>">
                        <button type="submit" name="delete_update">Delete</button>
                    </form>
                    <form method="POST" style="display:inline;">
                        <input type="hidden" name="update_id" value="<?= $row['id'] ?>">
                        <input type="text" name="version_code" value="<?= htmlspecialchars($row['version_code']) ?>" required>
                        <textarea name="update_log" required><?= htmlspecialchars($row['update_log']) ?></textarea>
                        <input type="text" name="download_size" value="<?= htmlspecialchars($row['download_size']) ?>" required>
                        <input type="text" name="download_url" value="<?= htmlspecialchars($row['download_url']) ?>" required>
                        <button type="submit" name="edit_update">Edit</button>
                    </form>
                </td>
            </tr>
        <?php endwhile; ?>
    </table>

    <h2>Add New Update</h2>
    <form method="POST">
        <label for="app_id">App ID:</label>
        <input type="number" id="app_id" name="app_id" required>
        <br>
        <label for="version_code">Version Code:</label>
        <input type="text" id="version_code" name="version_code" required>
        <br>
        <label for="update_log">Update Log:</label>
        <textarea id="update_log" name="update_log" required></textarea>
        <br>
        <label for="download_size">Download Size:</label>
        <input type="text" id="download_size" name="download_size" required>
        <br>
        <label for="download_url">Download URL:</label>
        <input type="text" id="download_url" name="download_url" required>
        <br>
        <button type="submit" name="add_update">Add Update</button>
    </form>
</body>
</html>

<?php
$conn->close();
?>