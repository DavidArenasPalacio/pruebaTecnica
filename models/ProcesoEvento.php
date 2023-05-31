<?php
// Importa la clase Conexion
require_once 'Conexion.php';
//Se cambia la zona horaria
date_default_timezone_set('America/Bogota');
class ProcesoEvento extends Conexion
{

    //Funcion para obtener todos los registos  de la tabla procesoEvento, tambien se actualiza el estado del registro cuando la fecha de inicio y de cierre hayan culminado
    public static function getAllProceso()
    {
        $conexion = Conexion::conectar();
        //Consulta preperada que devuelve toodos los registros de la tabla procesoEvento con los datos asociados de la tabla actividad  
        //meotod Date para obetener solo la fecha 
        //metodo TIME para ontener solo hora, minuto, segundo

        $stmt =   $conexion->prepare("SELECT procesoEvento.*, procesoEvento.id, DATE(procesoEvento.fecha_inicio) AS fechaInicio, TIME(procesoEvento.fecha_inicio) AS horaInicio, DATE(procesoEvento.fecha_cierre) AS fechaCierre, TIME(procesoEvento.fecha_inicio) AS horaCierre, actividad.nombreSegmento FROM procesoEvento INNER JOIN actividad ON procesoEvento.actividad_id = actividad.id ORDER BY procesoEvento.id");

        if ($stmt->execute()) {
            $results = [];
            foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $row) { //Itera todos lo reguistors de vueltos de la con consulta
                $id = $row['id']; //Se obtiene la id por cada registro

                //Fecha Actual
                $fechaActual = date('Y-m-d h:i:s');

                if ($row['fecha_inicio'] < $fechaActual) { //Si la fache de inicio es menor a la fecha actual y el estado es 1,se actauliliza el estado a 2 
                    if ($row['estado'] === 1) {
                        // Actualizar el estado del proceso evento 
                        $updateStmt = $conexion->prepare("UPDATE procesoEvento SET estado = 2 WHERE id = :id");
                        $updateStmt->bindParam(":id", $id, PDO::PARAM_INT);
                        $updateStmt->execute();
                    }
                }
                if ($row['fecha_cierre'] < $fechaActual) { //Si la fache de cierre es menor a la fecha actual y el estado es 1,se actauliliza el estado a 3
                    if ($row['estado'] === 2) {
                        // Actualizar el estado del proceso evento
                        $updateStmt = $conexion->prepare("UPDATE procesoEvento SET estado = 3 WHERE id = :id");
                        $updateStmt->bindParam(":id", $id, PDO::PARAM_INT);
                        $updateStmt->execute();
                    }
                }

                $results[] = $row; //Almacenar los registro en el array
            }
            $conexion = null; // Cerrar la conexión
            return $results; //Devulve los registros obtenidos 
        }
        $conexion = null; // Cerrar la conexión
        return null; //En caso  de error devuelve null
    }

    //función para obtener el registro segun la id resivido por el parametro 
    public static function getAllProcesoOrId($id)
    {
        $conexion = Conexion::conectar();
        //Consulta preperada que devuelve el registro de la tabla procesoEvento con los datos asociados de la tabla actividad  
        //meotodo Date para obetener solo la fecha 
        //metodo TIME para ontener solo hora, minuto, segundo
        $stmt =   $conexion->prepare("SELECT procesoEvento.*, procesoEvento.id, DATE(procesoEvento.fecha_inicio) AS fechaInicio, TIME(procesoEvento.fecha_inicio) AS horaInicio, DATE(procesoEvento.fecha_cierre) AS fechaCierre, TIME(procesoEvento.fecha_inicio) AS horaCierre, actividad.nombreSegmento FROM procesoEvento INNER JOIN actividad ON procesoEvento.actividad_id = actividad.id  WHERE procesoEvento.id = :id");
        $stmt->bindParam(":id", $id, PDO::PARAM_INT);
        if ($stmt->execute()) {
            $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
            $conexion = null; // Cerrar la conexión
            return $results;//Devulve el registro obtenido
        }
        $conexion = null; // Cerrar la conexión
        return null; //En caso  de error devuelve null
    }

    //Funcion para insertar datos en la tabla procesoEvento
    public static function create($datos)
    {
        $conexion = Conexion::conectar();

        //Formatear las fechas con strtotime que nos devulve un formato UNIX, luego se convierte a una fecha normal con Date
        $horaInicio =  date('Y-m-d H:i:s', strtotime("$datos->fechaInicio $datos->horaInicio"));
        $horaCierre = date('Y-m-d H:i:s', strtotime("$datos->fechaCierre $datos->horaCierre"));

        //Consulta para insertar registro en la db
        $stmt = $conexion->prepare("INSERT INTO procesoEvento (actividad_id, objeto, descripcion, moneda, presupuesto, fecha_inicio, fecha_cierre) VALUES(:actividad_id, :objeto, :descripcion, :moneda, :presupuesto, :fecha_inicio, :fecha_cierre)");
        $stmt->bindParam(":actividad_id", $datos->actividad, PDO::PARAM_INT);
        $stmt->bindParam(":objeto", $datos->objeto, PDO::PARAM_STR);
        $stmt->bindParam(":descripcion", $datos->descripcion, PDO::PARAM_STR);
        $stmt->bindParam(":moneda", $datos->moneda, PDO::PARAM_STR);
        $stmt->bindParam(":presupuesto", $datos->presupuesto, PDO::PARAM_INT);
        $stmt->bindParam(":fecha_inicio", $horaInicio, PDO::PARAM_STR);
        $stmt->bindParam(":fecha_cierre", $horaCierre, PDO::PARAM_STR);

        if ($stmt->execute()) {
            echo json_encode($conexion->lastInsertId());//Devulve el utilmo Id de la db, esto nos trae la id del registro que se acaba de hacer, para luego mandarlo a la vista y poder asociarlo con el registo de la documentación de oferta
        }

        $conexion = null; // Cerrar la conexión
        return null; //En caso  de error devuelve null
    }
}
