<?php
require_once '../php/db.php';

$appId = $_GET['id'] ?? null;
if (!$appId) {
    die('缺少应用 ID');
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $category = $_POST['category'];
    $description = $_POST['description'];
    $developer = $_POST['developer'];
    $version = $_POST['version'];
    $size = $_POST['size'];
    $downloadUrl = $_POST['download_url'];

    $stmt = $pdo->prepare("UPDATE apps SET name = ?, category = ?, description = ?, developer = ?, version = ?, size = ?, download_url = ? WHERE id = ?");
    $stmt->execute([$name, $category, $description, $developer, $version, $size, $downloadUrl, $appId]);

    header('Location: index.php');
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM apps WHERE id = ?");
$stmt->execute([$appId]);
$app = $stmt->fetch(PDO::FETCH_ASSOC);
if (!$app) {
    die('应用不存在');
}
?>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑应用</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">编辑应用</h1>
    <form method="POST">
        <div class="mb-3">
            <label for="name" class="form-label">应用名称</label>
            <input type="text" class="form-control" id="name" name="name" value="<?= htmlspecialchars($app['name']) ?>" required>
        </div>
        <div class="mb-3">
            <label for="category" class="form-label">分类</label>
            <input type="text" class="form-control" id="category" name="category" value="<?= htmlspecialchars($app['category']) ?>" required>
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">描述</label>
            <textarea class="form-control" id="description" name="description" rows="3" required><?= htmlspecialchars($app['description']) ?></textarea>
        </div>
        <div class="mb-3">
            <label for="developer" class="form-label">开发者</label>
            <input type="text" class="form-control" id="developer" name="developer" value="<?= htmlspecialchars($app['developer']) ?>" required>
        </div>
        <div class="mb-3">
            <label for="version" class="form-label">版本</label>
            <input type="text" class="form-control" id="version" name="version" value="<?= htmlspecialchars($app['version']) ?>" required>
        </div>
        <div class="mb-3">
            <label for="size" class="form-label">大小</label>
            <input type="text" class="form-control" id="size" name="size" value="<?= htmlspecialchars($app['size']) ?>" required>
        </div>
        <div class="mb-3">
            <label for="download_url" class="form-label">下载链接</label>
            <input type="url" class="form-control" id="download_url" name="download_url" value="<?= htmlspecialchars($app['download_url']) ?>" required>
        </div>
        <button type="submit" class="btn btn-primary">保存</button>
        <a href="index.php" class="btn btn-secondary">取消</a>
    </form>
</div>
</body>
</html>