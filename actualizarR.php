<?php

include_once('conexion.php');
//actualizar registros


$id = $_POST['id'];
$nombre = $_POST['nombre'];
$apellido = $_POST['apellido'];
$documento = $_POST['documento'];
$direccion = $_POST['direccion'];



$sql = "UPDATE usuarios SET nombre = '$nombre' , apellido = '$apellido', documento = '$documento', direccion = '$direccion' WHERE id = '$id'";

if (
    $conexion->query($sql) === TRUE
) {
    echo "Registro actualizado correctamente";
} else {

    $conexion->error;
};

$conexion->close();

header('Location:listar.php');
