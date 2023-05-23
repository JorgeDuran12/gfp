<?php

namespace App\Controllers;

use App\Controllers\BaseController; /*la plantilla del controlador general de codeigniter */
use App\Models\MovimientoModel;
use App\Models\ParamentrosModel;
use App\Models\DisponibleModel;

use Dompdf\Dompdf;

class Movimiento extends BaseController

 {    

  protected $Movimiento;
  protected $parametros;
  protected $disponible;


    public function __construct()
    {
      
      $this->Movimiento = new MovimientoModel();
      $this->parametros = new ParamentrosModel();
      $this->disponible = new DisponibleModel();

    }

    public function index()
    {
      $Movimiento = $this-> Movimiento-> traer();
      $tipo_movimiento = $this-> parametros ->obtener_encabezado_1();
      $clase_movimiento_Model = new ParamentrosModel();
      $clase_movimiento = $clase_movimiento_Model -> obtener_encabezado_2();
      $disponibles = $this-> disponible ->datos_ingreso();

        echo view("gfp/registro/movimientos",  [
            'tituloPagina' => 'Mis movimientos',
            'tipo_movi' => $tipo_movimiento,
            'clase_movi' => $clase_movimiento,
            'Movimientos' => $Movimiento,   
            'disponibles' => $disponibles,
        ]);
    }


    public function insertar()
    {
        if ($this->request->getMethod() == "post") {
                    
            $session = session();
            $id_usuario = $session->get('id_usuario');
             
                $this->Movimiento->save([
                    'descripcion' => $this->request->getPost('descripcion'),
                    'tipo_movimiento' => $this->request->getPost('tipo_movimiento'),
                    'clase_movimiento' => $this->request->getPost('clase_movimiento'),
                    'valor' => $this->request->getPost('valor'),
                    'fecha_movimiento' => $this->request->getPost('fecha_movimiento'),
                    'usuario_crea' => $id_usuario,
                ]);
            //    $this->disponible->update($this->request->getPost('id_disponible'),[
            //     'ingreso' => $this->request->getPost('ingreso'),
            //     'egreso' => $this->request->getPost('egreso'),
            //     'presupuesto_anual' => $this->request->getPost('presupuesto_anual'),
            //    ]);
            } 
            return redirect()->to(base_url('/mis_movimientos'));
        }



        public function calculo(){
            $Movi_model = new MovimientoModel();
            $calculo = $Movi_model -> tasa_movimiento();
        }
}





        

    
   
