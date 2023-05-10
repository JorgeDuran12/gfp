<?php

namespace App\Controllers;

class Progreso_Saquito extends BaseController
{

    public function index()
    {
        $datos = ['tituloPag' => 'Saquito'];

        $vistaPrincipal = 
        //view('componentes/head', $datos)
        .//view('componentes/navbar')
        .//view('componentes/header')
        .view('fondos/progreso_saquito')
        .//view('componentes/footer');

        return $vistaPrincipal;
    }
}