<?php
require_once '../../db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $appId = $_POST['appId'] ?? null;
    $comment = $_POST['comment'] ?? null;
    $deviceID = $_POST['deviceID'] ?? null;

    if (!$appId || !$comment || !$deviceID) {
        echo json_encode(['status' => 'error', 'message' => 'Missing parameters']);
        exit;
    }

    $stmt = $pdo->prepare("INSERT INTO app_comments (app_id, user_id, comment) VALUES (?, ?, ?)");
    $stmt->execute([$appId, $deviceID, $comment]);

    echo json_encode(['status' => 'ok', 'message' => 'Comment submitted']);
} else {
    http_response_code(405);
    echo json_encode(['status' => 'error', 'message' => 'Method not allowed']);
}
?>