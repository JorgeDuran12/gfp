<?php

namespace App\Controllers;

use App\Controllers\BaseController; /*la plantilla del controlador general de codeigniter */
use App\Models\MovimientoModel;
use App\Models\ParamentrosModel;
use Dompdf\Dompdf;


class Movimiento extends BaseController

 {   
  
  // public function demoPDF(){
//   $dompdf = new Dompdf();
//   $dompdf->loadHTML('Movimiento');
//   $dompdf->setPaper('A4','portrait');
//   $dompdf->render();
//   $dompdf->stream();
// }


  protected $Movimiento;
  protected $parametros;

  


    public function __construct()
    {
       
      $this->Movimiento = new MovimientoModel();
      $this->parametros = new ParamentrosModel();
    }

    public function index()
    {
      // $Movimiento = $this-> Movimiento ->where('estado','A')->findAll();
      $Movimiento = $this-> Movimiento-> traer();
      $tipo_movimiento = $this-> parametros ->obtener_encabezado_1();
      $clase_movimiento_Model = new ParamentrosModel();
      $clase_movimiento = $clase_movimiento_Model -> obtener_encabezado_2();

        echo view("gfp/registro/movimientos",  [
            'tituloPagina' => 'Mis movimientos',
            'tipo_movi' => $tipo_movimiento,
            'clase_movi' => $clase_movimiento,
            'Movimientos' => $Movimiento,
            
        ],);
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
                    'usuario_crea' => $id_usuario
                ]);
            } 
            return redirect()->to(base_url('/mis_movimientos'));
        }

    
    }





        

    
   
