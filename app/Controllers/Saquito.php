<?php

namespace App\Controllers;

use App\Models\SaquitoModel;

class Saquito extends BaseController
{
    protected $saquito;

    public function __construct()
    
    {
        $this->saquito = new SaquitoModel();
        
    }

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
        
        echo view("gfp/fondo/saquito", [
            'tituloPagina' => 'Mi saquito',
            //'saquito'=>$saquito
        ]);
    }

  
    public function Guadar()
    {
        if ($this->request->getMethod() == "post" ) {
            $this->saquito->save([    
                'descripcion' => $this->request->getPost('descripcion'),
                'fecha_inicial' => $this->request->getPost('fecha_inicial'),
                'valor' => $this->request->getPost('valor'),
                'cuota' => $this->request->getPost('cuota'),
                'numero_cuotas' => $this->request->getPost('numero_cuota'),
            ]);

       
            return redirect()->to(base_url('/saquitos'));
        }
    }
}


  
    
   
