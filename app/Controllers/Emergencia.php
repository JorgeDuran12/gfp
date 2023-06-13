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

        $disponibles = $this-> disponible ->datos_ingreso();
        $emergencia = $this->emergencia->traer_fondo($id);

        echo view("gfp/fondo/emergencia", [
            'tituloPagina' => 'Fondo de emergencia',
             'emergencia' => $emergencia,
            'disponibles' => $disponibles,
            'misDatos' => $session,
        ]);
    }


    public function insertar()
    {
        $session = session();
        $id_usuario = $session->get('id_usuario');

            // Es una inserción
            $this->emergencia->save([
                'valor' => $this->request->getPost('emergencia__valor'),
                'fecha_registro' => $this->request->getPost('fecha_registro'),
                'usuario_crea' => $id_usuario,
                'id_usuario' => $id_usuario,
            ]);
 
            return redirect()->to(base_url('/emergencia'));
    }


    public function update()
    {
        if ($this->request->getMethod() == "post") {
            // Es una actualización
            $this->emergencia->update($this->request->getPost('id'),[ 
                'fecha_registro' => $this->request->getPost('editar_fecha_registra'),
                'valor' => $this->request->getPost('editar_emergencia__valor'),
            ]);
        }
    
        return redirect()->to(base_url('/emergencia'));
    }
    

    public function buscar_fondo($id_usuario)
      {
          $returnData = array();
          $usuario_ = $this->emergencia->Actualizar_fondo($id_usuario, 'A');
          if (!empty($usuario_)) {
              array_push($returnData, $usuario_);    
          }
          echo json_encode($returnData);
      }

}