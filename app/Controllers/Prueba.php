<?php

namespace App\Controllers;

class Prueba extends BaseController
{
    public function index()
    {
        $datos = ['tituloPag' => 'Emergencia'];

        $vistaPrincipal = 
        view('componentes/head', $datos)
        .view('componentes/navbar')
        .view('componentes/header')

        .view('pruebas/prueba')
        .view('componentes/footer');
        
        return $vistaPrincipal;
    }
}