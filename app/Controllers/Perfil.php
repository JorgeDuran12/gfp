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
        $session = session();
        $idUsuario = $session->id_usuario;

        $id_telefono_pr = $this->request->getPost('id_telefono_pr');
        $id_email_pr = $this->request->getPost('id_email_pr');

            //Actualizar la informacion basica
            $this->usuario->update($idUsuario, [
                'usuario' => $this->request->getPost('usuario'),
                'nombre' => $this->request->getPost('nombres'),
                'apellido' => $this->request->getPost('apellidos'),
                'tipo_documento' => $this->request->getPost('tipo_Documento'),
                'num_documento' => $this->request->getPost('num_documento'),
            ]);

            //Traer telefono que se va pasar de secundario a primario y eliminar
            if( $this->request->getPost('telefonos') ) {

                $telefono = $this->telefono->traer_telefonos_by_numero( $this->request->getPost('telefonos') );
                $this->telefono->where('id_telefono', $telefono[0]['id_telefono'])->delete();
    
                //Actualizar el numero Principal del usuario
                $this->telefono->update($id_telefono_pr, [
                    'numero' => $this->request->getPost('telefonos')
                ]);
                
            }

            //Traer email que se va pasar de secundario a primario y eliminar
            $emailData = $this->email->traer_emails_by_correo( $this->request->getPost('emails') );
            if( !empty($emailData ) ) {
                $this->email->where('id_email', $emailData[0]['id_email'])->delete();

                //Actualizar el numero Principal del usuario
                $this->email->update($id_email_pr, [
                    'email' => $this->request->getPost('emails')
                ]);
                
            }







            return redirect()->to(base_url('perfil'));
        
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

    public function agregar_tel_email($telOrEmail, $tp)     
    {   
        $session = session();
        $idUsuario = $session->id_usuario;

        
        if( $tp == 1) {
            $telsUsuario = $this->telefono->traer_telefonos_by_id( $idUsuario );
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
                'prioridad' => '14', //Secundarios,
                'id_usuario' => $idUsuario,
                'usuario_crea' => $idUsuario
            ]);
            return $this->respond('Numero agregado', 200);
                
            
        }else if( $tp == 2 ) {

                $emailsUsuario = $this->email->traer_emails_by_id( $idUsuario );
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
                    'prioridad' => '14', //Secundarios,
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
