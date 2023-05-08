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
        $datos = ['tituloPagina' => 'Rol','roles'=>$rol];

        echo view("gestion/roles/rol", $datos);
    }
}