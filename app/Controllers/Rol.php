<?php

namespace App\Controllers;


use App\Controllers\BaseController;
use App\Models\AdministradorModel;



class Rol extends BaseController
{
    protected $admistrador;

    public function __construct()
    {
        $this->admistrador = new AdministradorModel();

    }

    public function index()
    {
        $admistrador = $this->admistrador->where('estado', "A")->findAll();   
        $datos = ['tituloPag' => 'Administrador','admin'=>$admistrador ];

        $vistaPrincipal = 
        view('componentes/head', $datos)
        .view('componentes/navbar')
        .view('componentes/header')

        .view('administrador/administrador')
        .view('componentes/footer');
        
        return $vistaPrincipal;
    }
}