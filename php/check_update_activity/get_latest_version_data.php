<?php
require_once '../db.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $stmt = $pdo->query("SELECT version_code FROM app_versions ORDER BY created_at DESC LIMIT 1");
    $latestVersion = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($latestVersion) {
        echo json_encode(['status' => 'ok', 'version_code' => $latestVersion['version_code']]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'No version data found']);
    }
} else {
    http_response_code(405);
    echo json_encode(['status' => 'error', 'message' => 'Method not allowed']);
}
?>