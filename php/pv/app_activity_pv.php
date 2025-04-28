<?php
require_once '../db.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $stmt = $pdo->prepare("INSERT INTO pv_logs (page, ip_address, user_agent) VALUES ('app_activity', :ip, :userAgent)");
    $stmt->execute([
        'ip' => $_SERVER['REMOTE_ADDR'],
        'userAgent' => $_SERVER['HTTP_USER_AGENT'] ?? 'unknown'
    ]);

    echo json_encode(['status' => 'ok', 'message' => 'Page view recorded']);
} else {
    http_response_code(405);
    echo json_encode(['status' => 'error', 'message' => 'Method not allowed']);
}
?>