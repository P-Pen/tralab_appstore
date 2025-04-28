<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>应用管理后台</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">应用管理后台</h1>
    <a href="add_app.php" class="btn btn-primary mb-3">添加新应用</a>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>名称</th>
            <th>下载量</th>
            <th>点赞量</th>
            <th>Hankmi 专区</th>
            <th>推荐</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <?php
        require_once '../php/db.php';
        $stmt = $pdo->query("SELECT * FROM apps");
        $apps = $stmt->fetchAll(PDO::FETCH_ASSOC);
        foreach ($apps as $app): ?>
            <tr>
                <td><?= htmlspecialchars($app['id']) ?></td>
                <td><?= htmlspecialchars($app['name']) ?></td>
                <td><?= htmlspecialchars($app['download_count']) ?></td>
                <td><?= htmlspecialchars($app['like_count']) ?></td>
                <td><?= $app['category'] === 'hankmi' ? '是' : '否' ?></td>
                <td><?= $app['is_recommended'] ? '是' : '否' ?></td>
                <td>
                    <a href="edit_app.php?id=<?= $app['id'] ?>" class="btn btn-warning btn-sm">编辑</a>
                    <a href="delete_app.php?id=<?= $app['id'] ?>" class="btn btn-danger btn-sm" onclick="return confirm('确定删除此应用吗？');">删除</a>
                </td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
</div>
</body>
</html>