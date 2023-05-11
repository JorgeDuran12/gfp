<?php

namespace App\Controllers;

use App\Models\SaquitoModel;
use App\Models\UsuariosModel;

class Saquito extends BaseController
{
    protected $saquito, $usuario;
    
    public function __construct()
    
    {
        $this->usuario = new UsuariosModel();
        $this->saquito = new SaquitoModel();
        
    }
   
    public function index()
    {
         $saquitos = $this-> saquito-> traer();
        // $saquito = $this-> saquito -> traer_saquitos();
        echo view("gfp/fondo/saquito", [
            'tituloPagina' => 'Mi saquito',
            'saquito'=>$saquitos
        ]);
    }


  
    public function Insertar(){

        if ($this->request->getMethod() == "post" ) {

            $session = session();
            $id_usuario = $session->get('id_usuario');

            $this->saquito->save([    
                'descripcion' => $this->request->getPost('descripcion'),
                'fecha_inicial' => $this->request->getPost('fecha_inicial'),
                'valor' => $this->request->getPost('valor'),
                'numero_cuota' => $this->request->getPost('numero_cuota'),
                'cuota' => $this->request->getPost('cuota'),
                'usuario_crea' => $id_usuario
            ]);
            
        }
            return redirect()->to(base_url('/mi_saquito'));
            
        }
}