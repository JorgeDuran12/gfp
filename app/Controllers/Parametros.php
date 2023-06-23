<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\Encab_ParametrosModel;
use App\Models\ParamentrosModel;
use CodeIgniter\API\ResponseTrait;



class Parametros extends BaseController
{
    protected $detalle, $encabezado;

    use ResponseTrait;

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

public function insertar_detalle($parametro_detalle, $id_parametro_enc){
    $session = session(); 
    $id_usuario = $session->get('id_usuario');

    $returnData = array();
    $detalle = $this->detalle->verificar_existe_parametro($parametro_detalle);
     if (!empty($detalle)){
        return $this->respond('Registro ya existente', 400);
     }
     else {

        $this->detalle->insert([
            'nombre' => $parametro_detalle,
            'id_parametro_enc'=>$id_parametro_enc,
            'id_usuario_crea'=>$id_usuario,

        ]);
        return $this->respond('creando registro', 200);

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
          $encabezado_ = $this->encabezado->traer_registro($id, 'C');
          if (!empty($encabezado_)) {
              array_push($returnData, $encabezado_);    
          }
          echo json_encode($returnData);
      }
   
}
 