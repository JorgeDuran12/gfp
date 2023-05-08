<?php

namespace App\Controllers;
use App\Models\AgendaModel;

class Agenda extends BaseController
{
    protected $agenda;
    
    public function __construct()
    {
        $this->agenda = new AgendaModel();
        // helper('auth');
    }


        
    public function index()
    {
        $datosEventos = $this->agenda->traer_todos_los_eventos();

        echo view("gfp/agenda/pago", [
            'tituloPagina' => 'Agenda de pagos',
            'eventos' => $datosEventos
        ]);
        
    }

    /* Metodos */ 
    public function insertar() {
        echo $id = $this->request->getPost('id');
        echo $titulo = $this->request->getPost('title');
        echo $descripcion = $this->request->getPost('descripcion');
        echo $fechaInicial = $this->request->getPost('fechaInicio');
        echo $fechaFinal = $this->request->getPost('fechaFinal');
        echo $color = $this->request->getPost('color');

        if( $id && $this->request->getMethod('post') ) {
            echo 'Actualizando...';
        }else if( $this->request->getMethod('post') ) {
            echo 'Creando...';
        }
    }
}
