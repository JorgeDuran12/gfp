<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\Encab_ParametrosModel;
use App\Models\ParamentrosModel;


class Parametros extends BaseController
{
    protected $detalle, $encabezado;


    public function __construct()
    {
        $this->detalle = new ParamentrosModel();
        $this->encabezado = new Encab_ParametrosModel();
    }

    public function index()
    {
        $session = session();
        $detalle = $this-> detalle ->obtener_parametros();
        $encabezado = $this->encabezado->traer1Datos();

        echo view("gestion/parametros/parametros", [
            'tituloPagina' => 'Parametros',
            'detalle' => $detalle,
            'encabezado' => $encabezado,
            'misDatos' => $session,
        ]);
    }
    

    
    public function insertar()
    {
        $tp=$this->request->getPost('tp');
        if ($this->request->getMethod() == "post") {	

            $session = session(); 
            $id_usuario = $session->get('id_usuario');

            if ($tp == 1) {
                $this->encabezado->save([
                    'nombre' => $this->request->getPost('encabezado'),
                    'id_usuario_crea' => $id_usuario
                ]);

             } else {
                    $this->encabezado->update($this->request->getPost('id'),[                    
                 'nombre' => $this->request->getPost('encabezado'),
              
                
                   ]);
                }
            return redirect()->to(base_url('/parametros'));
        }
    }


          //<---------------------------------buscar_parametro del model traer_parametro -------------------------------------->
      public function buscar_parametro($id)
      {
          $returnData = array();
          $encabezado_ = $this->encabezado->traer_parametro($id, 'A');
          if (!empty($encabezado_)) {
              array_push($returnData, $encabezado_);    
          }
          echo json_encode($returnData);
      }

         public function buscar_detalles($id)
      {
          $returnData = array();
          $encabezado_ = $this->encabezado->traer_registro($id, 'A');
          if (!empty($encabezado_)) {
              array_push($returnData, $encabezado_);    
          }
          echo json_encode($returnData);
      }
   
}
 