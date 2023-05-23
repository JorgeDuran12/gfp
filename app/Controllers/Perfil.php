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
        $miPerfil = $this->perfil->traer_usuario();
        // var_dump($miPerfil);

        echo view("gfp/perfil/index", [
            'tituloPagina' => 'Mi perfil',
            // 'session' => $session,
            'DatosPerfil' => $miPerfil,
        ]);
        
    }

    public function traer_informacion() {
        $miPerfil = $this->perfil->traer_usuario();
        echo json_encode($miPerfil);
    }

    
}
