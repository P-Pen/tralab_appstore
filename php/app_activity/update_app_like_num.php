<?php
require_once '../../db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $appId = $_POST['appId'] ?? null;

    if (!$appId) {
        echo json_encode(['status' => 'error', 'message' => 'Missing appId']);
        exit;
    }

    $stmt = $pdo->prepare("UPDATE apps SET like_count = like_count + 1 WHERE app_id = :appId");
    $stmt->bindValue(':appId', $appId, PDO::PARAM_STR);
    $stmt->execute();

    echo json_encode(['status' => 'ok', 'message' => 'Like count updated']);
} else {
    http_response_code(405);
    echo json_encode(['status' => 'error', 'message' => 'Method not allowed']);
}
?>