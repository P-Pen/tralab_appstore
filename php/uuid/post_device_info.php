<?php
require_once '../db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $deviceID = $_POST['deviceID'];
    $osVersion = $_POST['deviceOSVer'];
    $imei = $_POST['deviceIMEI'];
    $androidID = $_POST['deviceAndroidId'];
    $serial = $_POST['deviceSerial'];
    $appVerName = $_POST['appVerName'];
    $appVerCode = $_POST['appVerCode'];

    $stmt = $pdo->prepare("INSERT INTO devices (device_id, os_version, imei, android_id, serial, app_version_name, app_version_code)
                           VALUES (?, ?, ?, ?, ?, ?, ?)
                           ON DUPLICATE KEY UPDATE os_version = VALUES(os_version), app_version_name = VALUES(app_version_name), app_version_code = VALUES(app_version_code)");
    $stmt->execute([$deviceID, $osVersion, $imei, $androidID, $serial, $appVerName, $appVerCode]);

    echo json_encode(['status' => 'ok', 'message' => 'Device info recorded']);
} else {
    http_response_code(405);
    echo json_encode(['status' => 'error', 'message' => 'Method not allowed']);
}
?>