<?php
include_once('conexion.php');

$nombre = $_POST['nombre'];
$apellido = $_POST['apellido'];
$documento = $_POST['documento']; 
$direccion = $_POST['direccion'];


$sql = "INSERT INTO usuarios (nombre,apellido, documento, direccion)
VALUES ('$nombre','$apellido', '$documento', '$direccion')";


if ($conexion->query($sql)) {

    echo 'Registro Ingresado Correctamente';
} else {

    echo $conexion->error;
}


$conexion->close();

header('Location:listar.php');
