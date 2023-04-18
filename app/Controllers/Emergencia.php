<?php

namespace App\Controllers;

class Emergencia extends BaseController
{
    public function index()
    {
        $datos = ['tituloPag' => 'Emergencia'];

        $vistaPrincipal = 
        view('componentes/head', $datos)
        .view('componentes/navbar')
        .view('fondos/emergencia')
        .view('componentes/footer');
        
        return $vistaPrincipal;
    }
}