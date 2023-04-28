<?php

namespace App\Controllers;

class Saquito extends BaseController
{
    public function index()
    {
        echo view("gfp/fondo/saquito", [
            'tituloPagina' => 'Mi saquito'
        ]);
    }
    
}