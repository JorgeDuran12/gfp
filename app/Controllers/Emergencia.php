<?php

namespace App\Controllers;

class Emergencia extends BaseController
{

    function verificarAutenticacion() {
        session_start();
        if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
            // header('Location: /login.php');
            return redirect()->to(base_url('/'));
            exit;
        }
    }
    
    public function index()
    {
        $this->verificarAutenticacion();
        
        echo view("gfp/fondo/emergencia", [
            'tituloPagina' => 'Fondo de emergencia'
        ]);
    }
}