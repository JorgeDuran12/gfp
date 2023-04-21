<?php

namespace App\Controllers;

class Auth extends BaseController
{
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

    public function registro()
    { 
        $datos = ['tituloPag' => 'Nuevo Usuario'];

        $vistaRegistro =  
        view("usuarios/registro_cuenta",$datos)
        .view("usuarios/efecto")
        .view("componentes/footer")
        .view('componentes/head');
        return $vistaRegistro;
    } 
}



