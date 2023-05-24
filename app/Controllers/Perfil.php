<?php

namespace App\Controllers;
use App\Models\UsuariosModel;
use App\Models\TelefonosModel;
use App\Models\EmailsModel;

class Perfil extends BaseController
{
    protected $usuario;
    protected $telefono;
    protected $email;
    
    public function __construct()
    {
        $this->usuario = new UsuariosModel();
        $this->telefono = new TelefonosModel();
        $this->email = new EmailsModel();
        // helper('auth');
    }

    public function index()
    {
        $miPerfil = $this->usuario->traer_usuario();
        // var_dump($miPerfil);

        echo view("gfp/perfil/index", [
            'tituloPagina' => 'Mi perfil',
            // 'session' => $session,
            'DatosPerfil' => $miPerfil,
        ]);
        
    }

    public function editar_informacion() {
        $tp = $this->request->getPost('tp');
        echo 'Hola';
        if($tp === '1') {
            $this->usuario->insert(session()->get('id_usuario'), [
                'usuario' => $this->request->getPost('usuario'),
                'nombre' => $this->request->getPost('nombres'),
                'apellido' => $this->request->getPost('apellidos'),
                // 'tipo_documento' => $this->request->getPost('tipo_Documento'),
                'num_documento' => $this->request->getPost('num_documento'),
            ]);
        }
    }

    public function traer_informacion() {
        $miPerfil = $this->usuario->traer_usuario();
        echo json_encode($miPerfil);
    }

    public function traer_tels_emails() {
        $idGlobal = session()->get('id_usuario');
        
        $datos = array();

        $telefonos = $this->telefono->traer_telefonos_by_id( $idGlobal );
        $emails = $this->email->traer_emails_by_id( $idGlobal );

        array_push($datos, $telefonos, $emails);
        echo json_encode($datos);
        // echo json_encode($telefonos);
    }


    
}
