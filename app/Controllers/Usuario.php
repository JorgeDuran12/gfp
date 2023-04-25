<?php

namespace App\Controllers;


use App\Controllers\BaseController;
use App\Models\UsuariosModel;



class Usuario extends BaseController
{
    protected $usuario;

    public function __construct()
    {
        $this->usuario = new UsuariosModel();

    }

    public function index()
    {
        $usuario = $this->usuario->where('estado', "A")->findAll();   
        $datos = ['tituloPag' => 'Administrador','usuarios'=>$usuario ];

        $vistaPrincipal = 
        view('componentes/head', $datos)
        .view('componentes/navbar')
        .view('componentes/header')

        .view('usuario/usuario')
        .view('componentes/footer');
        
        return $vistaPrincipal;
    }
}