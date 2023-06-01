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
        $session = session();
        $idUsuarioglobal = $session->id_usuario;

        $datosEventos = $this->agenda->traer_todos_los_eventos_por_usuario($idUsuarioglobal);

        echo view("gfp/agenda/pago", [
            'tituloPagina' => 'Agenda de pagos',
            'eventos' => $datosEventos,
            'session' => $session,
            'misDatos' => $session,
        ]);
        
    }

    /* Metodos */ 
    public function insertar() {

        $session = session();
        $idUsuarioglobal = $session->id_usuario;

        echo $id = $this->request->getPost('id');
        echo $titulo = $this->request->getPost('titulo');
        echo $descripcion = $this->request->getPost('descripcion');
        echo $fechaInicial = $this->request->getPost('fechaInicio');
        echo $fechaFinal = $this->request->getPost('fechaFinal');
        echo $color = $this->request->getPost('color');

        if( $id && $this->request->getMethod('post') ) {
            
            $this->agenda->update($id, [
                'title' => $titulo,
                'descripcion' => $descripcion,
                'start' => $fechaInicial,
                'end' => $fechaFinal,
                'color' => $color,
                'id_usuario' => $idUsuarioglobal
            ]);
            
            return redirect()->to(base_url("Agenda"))->with('mensaje', '5' );

        }else if( $this->request->getMethod('post') ) {
            echo 'Creando...';
            $this->agenda->insert([
                'title' => $titulo,
                'descripcion' => $descripcion,  
                'start' => $fechaInicial,
                'end' => $fechaFinal,
                'color' => $color,
                'id_usuario' => $idUsuarioglobal
            ]);

            return redirect()->to(base_url("Agenda"))->with('mensaje', '6');
        }
        // return redirect()->to(base_url("Agenda"));
    }


    public function eliminar($id) {
        $this->agenda->where('id_agenda', $id)->delete();
    }

    public function prueba() {

    }
}
