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
        echo view("gfp/agenda/pago", [
            'tituloPagina' => 'Agenda de pagos'
        ]);
    }


    /* Metodos */
    public function buscar_eventos()
    {

       $json = [
        'Title' => 'Hola',
        'start' => '2023-05-03',
        'end' => '2023-05-03'
       ];
       echo json_encode($json);
        // $datos = $this->agenda->traer_todos_los_eventos();
        // echo json_encode($datos);
    }
}
