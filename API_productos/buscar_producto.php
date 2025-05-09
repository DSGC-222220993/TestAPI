<?php
header("Content-Type: application/json");

// Función para generar una respuesta estándar en formato JSON
function response($status, $data = []) {
    http_response_code($status);
    
    echo json_encode([
        'status' => $status,
        'producto_nombre' => $data['producto_nombre'] ?? '',
        'producto_precio' => $data['producto_precio'] ?? '',
        'producto_imagen' => $data['producto_imagen'] ?? ''
    ]);
    exit;
}

// valida si se envio el parametro 'codigo'
if (!isset($_GET['codigo']) || empty(trim($_GET['codigo']))) {
    response(600); // Código no proporcionado
}

// conexión a bd pos
$conexion = new mysqli("localhost", "root", "", "pos");

if ($conexion->connect_error) {
    response(601); // error al conectar
}

$codigo = trim($_GET['codigo']);

// consulta
$sql = "SELECT producto_nombre, producto_precio, producto_imagen FROM productos WHERE producto_codigo = ?";
$stmt = $conexion->prepare($sql);

if (!$stmt) {
    response(602); // error en la preparación de la consulta
}

$stmt->bind_param("s", $codigo);
$stmt->execute();
$resultado = $stmt->get_result();

if ($resultado->num_rows > 0) {
    $fila = $resultado->fetch_assoc();
    response(200, $fila); // producto encontrado
} else {
    response(604); // producto no encontrado
}

$stmt->close();
$conexion->close();
?>
