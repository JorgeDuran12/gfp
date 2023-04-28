<?php

namespace App\Controllers;

class Agenda extends BaseController
{
    public function index()
    {
        echo view("gfp/agenda/pago", [
            'tituloPagina' => 'Agenda de pagos'
        ]);
    }
}
