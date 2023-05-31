<?php
// Importa la clase Conexion
require_once 'Conexion.php';

class DocumentacionOferta extends Conexion
{

    //Funcion para obtener los registos de la documentacion mediante la  id que esta asociada a la tabla procesoEvento
    public static function getAllOrId($id)
    {
        $conexion = Conexion::conectar();
        $stmt =   $conexion->prepare("SELECT *, documentacionOferta.id FROM documentacionOferta INNER JOIN procesoEvento ON documentacionOferta.proceso_id = procesoEvento.id  WHERE documentacionOferta.proceso_id = :id ");
        $stmt->bindParam(":id", $id, PDO::PARAM_INT);
        if ($stmt->execute()) {//Si la consulta preparada es exitosa se recorre todos los resultados obtenidos y se almacena en un arreglo $results
            $results = [];
            foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $row) {
                $results[] = $row;
            }
            $conexion = null; // Cerrar la conexión
            return $results;
        }
        $conexion = null; // Cerrar la conexión
        return null; // O retorna un valor adecuado en caso de error
    }

    //Funcion para obtener los archivos de la documentacion mediante  id que esta asociada  a la tabla documentacionOferta
    public static function getAllDocumentProcesoId($id)
    {
        $conexion = Conexion::conectar();
        $stmt = $conexion->prepare("SELECT * FROM archivosDocumentacion WHERE documentacion_id = :id");
        $stmt->bindParam(":id", $id, PDO::PARAM_INT);

        if ($stmt->execute()) {
            $results = [];
            foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $row) {
                $results[] = $row;
            }
            $conexion = null; // Cerrar la conexión
            return $results;
        }
        $conexion = null; // Cerrar la conexión
        return null; // en caso de error, retorna null
    }

    //Función para almacenar los datos de la documentación con sus archivos correspondintes
    public static function createDocumentOferta()
    {

        $conexion = Conexion::conectar();

        //Consulta preparada para almacenar los datos en la db 
        $stmt = $conexion->prepare("INSERT INTO documentacionOferta (proceso_id, titulo, descripcion) VALUES(:proceso_id, :titulo, :descripcion)");

        $stmt->bindParam(":proceso_id", $_POST['proceso_id'], PDO::PARAM_INT);
        $stmt->bindParam(":titulo", $_POST['titulo'], PDO::PARAM_STR);
        $stmt->bindParam(":descripcion", $_POST['descripcion'], PDO::PARAM_STR);
        $stmt->execute();



        //Obtenermos el utilmo Id de la db, esto  nos trae la id del registro que se acaba de hacer
        $ultimoId = $conexion->lastInsertId();
        //ubicacion para almacenar los documentos
        $uploadsDirectory =  '../public/uploads/';


        //Itera los   achivos para despues guardarlos en la db
        foreach ($_FILES['documentos']['tmp_name'] as $key => $tmpName) {
            //Nombre del archivo
            $filename =    $_FILES['documentos']['name'][$key];


            //Se cambia el nombre del archivo, para que sea unico
            $newFilename = strtotime(date('y-m-d H:i')) . '_' . $filename;

            //Ruta archivo
            $path = $uploadsDirectory . $newFilename;

            //Guardar en la DB
            if (move_uploaded_file($_FILES['documentos']['tmp_name'][$key], $path)) {
                // Inserta los archivos en la db archivosDocumentacion
                $stmt = $conexion->prepare("INSERT INTO archivosDocumentacion (documentacion_id, filepath) VALUES (:documentacion_id, :filepath)");
                $stmt->bindParam(":documentacion_id", $ultimoId, PDO::PARAM_INT);
                $stmt->bindParam(":filepath", $path, PDO::PARAM_STR);
                $stmt->execute();
            }
        }

        $conexion = null; // Cerrar la conexión
        return null;
    }
}
