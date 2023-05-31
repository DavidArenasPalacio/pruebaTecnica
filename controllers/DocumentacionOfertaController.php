<?php
// Importa la clase DocumentacionOferta
require_once "../models/DocumentacionOferta.php";

// Establece los encabezados para permitir el acceso a los datos
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET, POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Obtener la peticón
$metodo = $_SERVER["REQUEST_METHOD"];
// Manejar la solicitud según la petición
switch ($metodo) {
    case 'GET':
        /* echo json_encode($datos);
        die(); */
        if (!empty($_GET['id'])) { //Si el pametro id contiene algo devulve el registro encontrado en la db
            // Llamar al método "getAllOrId" del controlador 
            $response = DocumentacionOfertaController::getAllOrId($_GET['id']);
        }

        if (!empty($_GET['idDocumento'])) { //Si el pametro idDocumento contiene algo devulve el registro encontrado en la db
            // Llamar al método "getAllDocumentProcesoId"
            $response = DocumentacionOfertaController::getAllDocumentProcesoId($_GET['idDocumento']);
        }

        break;

    case 'POST':

        /* 
        $datos = [
            "proceso_id" => $_POST['proceso_id'],
            "titulo" => $_POST['titulo'],
            'descripcion' => $_POST['descripcion']
        ];
        */
        // Llamar al método "create"
        DocumentacionOfertaController::create();
        break;
}

class  DocumentacionOfertaController
{

    //Funcion para obtener registro  según el parametro de entrada
    public static function getAllOrId($id)
    {
        // Obtener el registro  de la tabla documentacionOferta según el parametro de entrada utilizando del metodo getAllOrId
        $result = DocumentacionOferta::getAllOrId($id);

         // Convertir el resultado a formato JSON y devuelve la respuesta
        echo json_encode($result);
    }

    ///funcion para obtener los archivos de la documentacion mediante  id 
    public static function getAllDocumentProcesoId($id)
    {
        // Obtener los archivos  según el parametro de entrada utilizando del metodo getAllDocumentProcesoId
        $result = DocumentacionOferta::getAllDocumentProcesoId($id);

         // Convertir el resultado a formato JSON y devuelve la respuesta
        echo json_encode($result);
    }

    //funcion para crear registro 
    public static function create()
    {
        //Metodo statico para crear registro a la tabla DocumentacionOferta
        $result = DocumentacionOferta::createDocumentOferta();
        // Convertir el resultado a formato JSON y devuelve la respuesta
        echo json_encode($result);
    }
}
