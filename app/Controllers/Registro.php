<?php

namespace App\Controllers;

class Registro extends BaseController
{
    public function index()
    {
        echo view("gfP/registro/movimientos", [
            'tituloPagina' => 'Mis movimientos'
        ]);
    }
}
