<?php

namespace App\Controllers;


class Principal extends BaseController
{

    public function index()
    {
        return view("gfp/principal/principal", [
            'tituloPagina' => 'Inicio'
        ]);
    }
}
