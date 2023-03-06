<?php 
include_once('conexion.php');

$id = $_GET['id'];
/* $id = $_POST['id'];
 */
$sql = "DELETE FROM usuarios WHERE id = '$id'";

if($conexion->query($sql)){
    echo "Registro actualizado correctamente";
}
else {
    $conexion->error;
}

$conexion->close();

header('Location:eliminar.php');