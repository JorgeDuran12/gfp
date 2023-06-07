<?php

namespace App\Controllers;

use App\Controllers\BaseController; /*la plantilla del controlador general de codeigniter */
use App\Models\MovimientoModel;
use App\Models\ParamentrosModel;
use App\Models\DisponibleModel;
use App\Models\Encab_ParametrosModel;

// use Dompdf\Dompdf;

class Movimiento extends BaseController
{    

    protected $Movimiento;
    protected $parametros;
    protected $disponible;
    protected $encabezado;

    public function __construct()
    {
      
      $this->Movimiento = new MovimientoModel();
      $this->parametros = new ParamentrosModel();
      $this->disponible = new DisponibleModel();
      $this->encabezado = new Encab_ParametrosModel();

    }

    public function index()
    {
      $session = session();

      $Movimientos = $this-> Movimiento-> traer();
      $tipo_movimiento = $this-> parametros ->obtener_encabezado_1();

      $clase_movimiento_Model = new ParamentrosModel();
      $clase_movimiento = $clase_movimiento_Model -> obtener_encabezado_2();
      
      $disponibles = $this-> disponible ->datos_ingreso();
      
      $par_movi = new  ParamentrosModel();
      $parametro = $par_movi->obtener_parametros();

      $encabezado = $this -> encabezado -> traerDatos();

        echo view("gfp/registro/movimientos",  [
            'tituloPagina' => 'Mis movimientos',
            'tipo_movi' => $tipo_movimiento,
            'clase_movi' => $clase_movimiento,
            'movimientos' => $Movimientos,   
            'disponibles' => $disponibles,
            'parametros' => $parametro,
            'encabezado' => $encabezado,
            'misDatos' => $session,
        ]);
    }

    public function insertar()
    {
        if ($this->request->getMethod() == "post") {
                    
            $session = session();
            $id_usuario = $session->get('id_usuario');

             $id_disponible = new DisponibleModel();
             $identificador = $id_disponible->traer_id_disponible();
             
                $this->Movimiento->save([
                    // 'descripcion' => $this->request->getPost('descripcion'),
                    // 'descripcion' => $this->request->getPost('parametros_det'),
                    // 'descripcion' => $this->request->getPost('parametros_enc'),
                    'tipo_movimiento' => $this->request->getPost('tipo_movimiento'),
                    'clase_movimiento' => $this->request->getPost('clase_movimiento'),
                    'valor' => $this->request->getPost('valor'),
                    'fecha_movimiento' => $this->request->getPost('fecha_movimiento'),
                    'usuario_crea' => $id_usuario,
                ]);
                
                $this->disponible->update($identificador,[
                'ingreso' => $this->request->getPost('ingreso'),
                 'egreso' => $this->request->getPost('egreso'),
               'presupuesto_anual' => $this->request->getPost('presupuesto'),
               'id_usuario' => $id_usuario,

              ]);
            } 
            return redirect()->to(base_url('/mis_movimientos'));
        }
        
        public function calculo(){
            $Movi_model = new MovimientoModel();
            $calculo = $Movi_model -> tasa_movimiento();
        } 

        public function Params($id_parametro_enc) {
          $registros = $this->parametros->ParametrosMovimientos($id_parametro_enc);
          return $this->response->setJSON($registros);
      }
}