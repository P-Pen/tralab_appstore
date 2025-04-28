<?php
require_once '../db.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $category = $_GET['category'] ?? 'all';
    $page = (int)($_GET['page'] ?? 1);
    $pageSize = (int)($_GET['pageSize'] ?? 20);
    $offset = ($page - 1) * $pageSize;

    $stmt = $pdo->prepare("SELECT * FROM apps WHERE category = :category OR :category = 'all' LIMIT :offset, :pageSize");
    $stmt->bindValue(':category', $category, PDO::PARAM_STR);
    $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
    $stmt->bindValue(':pageSize', $pageSize, PDO::PARAM_INT);
    $stmt->execute();

    $apps = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode(['status' => 'ok', 'apps' => $apps]);
} else {
    http_response_code(405);
    echo json_encode(['status' => 'error', 'message' => 'Method not allowed']);
}
?>