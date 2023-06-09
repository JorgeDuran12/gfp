<?php

namespace App\Controllers;
use App\Models\MovimientoModel;
use App\Models\DisponibleModel;
use App\Models\EmergenciaModel;

class Emergencia extends BaseController
{
    protected $movimiento, $disponible, $emergencia;

    public function __construct(){

        $this->movimiento = new MovimientoModel();
        $this->disponible = new DisponibleModel();
        $this->emergencia = new EmergenciaModel();
    }
        
    public function index()
    {
        $session = session();
        $id = $session->id_usuario;

        // $movi = $this-> movimiento ->resta();
        // $movi = $this-> movimiento ->suma();

        $disponibles = $this-> disponible ->datos_ingreso();
        $emergencia = $this->emergencia->traer_fondo($id);

        echo view("gfp/fondo/emergencia", [
            'tituloPagina' => 'Fondo de emergencia',
            // 'suma' => $movi,
             'emergencia' => $emergencia,
            'disponibles' => $disponibles,
            // 'disponibles' => $disponibles,
            'misDatos' => $session,

        ]);
    }

    public function insertar()
    {
        $session = session(); 
        $id_usuario = $session->get('id_usuario');

        if ($this->request->getMethod() == "post") {	

                $this->emergencia->save([
                    'valor' => $this->request->getPost('emergencia__valor'),
                    'fecha_registro' => $this->request->getPost('fecha_registro'),
                    'usuario_crea' => $id_usuario,
                    'id_usuario' => $id_usuario, 
                ]);
            return redirect()->to(base_url('/emergencia'));
        }
    } 

    public function buscar_fondo($id)
      {
          $returnData = array();
          $emergencia_ = $this->emergencia->traer_fondo($id);
          var_dump($emergencia_);
          if (!empty($emergencia_)) {
              array_push($returnData, $emergencia_);    
          }
          echo json_encode($returnData);
      }



}

 