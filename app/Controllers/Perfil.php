<?php

namespace App\Controllers;
use App\Models\UsuariosModel;

class Perfil extends BaseController
{
    protected $perfil;
    
    public function __construct()
    {
        $this->perfil = new UsuariosModel();
        // helper('auth');
    }


        
    public function index()
    {
        $session = session();
        
        $miPerfil = $this->perfil->traer_usuario($session->id_usuario);

        echo view("gfp/perfil/index", [
            'tituloPagina' => 'Mi perfil',
            'session' => $session,
            'DatosPerfil' => $miPerfil
        ]);
        
    }

    
}
