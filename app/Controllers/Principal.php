<?php

namespace App\Controllers;

class Principal extends BaseController
{

    public function index(){

        $datos = session();
    
        return view("gfp/principal/principal", [
            'tituloPagina' => 'Inicio',
            'misDatos' => $datos
        ]); 
    }

}
