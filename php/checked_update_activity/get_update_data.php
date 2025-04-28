<?php
require_once '../db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $appId = $_POST['appId'] ?? null;

    if (!$appId) {
        echo json_encode(['status' => 'error', 'message' => 'Missing appId']);
        exit;
    }

    $stmt = $pdo->prepare("SELECT pkg_name, name, name_en, version, download_size, update_time, update_log, download_url FROM apps WHERE app_id = :appId");
    $stmt->bindValue(':appId', $appId, PDO::PARAM_STR);
    $stmt->execute();

    $app = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($app) {
        echo json_encode(['status' => 'ok', 'app' => $app]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'App not found']);
    }
} else {
    http_response_code(405);
    echo json_encode(['status' => 'error', 'message' => 'Method not allowed']);
}
?>