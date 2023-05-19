<?php

namespace App\Controllers;

use App\Models\ProyeccionModel;
use App\Models\MovimientosModel;

class Proyeccion extends BaseController
{
    protected $proyeccion;
    protected $movimiento;
    
    public function __construct()
    
    {
        // $this->Movimineto = new MovimientoModel();
        $this->Proyeccion = new ProyeccionModel();
        
    }
   
    public function index()
    {
        $Proyeccion= $this->Proyeccion->traer();
        echo view("gfp/fondo/proyeccion_saquito", [
            'tituloPagina' => 'Proyeccion',
            'proyeccion' => $Proyeccion,
            
        ]);
    }


  
     public function Insertar(){

    //     $tp=$this->request->getPost('tp');

    //     if ($this->request->getMethod() == "post" ) {

    //         $session = session();
    //         $id_usuario = $session->get('id_usuario');

    //         if($tp == 1){
          $this->saquito->save([    
               'fecha_cuota' => $this->request->getPost('fecha_cuota'),
                'valor_cuota' => $this->request->getPost('valor_cuota'),
          //'valor' => $this->request->getPost('valor'),
              //'numero_cuota' => $this->request->getPost('numero_cuota'),
            //'cuota' => $this->request->getPost('cuota'),
               //'usuario_crea' => $id_usuario
            ]);

            
    //     } else {
    //         $this->saquito->update($this->request->getPost('id_saquito'),[
    //             'descripcion' => $this->request->getPost('descripcion'),
    //             'fecha_inicial' => $this->request->getPost('fecha_inicial'),
    //             'valor' => $this->request->getPost('valor'),
    //             'numero_cuota' => $this->request->getPost('numero_cuota'),
    //             'cuota' => $this->request->getPost('cuota'),
    //             'usuario_crea' => $id_usuario
    //         ]);
    //     }
    //         return redirect()->to(base_url('/mi_saquito'));
            
    //     }
     }
    
    // public function buscar_Registro($id_saquito){
    //     $returnData = array();
    //     $saquito_ = $this->saquito->traer_saquitos($id_saquito, 'A');
    //     if (!empty($saquito_)) {
    //         array_push($returnData, $saquito_);
    //     }
    //     echo json_encode($returnData);

    // }

}