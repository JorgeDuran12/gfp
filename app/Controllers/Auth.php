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
    }
    
    public function index()
    {   
        echo view("auth/login", [
            'tituloPagina' => 'Inicio de sesión',

        ]);
    }

    public function registroPagina(){ 
        $usuario = $this->usuario->where('estado', "A")->findAll();   
        $parametros = $this->parametros->obtener_encabezado_3();
        $email = $this->email->where('estado', "A")->findAll();     
        $telefono = $this->telefono->where('estado', "A")->findAll();     
      
        echo view("auth/registro_cuenta", [
            'tituloPagina' => 'Inicio de sesión',
            'usuarios'=>$usuario, 
            'parametros'=>$parametros,
            'email'=>$email,
            'telefono'=>$telefono
        ]);
    }

    /* Metodos */
    public function AutenticarUsuario(){
      

        $email = $this->request->getPost('email');
        $password = $this->request->getPost('password');

        $emailModel = new EmailsModel();
        $user = $emailModel->AuthEmail($email);
      
        $usuarioModel = new UsuariosModel();
        $usuario = $usuarioModel->Auth_usuario($email);

        if ($user && $usuario && $usuario['pass']) {

                 $session = session();

                 $session->set([
                    'id_usuario' => $usuario['id_usuario'],
                    'usuario' => $usuario['usuario'],
                    'email' => $user['email'],
                    'logged_in' => true
                ]);

                return redirect()->to(base_url('/Principal')); 

            }else {
                return redirect()->to(base_url('/'));
            } 
        }
    


    // public function AutenticarUsuario(){

    //         $email = $this->request->getPost('email');
    //         $password = $this->request->getPost('password');
    
    //         $emailModel = new EmailsModel();
    //         $user = $emailModel->AuthEmail($email);
          
    //         if ($user) {

    //             $usuarioModel = new UsuariosModel();
    //             $usuario = $usuarioModel->Auth_usuario($email);


    //             if ($usuario && password_verify($password, $usuario['pass'] ?? '')) {

    //                 $session = session();
    //                 $session->set([
    //                     'id_usuario' => $usuario['id_usuario'],
    //                     'usuario' => $usuario['usuario'],
    //                     'email' => $user['email'],
    //                     'logged_in' => true
    //                 ]);
    
    //                 return redirect()->to(base_url('/Principal'));
    
    //             } else {
    //                 return redirect()->to(base_url('/'));
    //             }
    //         } else {
    //             $data['error'] = 'Correo electrónico o contraseña incorrectos.';
    //         }
    // }
    
    // public function AutenticarUsuario(){
        
    //     if($this->request->getMethod() == "post" ) {

    //         // Validar el formulario de inicio de sesión y autenticar al usuario
    //         $usuario = $this->request->getPost('usu');
    //         $pass = $this->request->getPost('password');
            
    //         $usuario = $this -> usuario -> validar($usuario, $pass);
        
    //         if ($usuario) {

    //             if ($usuario && password_verify($pass, $usuario['pass'] ?? '')) {

    //                 $session = session();

    //                 $session->set([
    //                     'id_usuario' => $usuario['id_usuario'],
    //                     'usuario' => $usuario['usuario'],
    //                     'email' => $user['email'],
    //                     'logged_in' => true
    //                 ]);
    
    //                 return redirect()->to(base_url('/Principal'));
                    
    //             // $sesion_activa = session();
            
    //             // $sesion_activa ->set ([
    //             //     'id_usuario' => $usuario['id_usuario'],
    //             //     'usuario' => $usuario['usuario'],
    //             //     'inicio_sesion' => true
    //             // ]);
        
    //             // return redirect()->to('/principal');
    //             }else {
    //                 return redirect()->to('/');
    //         }
    //             return redirect()->to('/');
    //     }
    //     }
    // }

    
    public function guardar(){   

        if ($this->request->getMethod() == "post" ) {
            
            $password = $this->request->getPost('password');
            $hashed_password = password_hash($password, PASSWORD_BCRYPT, ['cost' => 8]);
            
            $this->usuario->save([    
                'usuario' => $this->request->getPost('usuario'),
                'nombre' => $this->request->getPost('nombre'),
                'apellido' => $this->request->getPost('apellido'),
                'tipo_documento' => $this->request->getPost('tipo_documento'),
                'num_documento' => $this->request->getPost('num_documento'),
                'pass' => $hashed_password
            ]);
    
            $id_usuario = $this -> usuario ->insertID(); 

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

            return redirect()->to('/principal');
        }
    }
     

    public function logout() {
        $session = session();
        $session->destroy();
        return redirect()->to(base_url('/'));
    }


}