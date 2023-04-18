<?php

namespace App\Controllers;

class Agenda extends BaseController
{
    public function index()
    {
        $datos = ['tituloPag' => 'Agenda'];

        $vistaPrincipal = 
        view('componentes/head', $datos)
        .view('componentes/navbar')
        .view('agenda/pago')
        .view('componentes/footer');
        
        return $vistaPrincipal;
    }
}
