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

    public function index(){

        echo view("auth/login",
         [
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
                        'logged_in' => true
                    ]);
                
                     // Redirigir según el rol del usuario
                    if ($usuario['id_rol'] === '1') {
                        return redirect()->to(base_url('/Principal'));
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

        if ($this->request->getMethod() == "post" ) {
            
            $password = $this->request->getPost('pass1');
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            
            $this->usuario->save([    
                'usuario' => $this->request->getPost('usuario'),
                'nombre' => $this->request->getPost('nombre'),
                'apellido' => $this->request->getPost('apellido'),
                'tipo_documento' => $this->request->getPost('tipo_documento'),
                'documento' => $this->request->getPost('num_documento'),
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

            return redirect()->to('/Principal');
        }
    }

    public function logout() {
        $session = session();
        $session->destroy();
       
        return redirect()->to(base_url('/'));
    }
}