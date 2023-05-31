<?php
require_once "../models/ProcesoEvento.php";

// Establece los encabezados para permitir el acceso a los datos
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET, POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Obtener la peticón
$metodo = $_SERVER["REQUEST_METHOD"];

//Obtener los datos de la solcitud, y luego se convirte a JSON
$datos = json_decode(file_get_contents("php://input"));

// Manejar la solicitud según la petición
switch ($metodo) {
    case 'GET':
        /* echo json_encode($datos);
        die(); */
        if (!empty($_GET['id'])) { //Si el pametro id contiene algo devulve el registro encontrado en la db
            // Llamar al método "ProcesoEventoController" del controlador 
            $response = ProcesoEventoController::getAllProcesoOrId($_GET['id']);
        } else { //Si no, devuelve todos los registros
            // Llamar al método "ProcesoEventoController" del controlador
            $response = ProcesoEventoController::index();
        }
        break;

    case 'POST':
        // Llamar al método "create"
        ProcesoEventoController::create($datos);
        break;
}

class ProcesoEventoController
{

    //Funcion para obtener todos los registros de la tabla procesoEvento 
    public static function index()
    {
        $actividades = ProcesoEvento::getAllProceso();
        echo json_encode($actividades);
    }

    //Funcion para obtener registro  según el parametro de entrada
    public static function getAllProcesoOrId($id)
    {
        // Obtener el registro  de la tabla ProcesoEvento según el parametro de entrada utilizando del metodo getAllProcesoOrId
        $result = ProcesoEvento::getAllProcesoOrId($id);

        // Convertir el resultado a formato JSON y devuelve la respuesta
        echo json_encode($result);
    }

     //funcion para crear registro 
    public static function create($datos)
    {
         //Metodo statico para crear registro a la tabla ProcesoEvento
        $result = ProcesoEvento::create($datos);
        
        // Convertir el resultado a formato JSON y devuelve la respuesta
        return json_encode($result);
    }
}
