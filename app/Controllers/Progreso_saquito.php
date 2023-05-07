<?php

namespace App\Controllers;

class Progreso_Saquito extends BaseController
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
      
        $datos = ['tituloPag' => 'Saquito'];

        $vistaPrincipal = 
        view('componentes/head', $datos)
        .view('componentes/navbar')
        .view('componentes/header')
        .view('fondos/progreso_saquito')
        .view('componentes/footer');

        
        return $vistaPrincipal;
    }
}