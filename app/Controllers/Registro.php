<?php

namespace App\Controllers;

class Registro extends BaseController
{
    public function index()
    {
        $datos = ['tituloPag' => 'Registro'];

        $vistaPrincipal = 
        view('componentes/head', $datos)
        .view('componentes/navbar')
        .view('componentes/header')
        .view('registro/movimientos')
        .view('componentes/footer');
        
        return $vistaPrincipal;
    }
}
