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
        
    function verificarAutenticacion() {
        session_start();
        if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
            // header('Location: /login.php');
            return redirect()->to(base_url('/'));
            exit;
        }
    }
    
    public function index()
    {
        $this->verificarAutenticacion();
        
        $datosEventos = $this->agenda->traer_todos_los_eventos();

        echo view("gfp/agenda/pago", [
            'tituloPagina' => 'Agenda de pagos',
            'eventos' => $datosEventos
        ]);
    }

    /* Metodos */ 
    public function insertar( ) {
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
