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
        echo view("gfp/fondo/saquito", [
            'tituloPagina' => 'Mi saquito',
            //'saquito'=>$saquito
        ]);
    }

    /*public function guardar(){
        $SaquitoModel= new SaquitoModel($db);
        $request=\confing\services::request();
        $data=array(
            'descripcion' => $this->request->getPost('descripcion'),
                'fecha_inicial' => $this->request->getPost('fecha_inicial'),
                'valor' => $this->request->getPost('valor'),
                'cuota' => $this->request->getPost('cuota'),
                'numero_cuotas' => $this->request->getPost('numero_cuota'),
        );
        if($SaquitoModel -> insert($data)===false){
            var_drump($SaquitoModel->errors());
        }
    }*/

  
    public function Insertar(){

        if ($this->request->getMethod() == "post" ) {

            $session = session();
            $this->saquito;

            $this->saquito->save([    
                'descripcion' => $this->request->getPost('descripcion'),
                'fecha_inicial' => $this->request->getPost('fecha_inicial'),
                'valor' => $this->request->getPost('valor'),
                'numero_cuota' => $this->request->getPost('numero_cuota'),
                'cuota' => $this->request->getPost('cuota'),
            ]);
            
        }
            return redirect()->to(base_url('/mi_saquito'));
            
        }
    
}