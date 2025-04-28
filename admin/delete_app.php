<?php
require_once '../php/db.php';

$appId = $_GET['id'] ?? null;
if (!$appId) {
    die('缺少应用 ID');
}

$stmt = $pdo->prepare("DELETE FROM apps WHERE id = ?");
$stmt->execute([$appId]);

header('Location: index.php');
exit;
?>