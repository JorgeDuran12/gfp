<?php

namespace App\Controllers;
use App\Models\UsuariosModel;
use App\Models\TelefonosModel;
use App\Models\EmailsModel;
use App\Models\ParamentrosModel;

class Perfil extends BaseController
{
    protected $usuario;
    protected $telefono;
    protected $email;
    protected $parametro;
    
    public function __construct()
    {
        $this->usuario = new UsuariosModel();
        $this->telefono = new TelefonosModel();
        $this->email = new EmailsModel();
        $this->parametro = new ParamentrosModel();
        // helper('auth');
    }

    public function index()
    {
        $session = session();
        $idGlobal = $session->id_usuario;

        $miPerfil = $this->usuario->traer_usuario();
        $misTelefonos = $this->telefono->traer_telefonos_by_id( $idGlobal );
        $misEmails = $this->email->traer_emails_by_id( $idGlobal );
        $parametrosTipoDoc = $this->parametro->obtener_encabezado_3();
        $parametrosPrioridad = $this->parametro->obtener_encabezado_6();

        // var_dump($miPerfil);

        echo view("gfp/perfil/index", [
            'tituloPagina' => 'Mi perfil',
            // 'session' => $session,
            'DatosPerfil' => $miPerfil,
            'telefonos' => $misTelefonos,
            'emails' => $misEmails,
            'tipoDoc' => $parametrosTipoDoc,
            'prioridad' => $parametrosPrioridad,
            'misDatos' => $session
        ]);
        
    }

    public function editar_informacion() {
        $tp = $this->request->getPost('tp');
        if($tp === '1') {
            $this->usuario->insert(session()->get('id_usuario'), [
                'usuario' => $this->request->getPost('usuario'),
                'nombre' => $this->request->getPost('nombres'),
                'apellido' => $this->request->getPost('apellidos'),
                'tipo_documento' => $this->request->getPost('tipo_Documento'),
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

    public function agregar_tel_email()
    {

    }

    public function cambiar_clave()
    {
        $oldPass = $this->request->getPost('old_pass');
        $nuevaPass = $this->request->getPost('new_pass');

        //Hashear password nueva
        $password_hash = password_hash($nuevaPass, PASSWORD_DEFAULT);

        //Traer info usuario
        $usuario = $this->usuario->traer_usuario();

        if(password_verify($oldPass, $usuario['pass']) ) {
            $this->usuario->update($usuario['id_usuario'], [
                'pass' => $password_hash
            ]);
            return redirect()->to(base_url("perfil"))->with('estado_perfil_pass', 'true');

        }else {
            echo 'La clave antigua no coincide';
            return redirect()->to(base_url("perfil"))->with('estado_perfil_pass', 'false');
        }


    }


    
}
