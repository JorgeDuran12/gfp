<?php

namespace App\Controllers;
use App\Models\UsuariosModel;
use App\Models\EmailsModel;
use App\Models\ParamentrosModel;
use App\Models\TelefonosModel;

class Auth extends BaseController
{
    protected $usuario;
    protected $email;
    protected $parametros;
    protected $telefono;
    
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

    public function Recuperar_Clave_Pagina(){
        echo view("auth/recuperar_contraseña", [
            'tituloPagina' => 'Recuperar contraseña',
            'session' => session()
        ]);
    }

    /* Metodos */

    //Funcion para enviar correo al email posteado (Restablecer pass)
    public function enviar_token_pass() {
        //Configurar SendMail
        $sendEmail = sendMailConfig();
        
        //Dato input
        $email  = $this->request->getPost('email');
        //Buscar usuario by Email
        $UsuariosModel = new UsuariosModel();
        $informacion = $UsuariosModel->verificar_email_bd($email);

        //Generar Token 
        $caracteres = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $token = generarCaracteres($caracteres, 30);

        if(!$informacion) {
            echo 'Correo no valido';
            exit();
        }else {
            //Insertar token al usuario en la BD
            $UsuariosModel->update($informacion['id_usuario'],[
                'token' => $token
            ]);
            
            //Enviar token al correo
            $sendEmail->setFrom('gestor@financiero.com', 'GfP - Tu mejor compañia');
            $sendEmail->setTo($informacion);
            // $sendEmail->setTo('someone@example.com');
    
            $sendEmail->setSubject('Recuperacion de contraseña');
            $sendEmail->setMessage('El codigo de restablecimiento de contraseña es : ' .$token);
    
            // $sendEmail->send();
            $sendEmail->send(); 

            return redirect()->to(base_url("auth/Recuperar_Clave_Pagina"))->with('ok', 1);

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
                    
                    $session->set([
                        'id_usuario' => $id_usuario,
                        'usuario' => $usuario['usuario'],
                        'email' => $email,
                        'rol' => $usuario['id_rol'],
                        //este logged in sera usado en la carpeta filter
                        'logged_in' => true

                    ]);

                    if ($usuario['id_rol'] === '1') {
                        return redirect()->to(base_url('/gestion_de_administradores'));
                    } elseif ($usuario['id_rol'] === '2') {
                        return redirect()->to(base_url('/Principal'));
                    } elseif ($usuario['id_rol'] === '3') {
                        return redirect()->to(base_url('/Principal'));
                    } elseif ($usuario['id_rol'] === '4') {
                        return redirect()->to(base_url('/Principal'));
                    }

                } else{
                    echo "La contraseña no coincide con la almacenada en la base de datos.";
                    return;
                }
            }       
        } else {
            echo "El usuario no existe en la base de datos.";
            return;
        }
    }


    public function guardar(){   

        $usuarioModel = new UsuariosModel();

        if ($this->request->getMethod() == "post" ) {

                $password = $this->request->getPost('pass1');
                $hashed_password = password_hash($password, PASSWORD_DEFAULT);
                
                $this->usuario->save([    
                    'usuario' => $this->request->getPost('usuario'),
                    'nombre' => $this->request->getPost('nombre'),
                    'apellido' => $this->request->getPost('apellido'),
                    'tipo_documento' => $this->request->getPost('tipo_documento'),
                    'num_documento' => $this->request->getPost('documento'),
                    'pass' => $hashed_password
                ]);
        
                $id_usuario = $this -> usuario -> insertID(); 
    
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
    
                $this -> telefono -> save( [
                    'id_usuario' => $id_usuario,
                    'usuario_crea'=> $id_usuario,
                    'prioridad' => 13,
                    'numero' => $this -> request ->getPost('telefono')
                ]);
    
                $session = session();
                $session->set([ 
                    'usuario' => $this->request->getPost('usuario'),
                    'nombre' => $this->request->getPost('nombre'),
                    'apellido' => $this->request->getPost('apellido'),
                    'tipo_documento' => $this->request->getPost('tipo_documento'),
                    'documento' => $this->request->getPost('num_documento'),
                    'emails' => $this -> request ->getPost('email'),
                    'telefonos' => $this -> request ->getPost('telefono'),
                    'logged_in' => true
                ]);
                return redirect()->to('/Principal'); 
            
         
        }
    }

    public function verificar_email($email) {

        $resp = $this->usuario->verificar_email_bd($email);
        return json_encode($resp, true);

    }

    public function logout() {
        $session = session();
        $session->destroy();
       
        return redirect()->to(base_url('/'));
    }


    public function recuperar_contraseña_by_email($email) {
        echo 'recuperando...';
    }
}   