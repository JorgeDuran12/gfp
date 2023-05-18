<?php

namespace App\Controllers;

class Emergencia extends BaseController
{
    public function index()
    {
        echo view("gfp/fondo/emergencia", [
            'tituloPagina' => 'Fondo de emergencia'
        ]);
    }
   
}