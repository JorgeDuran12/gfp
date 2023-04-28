<?php

namespace App\Controllers;


class Principal extends BaseController
{

    public function index()
    {
        echo view("gfp/principal/principal", [
            'tituloPagina' => 'Inicio'
        ]);
    }
}
