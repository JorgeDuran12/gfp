<?php

namespace App\Controllers;
use App\Models\UsuariosModel;
use App\Models\EmailsModel;
use App\Models\ParamentrosModel;

class Auth extends BaseController
{
    protected $usuario;
    protected $email;
    protected $parametros;
    
    public function __construct()
    {
        $this->usuario = new UsuariosModel();
        $this->email = new EmailsModel();
        $this->parametros = new ParamentrosModel();
    }
    
    public function index()
    {
        $usuario = $this->usuario->where('estado', "A")->findAll();   
        // $parametros = $this->parametros->where('estado', "A")->findAll();     
        $email = $this->email->where('estado', "A")->findAll();     
      
        echo view("auth/login", [
            'tituloPagina' => 'Inicio de sesión',
            'usuarios'=>$usuario, 
            // 'parametros'=>$parametros,
            'email'=>$email
        ]);
    }

    public function registroPagina()
    { 
        $usuario = $this->usuario->where('estado', "A")->findAll();   
        $parametros = $this->parametros->where('estado', "A")->findAll();    
        $email = $this->email->where('estado', "A")->findAll();     
      
        echo view("auth/registro_cuenta", [
            'tituloPagina' => 'Inicio de sesión',
            'usuarios'=>$usuario, 
            'parametros'=>$parametros,
            'email'=>$email
        ]);
    } 

    public function guardar(){   

        if ($this->request->getMethod() == "post" ) {

            $this->usuario->save([    
                'usuario' => $this->request->getPost('usuario'),
                'nombre' => $this->request->getPost('nombre'),
                'apellido' => $this->request->getPost('apellido'),
                'tipo_documento' => $this->request->getPost('tipo_documento'),
                'num_documento' => $this->request->getPost('num_documento'),
                'pass' => $this->request->getPost('password'),
                'email' => $this->request->getPost('email')
            ]);

            return redirect()->to('/');
        }
    }

    /* Metodos */
    public function logout()
    {
        $session = session();
        $session->destroy();
        return redirect()->to(base_url('/'));
    }
    // public function ValidarUsuario() {
    //     $username = $this->request->getPost('username');
    //     $password = $this->request->getPost('password');
        
    //     if( $this->request->getMethod() == 'post') {
    //         if($username && $password ) {
    //             $datos = $this->usuario->traerUsuario('usuario', $username);

    //             $infoUsuario = [
    //                 'username' => $datos['usuario'],
    //                 'rol' => $datos['id_rol']
    //             ];

    //             $session = session($infoUsuario);

    //         };
    //     };
        
    // }

}