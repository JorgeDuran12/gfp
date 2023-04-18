<?php

namespace App\Controllers;

class Saquito extends BaseController
{
    public function index()
    {
        $datos = ['tituloPag' => 'Saquito'];

        $vistaPrincipal = 
        view('componentes/head', $datos)
        .view('componentes/navbar')
        .view('agenda/pago')
        .view('fondos/saquito');
        
        return $vistaPrincipal;
    }
}