<?php

namespace App\Controllers;
use App\Models\UsuariosModel;
use App\Models\TelefonosModel;
use App\Models\EmailsModel;
use App\Models\ParamentrosModel;
use CodeIgniter\API\ResponseTrait;


class Perfil extends BaseController
{
    protected $usuario;
    protected $telefono;
    protected $email;
    protected $parametro;
    use ResponseTrait;
    
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

        $miPerfil = $this->usuario->traer_usuario_perfil();
        $misTelefonos = $this->telefono->traer_telefonos_by_id( $idGlobal, '10' );
        $misEmails = $this->email->traer_emails_by_id( $idGlobal, '10' );
        $parametrosTipoDoc = $this->parametro->obtener_encabezado_3();
        $parametrosPrioridad = $this->parametro->obtener_encabezado_4();

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

    //Editar informacion basica.
    public function editar_informacion() {
        $session = session();
        $idUsuario = $session->id_usuario;

          //Actualizar la informacion basica
            $this->usuario->update($idUsuario, [
                'usuario' => $this->request->getPost('usuario'),
                'nombre' => $this->request->getPost('nombres'),
                'apellido' => $this->request->getPost('apellidos'),
                'tipo_documento' => $this->request->getPost('tipo_Documento'),
                'num_documento' => $this->request->getPost('num_documento'),
            ]);

            return redirect()->to(base_url('perfil'));
        
    }

    //Editar informacion de contacto (Telefono y emails).
    public function editar_informacion_contacto() {

        $miPerfil = $this->usuario->traer_usuario();

        $inputIDPrincipalNumero = $miPerfil['id_telefono'];
        $inputIDPrincipalEmail = $miPerfil['id_email'];


        $telefonoInput = $this->request->getPost('telefonos');
        $emailInput = $this->request->getPost('emails');
        
         //Traer telefono que se va pasar de secundario a primario y eliminar
         if( $telefonoInput ) {

            $telefono = $this->telefono->traer_telefonos_by_numero( $telefonoInput );
            // $this->telefono->where('id_telefono', $telefono[0]['id_telefono'])->delete();
            $this->telefono->update($telefono[0]['id_telefono'], [
                'prioridad' => '9'
            ]);
            $this->telefono->update($inputIDPrincipalNumero, [
                'prioridad' => '10'
            ]);
            
            return redirect()->to(base_url('/perfil'));

            
            
        }else if( $emailInput ) {
            
            $email = $this->email->traer_emails_by_correo( $emailInput );
            // $this->telefono->where('id_telefono', $telefono[0]['id_telefono'])->delete();
            $this->email->update($email[0]['id_email'], [
                'prioridad' => '9'
            ]);
            $this->email->update($inputIDPrincipalEmail, [
                'prioridad' => '10'
            ]);
            
            return redirect()->to(base_url('/perfil'));
        }

       
    }

    //Traer informacion del usuario;
    public function traer_informacion() {
        $miPerfil = $this->usuario->traer_usuario();
        echo json_encode($miPerfil);
    }

    // //Traer telefonos y emails del usuario que esta logeado
    // public function traer_tels_emails() {
    //     $idGlobal = session()->get('id_usuario');
        
    //     $datos = array();

    //     $telefonos = $this->telefono->traer_telefonos_by_id( $idGlobal );
    //     $emails = $this->email->traer_emails_by_id( $idGlobal );

    //     array_push($datos, $telefonos, $emails);
    //     echo json_encode($datos);
    //     // echo json_encode($telefonos);
    // }

    //Agregar Telefonos o emails
    public function agregar_tel_email($telOrEmail, $tp)     
    {   
        $session = session();
        $idUsuario = $session->id_usuario;

        
        if( $tp == 1) {
            $telsUsuario = $this->telefono->traer_telefonos_by_id_verificar( $idUsuario );
            // echo 'telefono';

            //Recorrer cada telefono para ver si existe y es igual al ingresado
           for( $i = 0; $i < count($telsUsuario); $i++ ) {
                if( $telsUsuario[$i]['numero'] == $telOrEmail ) {
                    return $this->fail('Telefono ya existente', 400);
                    exit();
                }
            }
            
            //insertar telefono si no existe
            $this->telefono->insert([
                'numero' => $telOrEmail,
                'prioridad' => '10', //Secundarios,
                'id_usuario' => $idUsuario,
                'usuario_crea' => $idUsuario
            ]);
            return $this->respond('Numero agregado', 200);
                
            
        }else if( $tp == 2 ) {

                $emailsUsuario = $this->email->traer_emails_by_id_verificar( $idUsuario );
                // echo 'telefono';
    
                //Recorrer cada telefono para ver si existe y es igual al ingresado
               for( $i = 0; $i < count($emailsUsuario); $i++ ) {
                    if( $emailsUsuario[$i]['email'] == $telOrEmail ) {
                        return $this->fail('Correo ya existente', 400);
                        exit();
                    }
                }
                
                //insertar telefono si no existe
                $this->email->insert([
                    'email' => $telOrEmail,
                    'prioridad' => '10', //Secundarios,
                    'id_usuario' => $idUsuario,
                    'usuario_crea' => $idUsuario
                ]);

                return $this->respond('correo agregado', 200);
                
        }
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
