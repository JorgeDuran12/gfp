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
        $this->email = new EmailsModel();
        $this->parametros = new ParamentrosModel();
        $this->telefono = new TelefonosModel();
    }
    
    public function index()
    {   
        echo view("auth/login", [
            'tituloPagina' => 'Inicio de sesión',
            // 'usuarios'=>$usuario, 
            // 'parametros'=>$parametros,
            // 'email'=>$email
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

    public function guardar(){   

        if ($this->request->getMethod() == "post" ) {
            
            $password = $this->request->getPost('password');
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
    
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

            return redirect()->to('/');
        }
    }

    /* Metodos */

    // public function ValidarUsuario(){
     
    //     if ($this->request->getMethod() == "post" ) {

    //         $session = session();
            
    //         $email = $this->request->getPost('email');
    //         $password = $this->request->getPost('password');
            
    //         $usuario = $this -> usuario -> User_Auth($email);   

    //         // Validamos la contraseña
    //         if ($usuario && password_verify($password, $usuario['pass'])) {
    //             // Si la contraseña es correcta, creamos la sesión
    //             $session->set([
    //                 'id' => $usuario['id_usuario'],
    //                 'email' => $usuario['email'],
    //                 'isLoggedIn' => true,
    //             ]);
    //             return redirect()->to(base_url('/principal')); 
                
    //         } else {
    //             // $session->setFlashdata('error', 'El email o la contraseña son incorrectos');
    //             return redirect()->to(base_url('/'));
    //         }
    //     }
    // }

    public function ValidarUsuario(){

        $session = session();
    
        if ($this->request->getMethod() == 'post') {

            $email = $this->request->getPost('email');
            $password = $this->request->getPost('password');
    
            if (empty($email) || empty($password)) {
                $data['error'] = 'Por favor, proporcione un correo electrónico y una contraseña.';
            } else {
                $email = new EmailsModel();
                $user = $this -> email -> where('email', $email)->first();
    
                if ($user) {
                    $usuario = new UsuariosModel();
                    $usuario =this->usuario->find($user['id_usuario']);
    
                    if (password_verify($password, $usuario['pass'])) {
                        $session_data = [
                            'id_usuario' => $usuario['id_usuario'],
                            'usuario' => $usuario['usuario'],
                            'email' => $user['email'],
                            'logged_in' => TRUE
                        ];
    
                        $session->set($session_data);

                        return redirect()->to('/principal');
                    } else {
                        $data['error'] = 'Correo electrónico o contraseña incorrectos.';
                    }
                } else {
                    $data['error'] = 'Correo electrónico o contraseña incorrectos.';
                }
            }
        }
    
    }
      


    
    public function logout(){
        $session = session();
        $session->destroy();
        return redirect()->to(base_url('/'));
    }
    
}