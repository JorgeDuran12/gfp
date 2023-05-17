<?php

namespace App\Controllers;
use App\Models\UsuariosModel;
use App\Models\TelefonosModel;

class Perfil extends BaseController
{
    protected $perfil;
    protected $telefono;
    
    public function __construct()
    {
        $this->perfil = new UsuariosModel();
        $this->telefono = new TelefonosModel();
        // helper('auth');
    }

    public function index()
    {
        $session = session();
        
        $miPerfil = $this->perfil->traer_usuario($session->id_usuario);
        $telefono = $this->telefono-> Perfiltelefono();
       
        echo view("gfp/perfil/index", [
            'tituloPagina' => 'Mi perfil',
            'session' => $session,
            'DatosPerfil' => $miPerfil,
            'dataTelefono' => $telefono
        ]);
        
    }

    
}
