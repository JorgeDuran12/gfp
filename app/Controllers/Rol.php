<?php

namespace App\Controllers;


use App\Controllers\BaseController;
use App\Models\RolModel;



class Rol extends BaseController
{
    protected $rol;

    public function __construct()
    {
        $this->rol = new RolModel();

    }

    public function index()
    {
        $rol = $this->rol->where('estado', "A")->findAll();   
        $datos = ['tituloPag' => 'Rol','roles'=>$rol];

        $vistaPrincipal = 
        view('componentes/head', $datos)
        .view('componentes/navbar')
        .view('componentes/header')

        .view('roles/rol')
        .view('componentes/footer');
        
        return $vistaPrincipal;
    }
}