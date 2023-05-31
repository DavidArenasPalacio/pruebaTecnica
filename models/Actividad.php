<?php
// Importa la clase Conexion
require_once 'Conexion.php';

class Activdad extends Conexion
{
    //Metodo para devolver  los registros de la tabla actividad
    public static function getAll()
    {   
        $conexion = Conexion::conectar();
        $stmt = $conexion->prepare("SELECT id, nombreSegmento, NombreFamilia FROM actividad ORDER BY id");

        if ($stmt->execute()) {//Si la consulta preparada es exitosa se recorre todos los resultados obtenidos y se almacena en un arreglo $results
            $results = [];
            foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $row) {
                $results[] = $row;
            }
            $conexion = null; // Cerrar la conexión
            return $results;
        }
        $conexion = null; // Cerrar la conexión
        return null;
    }
}
