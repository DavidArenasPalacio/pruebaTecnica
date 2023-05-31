<?php
// Importa la clase Actividad
require_once "../models/Actividad.php";

// Establece los encabezados para permitir el acceso a los datos
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Obtener la peticón
$metodo = $_SERVER["REQUEST_METHOD"];

// Manejar la solicitud según la petición
switch ($metodo) {
    case 'GET':
         // Llamar al método "index" del controlador
        $response = ActividadController::index();
    break;
}

class ActividadController
{

    //Funcion para obtener todos los registros de la tabla Actividad
    public static function index()
    {
        // Obtener todas las actividades utilizando del metodo getAll
        $actividades = Activdad::getAll();

        // Convertir el resultado a formato JSON y devuelve la respuesta
        echo json_encode($actividades);
    }
}
