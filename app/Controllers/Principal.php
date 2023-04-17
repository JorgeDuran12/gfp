<?php

namespace App\Controllers;

class Principal extends BaseController
{
    public function index()
    {
        $datos = ['tituloPag' => 'Inicio'];

        $vistaPrincipal = 
        view('componentes/header', $datos)
        .view('componentes/navbar');
        // .view('principal/principal')
        // .view('componentes/footer');
        
        return $vistaPrincipal;
    }
}
