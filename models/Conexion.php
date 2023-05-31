<?php 

class Conexion {


    //Metodo estatico para conectar a la DB
    protected static function conectar() {
        //Manejo errores, si se conecto bien devuelve la instacia de PDO
        try {
             // Conexión a la DB
            return new PDO("mysql:host=localhost;dbname=pruebaTecnica", "root", "");
        } catch (PDOException $e) {
           echo "Fallo la conexión: " . $e->getMessage();
        }
    }
}