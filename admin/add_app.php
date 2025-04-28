<?php
require_once '../php/db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $category = $_POST['category'];
    $description = $_POST['description'];
    $developer = $_POST['developer'];
    $version = $_POST['version'];
    $size = $_POST['size'];
    $downloadUrl = $_POST['download_url'];

    $stmt = $pdo->prepare("INSERT INTO apps (name, category, description, developer, version, size, download_url) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->execute([$name, $category, $description, $developer, $version, $size, $downloadUrl]);

    header('Location: index.php');
    exit;
}
?>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加应用</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">添加新应用</h1>
    <form method="POST">
        <div class="mb-3">
            <label for="name" class="form-label">应用名称</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="mb-3">
            <label for="category" class="form-label">分类</label>
            <input type="text" class="form-control" id="category" name="category" required>
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">描述</label>
            <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
        </div>
        <div class="mb-3">
            <label for="developer" class="form-label">开发者</label>
            <input type="text" class="form-control" id="developer" name="developer" required>
        </div>
        <div class="mb-3">
            <label for="version" class="form-label">版本</label>
            <input type="text" class="form-control" id="version" name="version" required>
        </div>
        <div class="mb-3">
            <label for="size" class="form-label">大小</label>
            <input type="text" class="form-control" id="size" name="size" required>
        </div>
        <div class="mb-3">
            <label for="download_url" class="form-label">下载链接</label>
            <input type="url" class="form-control" id="download_url" name="download_url" required>
        </div>
        <button type="submit" class="btn btn-primary">提交</button>
        <a href="index.php" class="btn btn-secondary">取消</a>
    </form>
</div>
</body>
</html>