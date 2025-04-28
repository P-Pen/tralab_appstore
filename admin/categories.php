<?php
require_once '../php/db.php';

// 处理分类的添加、编辑和删除
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'] ?? '';
    $name = $_POST['name'] ?? '';
    $id = $_POST['id'] ?? null;

    if ($action === 'add' && $name) {
        $stmt = $pdo->prepare("INSERT INTO categories (name) VALUES (?)");
        $stmt->execute([$name]);
    } elseif ($action === 'edit' && $id && $name) {
        $stmt = $pdo->prepare("UPDATE categories SET name = ? WHERE id = ?");
        $stmt->execute([$name, $id]);
    } elseif ($action === 'delete' && $id) {
        $stmt = $pdo->prepare("DELETE FROM categories WHERE id = ?");
        $stmt->execute([$id]);
    }

    header('Location: categories.php');
    exit;
}

// 获取所有分类
$stmt = $pdo->query("SELECT * FROM categories");
$categories = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>分类管理</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">分类管理</h1>
    <form method="POST" class="mb-4">
        <input type="hidden" name="action" value="add">
        <div class="input-group">
            <input type="text" name="name" class="form-control" placeholder="新增分类名称" required>
            <button type="submit" class="btn btn-primary">添加分类</button>
        </div>
    </form>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>名称</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($categories as $category): ?>
            <tr>
                <td><?= htmlspecialchars($category['id']) ?></td>
                <td><?= htmlspecialchars($category['name']) ?></td>
                <td>
                    <form method="POST" class="d-inline">
                        <input type="hidden" name="action" value="edit">
                        <input type="hidden" name="id" value="<?= $category['id'] ?>">
                        <input type="text" name="name" value="<?= htmlspecialchars($category['name']) ?>" required>
                        <button type="submit" class="btn btn-warning btn-sm">编辑</button>
                    </form>
                    <form method="POST" class="d-inline" onsubmit="return confirm('确定删除此分类吗？');">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<?= $category['id'] ?>">
                        <button type="submit" class="btn btn-danger btn-sm">删除</button>
                    </form>
                </td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
</div>
</body>
</html>