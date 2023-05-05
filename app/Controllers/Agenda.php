<?php

namespace App\Controllers;
use App\Models\AgendaModel;

class Agenda extends BaseController
{

    protected $agenda;

    public function __construct()
    {
        $this->agenda = new AgendaModel();
    }

    public function index()
    {
        $datosEventos = $this->agenda->traer_todos_los_eventos();

        echo view("gfp/agenda/pago", [
            'tituloPagina' => 'Agenda de pagos',
            'eventos' => $datosEventos
        ]);
    }
}
