<?php

namespace App\Controllers;

class Principal extends BaseController
{

    public function index(){
    
        // session_start();

        // // Se verifica sí el usuario ha iniciado sesión
        // if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
        //     return redirect()->to('/');
        // }

        return view("gfp/principal/principal", [
            'tituloPagina' => 'Inicio'
        ]); 
    }

}
