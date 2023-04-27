<?php

namespace App\Controllers;
use App\Models\UsuariosModel;

class Auth extends BaseController
{
    protected $usuario;
    
    public function __construct()
    {
        $this->usuario = new UsuariosModel();
    }
    
    public function index()
    {
        $datos = ['tituloPag' => 'Login'];

        $vistaPrincipal = 
        view('componentes/head', $datos)
        // .view('componentes/navbar')
        .view('usuarios/login')
        .view('componentes/footer');
        
        return $vistaPrincipal;
    }

    public function registroPagina()
    { 
        $datos = ['tituloPag' => 'Nuevo Usuario'];

        $vistaRegistro =  
        view("usuarios/registro_cuenta",$datos)
        // .view("usuarios/efecto")
        .view("componentes/footer")
        .view('componentes/head');
        return $vistaRegistro;
    } 

    /* Metodos */
    // public function Login() {
    //     $username = $this->request->getPost('username');
    //     $password = $this->request->getPost('password');
        
    //     if( $this->request->getMethod() == 'post') {
    //         if($username && $password ) {
    //             $datos = $this->usuario->traerUsuario('usuario', $username);
                

                // $infoUsuario = [
                //     'username' => $datos['usuario'],
                //     'rol' => $datos['id_rol']
                // ];
                // $session = session($infoUsuario);

            };
        };
        
    }
}



