<?php

namespace App\Controllers;

class Login extends BaseController
{
    public function index()
    {
        $datos = ['tituloPag' => 'Login'];

        $vistaPrincipal = 
        view('componentes/head', $datos)
        // .view('componentes/navbar')
        .view('login/login')
        .view('componentes/footer');
        
        return $vistaPrincipal;
    }

    public function registro()
    {

        return view("login/registro-cuenta");
    }   
}