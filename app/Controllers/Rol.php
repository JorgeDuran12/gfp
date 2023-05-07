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

    function verificarAutenticacion() {
        session_start();
        if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
            // header('Location: /login.php');
            return redirect()->to(base_url('/'));
    }

    public function index()
    {
        $this->verificarAutenticacion();
        
        $rol = $this->rol->where('estado', "A")->findAll();   
        $datos = ['tituloPagina' => 'Rol','roles'=>$rol];

        echo view("gestion/roles/rol", $datos);
    }
}