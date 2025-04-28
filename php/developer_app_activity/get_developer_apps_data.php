<?php
require_once '../db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $developerName = $_POST['developerName'] ?? '';

    $stmt = $pdo->prepare("SELECT id, name, logo_url, download_count AS download_num, like_count AS like_num, 'Android' AS os_type FROM apps WHERE developer = :developerName");
    $stmt->bindValue(':developerName', $developerName, PDO::PARAM_STR);
    $stmt->execute();

    $apps = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode(['status' => 'ok', 'apps' => $apps]);
} else {
    http_response_code(405);
    echo json_encode(['status' => 'error', 'message' => 'Method not allowed']);
}
?>