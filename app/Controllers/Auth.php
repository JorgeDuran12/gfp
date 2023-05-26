<?php

namespace App\Controllers;
use App\Models\UsuariosModel;
use App\Models\EmailsModel;
use App\Models\ParamentrosModel;
use App\Models\TelefonosModel;

use CodeIgniter\API\ResponseTrait;

class Auth extends BaseController
{
    protected $usuario;
    protected $email;
    protected $parametros;
    protected $telefono;

    use ResponseTrait;

    
    public function __construct()
    {
        $this->usuario = new UsuariosModel();
        $this->parametros = new ParamentrosModel();
        $this->email = new EmailsModel();
        $this->telefono = new TelefonosModel();

        helper('generar_token');
        helper('configurar_sendMail');

    }

    public function index(){

        echo view("auth/login",
         [
            'tituloPagina' => 'Inicio de sesión',
        ]);
    }
    
    public function registroPagina(){ 

        $session = session();

        $usuario = $this->usuario->where('estado', "A")->findAll();   
        $parametros = $this->parametros->obtener_encabezado_3();
        $email = $this->email->where('estado', "A")->findAll();     
        $telefono = $this->telefono->where('estado', "A")->findAll();     
      
        echo view("auth/registro_cuenta", [
            'tituloPagina' => 'Inicio de sesión',
            'usuarios'=>$usuario, 
            'parametros'=>$parametros,
            'email'=>$email,
            'telefono'=>$telefono,
            'session' => $session
        ]);
    }

    /* Metodos y pages - view (RECUPERAR CONTRASEÑA) */

    public function Recuperar_Clave_Pagina()
    {
        echo view("auth/recuperar_contraseña", [
            'tituloPagina' => 'Recuperar contraseña',
            'session' => session()
        ]);
    }
    
    public function enviar_token_pass()
    {
        //Servicio de email - Transportador
        $email = \Config\Services::email();

        $emailInput = $this->request->getPost('email');
        $nuevaPass = $this->request->getPost('nuevaPass');

        //Instanciar Modelo Usuario y traer datos
        $usuariosModel = new UsuariosModel();
        $infoUsuario = $usuariosModel->verificar_email_bd( $emailInput );
        if( $infoUsuario != null ) {
            $idUsuario = $infoUsuario['id_usuario'];
        }
        if( $emailInput ) {

          //generar token
            $caracteres = "0123456789abcdefghijklmnopqrst";
            $token = generarCaracteres($caracteres, 5);

            //Enviar token al correo respectivo
            $email->setFrom('delassalasospino2003@gmail.com');
            $email->setTo('krast646@gmail.com');
            $email->setSubject('Este es el asunto');
            $email->setMessage('Este es el mensaje');

            if($email->send()) {
                echo 'enviado';
            }else {
                echo 'no enviado';
            }

            
        }else if( $nuevaPass ){


        }

    } 

    public function verificar_token()
    {

    }

    /*  */

    public function guardar(){   

        if ($this->request->getMethod() == "post" ) {

            $password = $this->request->getPost('pass');
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            
            $this->usuario->save([    
                'usuario' => $this->request->getPost('usuario'),
                'nombre' => $this->request->getPost('nombre'),
                'apellido' => $this->request->getPost('apellido'),
                'tipo_documento' => $this->request->getPost('tipo_documento'),
                'num_documento' => $this->request->getPost('documento'),
                'pass' => $hashed_password,
            ]);
            
            $id_usuario = $this -> usuario ->insertID();

            //Traer rol de usuario
            $datos = $this->usuario->traer_info_usuario_rol( $id_usuario );

            $this -> usuario -> save([
                'id_usuario' => $id_usuario,
                'usuario_crea'=> $id_usuario
            ]);

            $this -> email -> save([
                'id_usuario' => $id_usuario,
                'usuario_crea'=> $id_usuario,
                'prioridad' => 13,
                'email' => $this -> request ->getPost('email')
            ]);

            $this -> telefono -> save([
                'id_usuario' => $id_usuario,
                'usuario_crea'=> $id_usuario,
                'prioridad' => 13,
                'numero' => $this -> request ->getPost('telefono')
            ]);

            $session = session();
            $session->set([ 
                'id_usuario' => $id_usuario,
                'usuario' => $this->request->getPost('usuario'),
                'nombre' => $this->request->getPost('nombre'),
                'apellido' => $this->request->getPost('apellido'),
                'tipo_documento' => $this->request->getPost('tipo_documento'),
                'documento' => $this->request->getPost('num_documento'),
                'emails' => $this -> request ->getPost('email'),
                'telefonos' => $this -> request ->getPost('telefono'),
                'rol' => $datos['id_rol'],
                'logged_in' => true
            ]);

            return redirect()->to('/Principal'); 
        }
    }

    public function AutenticarUsuario(){


        $email = $this->request->getPost('email');
        $password = $this->request->getPost('password');
     
        $usuarioModel = new UsuariosModel();
        $emailModel = new EmailsModel();


        $id_usuario = $emailModel->Id_Usuario_Email($email);
       
        if ($id_usuario) {
           
            $usuario = $usuarioModel->Auth_usuario($email);


            if ($usuario && isset($usuario['pass'])) {
               
                if (password_verify($password, $usuario['pass'])) {


                    $session = session();

                    //Traer rol de usuario
                    $datos = $this->usuario->traer_info_usuario_rol( $id_usuario );
                   
                    $session->set([
                        'id_usuario' => $id_usuario,
                        'usuario' => $usuario['usuario'],
                        'email' => $email,
                        'rol' => $datos['id_rol'],
                        'logged_in' => true
                    ]);
                    
                    $response['id_rol'] = $usuario['id_rol'];

                    $response['mensaje'] = '1';

                } else{
                    $response['mensaje'] = '2';
                }
            }      
        } else {
            $response['mensaje'] = '3';
        }
        return $this->response->setJSON($response);
    }

   
    public function verificar_email($email) {

        $resp = $this->usuario->verificar_email_bd($email);
        return json_encode($resp, true);

    }

    public function recuperar_contraseña_by_email($email) {
        echo 'recuperando...';
    }

    //Cerrar session destruyendo la informacion alojada en la web
    public function logout() {
        $session = session();
        $session->destroy();
        
        return redirect()->to(base_url('/'));
    }

}   