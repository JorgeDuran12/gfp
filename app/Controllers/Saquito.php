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

    public function index()
    {
        
        echo view("gfp/fondo/saquito", [
            'tituloPagina' => 'Mi saquito',
            //'saquito'=>$saquito
        ]);
    }


    /*public function traer_saquitos(){
        $datos->this->saquito->traer_saquitos();
        return json_encode($datos);
    }*/
    public function insertar()
    {
        $tp=$this->request->getPost('tp');
        if ($this->request->getMethod() == "post") {
            // Condicional Crear unos Registros
            if ($tp == 1) {
                $this->saquito->save([
                    'descripcion' => $this->request->getPost('descripcion'),
                    'fecha_inicial' => $this->request->getPost('fecha_inicial'),
                    'valor' => $this->request->getPost('valor'),
                    'cuota' => $this->request->getPost('cuota'),
                    'numero_cuotas' => $this->request->getPost('numero_cuotas')
                    
                ]);

            // Condicional Editar unos Registros
            } else {
                $this->saquito->update( 
                    $this->request->getPost('id'),
                    ['descripcion' => $this->request->getPost('descripcion'),
                    'fecha_inicial' => $this->request->getPost('fecha_inicial'),
                    'valor' => $this->request->getPost('valor'),
                    'cuota' => $this->request->getPost('cuota'),
                    'numero_cuotas' => $this->request->getPost('numero_cuotas')
                    ]
                );
            }
            return redirect()->to(base_url('/saquitos'));
        }
    }

  
    
   
}