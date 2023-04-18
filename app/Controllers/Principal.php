<?php

namespace App\Controllers;


class Principal extends BaseController
{
    protected $myTime;

    public function index()
    {
        $datos = ['tituloPag' => 'Inicio'];

        $vistaPrincipal = 
        view('componentes/head', $datos)
        .view('componentes/navbar')
        .view('componentes/header')
        .view('principal/principal')
        .view('componentes/footer');
        
        return $vistaPrincipal;
    }
}
